import {
  EthereumAddress,
  Hex,
  serializeAndSign,
  Transaction,
  Unsigned64,
} from '@byor/shared'
import { Logger } from '@l2beat/backend-tools'
import { expect, mockFn, mockObject } from 'earl'
import { privateKeyToAccount } from 'viem/accounts'

import { AccountRepository } from '../peripherals/database/AccountRepository'
import { TransactionRepository } from '../peripherals/database/TransactionRepository'
import { BatchDownloader } from './BatchDownloader'
import { StateUpdater } from './StateUpdater'

describe(StateUpdater.name, () => {
  describe(StateUpdater.prototype.start.name, () => {
    const modelAccount = privateKeyToAccount(
      '0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80',
    )

    const modelTx1: Transaction = {
      from: EthereumAddress(modelAccount.address),
      to: EthereumAddress('0x70997970C51812dc3A010C7d01b50e0d17dc79C8'),
      value: Unsigned64(10),
      nonce: Unsigned64(1),
      fee: Unsigned64(2),
    }
    const modelTx2: Transaction = {
      from: EthereumAddress(modelAccount.address),
      to: EthereumAddress('0x70997970C51812dc3A010C7d01b50e0d17dc79C8'),
      value: Unsigned64(10),
      nonce: Unsigned64(2),
      fee: Unsigned64(2),
    }

    let modelTx1SerializedHex: Hex
    let modelTx2SerializedHex: Hex
    const PROBE_PERIOD_MS = 1_000

    before(async () => {
      modelTx1SerializedHex = await serializeAndSign(modelTx1, modelAccount)
      modelTx2SerializedHex = await serializeAndSign(modelTx2, modelAccount)
    })

    it('triggers the update since the genesis block and keeps on updating not emitting events', async () => {
      const batchDownloader = mockObject<BatchDownloader>({
        getNewBatches: mockFn()
          .resolvesToOnce([
            {
              poster: '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
              calldata: modelTx1SerializedHex,
            },
          ])
          .resolvesToOnce([])
          .resolvesToOnce([])
          .resolvesToOnce([]),
      })
      const accountRepository = mockObject<AccountRepository>({
        addOrUpdateMany: mockFn().returnsOnce([]),
        getAll: mockFn().returnsOnce([
          {
            address: EthereumAddress(
              '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
            ),
            balance: Unsigned64(1000),
            nonce: Unsigned64(0),
          },
        ]),
      })
      const transactionRepository = mockObject<TransactionRepository>({
        addMany: mockFn().returns(null),
      })
      const stateUpdater = new StateUpdater(
        accountRepository,
        transactionRepository,
        batchDownloader,
        Logger.SILENT,
        PROBE_PERIOD_MS,
      )

      await stateUpdater.update()
      await stateUpdater.update()
      await stateUpdater.update()
      await stateUpdater.update()

      expect(batchDownloader.getNewBatches).toHaveBeenCalledTimes(4)
      expect(accountRepository.getAll).toHaveBeenCalledTimes(1)
      expect(accountRepository.addOrUpdateMany).toHaveBeenOnlyCalledWith([
        {
          address: EthereumAddress(
            '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
          ),
          balance: Unsigned64(988),
          nonce: Unsigned64(1),
        },
        {
          address: EthereumAddress(
            '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
          ),
          balance: Unsigned64(2),
          nonce: Unsigned64(0),
        },
        {
          address: EthereumAddress(
            '0x70997970C51812dc3A010C7d01b50e0d17dc79C8',
          ),
          balance: Unsigned64(10),
          nonce: Unsigned64(0),
        },
      ])
    })

    it('updates since the genesis and keeps on updating emitting events after new calldata', async () => {
      const batchDownloader = mockObject<BatchDownloader>({
        getNewBatches: mockFn()
          .resolvesToOnce([
            {
              poster: '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
              calldata: modelTx1SerializedHex,
            },
          ])
          .resolvesToOnce([])
          .resolvesToOnce([
            {
              poster: '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
              calldata: modelTx2SerializedHex,
            },
          ])
          .resolvesToOnce([]),
      })
      const accountRepository = mockObject<AccountRepository>({
        addOrUpdateMany: mockFn().returns([]),
        getAll: mockFn()
          .returnsOnce([
            {
              address: EthereumAddress(
                '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
              ),
              balance: Unsigned64(1000),
              nonce: Unsigned64(0),
            },
          ])
          .returnsOnce([
            {
              address: EthereumAddress(
                '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
              ),
              balance: Unsigned64(988),
              nonce: Unsigned64(1),
            },
            {
              address: EthereumAddress(
                '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
              ),
              balance: Unsigned64(2),
              nonce: Unsigned64(0),
            },
            {
              address: EthereumAddress(
                '0x70997970C51812dc3A010C7d01b50e0d17dc79C8',
              ),
              balance: Unsigned64(10),
              nonce: Unsigned64(0),
            },
          ]),
      })
      const transactionRepository = mockObject<TransactionRepository>({
        addMany: mockFn().returns(null),
      })
      const stateUpdater = new StateUpdater(
        accountRepository,
        transactionRepository,
        batchDownloader,
        Logger.SILENT,
        PROBE_PERIOD_MS,
      )

      await stateUpdater.update()
      await stateUpdater.update()
      await stateUpdater.update()
      await stateUpdater.update()

      expect(batchDownloader.getNewBatches).toHaveBeenCalledTimes(4)
      expect(accountRepository.getAll).toHaveBeenCalledTimes(2)
      expect(accountRepository.addOrUpdateMany).toHaveBeenCalledTimes(2)
      expect(accountRepository.addOrUpdateMany).toHaveBeenCalledWith([
        {
          address: EthereumAddress(
            '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
          ),
          balance: Unsigned64(988),
          nonce: Unsigned64(1),
        },
        {
          address: EthereumAddress(
            '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
          ),
          balance: Unsigned64(2),
          nonce: Unsigned64(0),
        },
        {
          address: EthereumAddress(
            '0x70997970C51812dc3A010C7d01b50e0d17dc79C8',
          ),
          balance: Unsigned64(10),
          nonce: Unsigned64(0),
        },
      ])
      expect(accountRepository.addOrUpdateMany).toHaveBeenCalledWith([
        {
          address: EthereumAddress(
            '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
          ),
          balance: Unsigned64(976),
          nonce: Unsigned64(2),
        },
        {
          address: EthereumAddress(
            '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
          ),
          balance: Unsigned64(4),
          nonce: Unsigned64(0),
        },
        {
          address: EthereumAddress(
            '0x70997970C51812dc3A010C7d01b50e0d17dc79C8',
          ),
          balance: Unsigned64(20),
          nonce: Unsigned64(0),
        },
      ])
    })

    it('updates since the genesis and while updating does not apply error data', async () => {
      const batchDownloader = mockObject<BatchDownloader>({
        getNewBatches: mockFn()
          .resolvesToOnce([
            {
              poster: '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
              calldata: modelTx1SerializedHex,
            },
          ])
          .resolvesToOnce([
            {
              poster: '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
              calldata: '0x1234',
            },
          ])
          .resolvesToOnce([
            {
              poster: '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
              calldata: modelTx2SerializedHex,
            },
          ]),
      })
      const accountRepository = mockObject<AccountRepository>({
        addOrUpdateMany: mockFn().returns([]),
        getAll: mockFn()
          .returnsOnce([
            {
              address: EthereumAddress(
                '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
              ),
              balance: Unsigned64(1000),
              nonce: Unsigned64(0),
            },
          ])
          .returnsOnce([
            {
              address: EthereumAddress(
                '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
              ),
              balance: Unsigned64(988),
              nonce: Unsigned64(1),
            },
            {
              address: EthereumAddress(
                '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
              ),
              balance: Unsigned64(2),
              nonce: Unsigned64(0),
            },
            {
              address: EthereumAddress(
                '0x70997970C51812dc3A010C7d01b50e0d17dc79C8',
              ),
              balance: Unsigned64(10),
              nonce: Unsigned64(0),
            },
          ]),
      })
      const transactionRepository = mockObject<TransactionRepository>({
        addMany: mockFn().returns(null),
      })
      const stateUpdater = new StateUpdater(
        accountRepository,
        transactionRepository,
        batchDownloader,
        Logger.SILENT,
        PROBE_PERIOD_MS,
      )

      await stateUpdater.update()
      await stateUpdater.update()
      await stateUpdater.update()

      expect(batchDownloader.getNewBatches).toHaveBeenCalledTimes(3)
      expect(accountRepository.getAll).toHaveBeenCalledTimes(2)
      expect(accountRepository.addOrUpdateMany).toHaveBeenCalledTimes(2)
      expect(accountRepository.addOrUpdateMany).toHaveBeenCalledWith([
        {
          address: EthereumAddress(
            '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
          ),
          balance: Unsigned64(988),
          nonce: Unsigned64(1),
        },
        {
          address: EthereumAddress(
            '0xEcb9C375d3182853656221Bd2d01c14850d52D81',
          ),
          balance: Unsigned64(2),
          nonce: Unsigned64(0),
        },
        {
          address: EthereumAddress(
            '0x70997970C51812dc3A010C7d01b50e0d17dc79C8',
          ),
          balance: Unsigned64(10),
          nonce: Unsigned64(0),
        },
      ])
    })
  })
})

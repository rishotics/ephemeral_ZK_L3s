import { EthereumAddress, Unsigned64 } from '@byor/shared'
import { expect } from 'earl'

import { AccountRecord, AccountRepository } from './AccountRepository'
import { setupDatabaseTestSuite } from './test/setup'

describe(AccountRepository.name, () => {
  const database = setupDatabaseTestSuite()
  const repository = new AccountRepository(database)

  const modelAccounts1: AccountRecord[] = [
    {
      address: EthereumAddress('0xaBC9359e83FC982F036bc15e7de1250496250896'),
      balance: Unsigned64(0),
      nonce: Unsigned64(0),
    },
    {
      address: EthereumAddress('0x5a8deF4fD548050539B14bB2d24598a4b075caFb'),
      balance: Unsigned64(59),
      nonce: Unsigned64(777),
    },
  ]
  const modelAccounts2: AccountRecord[] = [
    {
      address: EthereumAddress('0xaBC9359e83FC982F036bc15e7de1250496250896'),
      balance: Unsigned64(0),
      nonce: Unsigned64(1),
    },
    {
      address: EthereumAddress('0x5a8deF4fD548050539B14bB2d24598a4b075caFb'),
      balance: Unsigned64(800),
      nonce: Unsigned64(777),
    },
  ]

  beforeEach(async () => {
    await database.migrate()
    await repository.deleteAll()
  })

  after(async () => {
    await database.close()
  })

  describe(AccountRepository.prototype.addOrUpdateMany.name, () => {
    it('updates many accounts', async () => {
      await repository.addOrUpdateMany(modelAccounts1)
      await repository.addOrUpdateMany(modelAccounts2)

      expect(await repository.getAll()).toEqual(modelAccounts2)
    })
  })

  describe(AccountRepository.prototype.getAll.name, () => {
    it('gets all', async () => {
      await repository.addOrUpdateMany(modelAccounts1)

      expect(await repository.getAll()).toEqual(modelAccounts1)
    })
  })

  describe(AccountRepository.prototype.getByAddressOrDefault.name, () => {
    it('returns empty account on one that was not inserted', async () => {
      expect(
        await repository.getByAddressOrDefault(modelAccounts1[0]!.address),
      ).toEqual(modelAccounts1[0]!)
    })

    it('gotten account that does not exist is not inserted', async () => {
      expect(
        await repository.getByAddressOrDefault(modelAccounts1[0]!.address),
      ).toEqual(modelAccounts1[0]!)
      expect(await repository.getCount()).toEqual(0)
    })

    it('returns the account that was previously inserted', async () => {
      await repository.addOrUpdateMany(modelAccounts1)

      expect(
        await repository.getByAddressOrDefault(modelAccounts1[1]!.address),
      ).toEqual(modelAccounts1[1]!)
    })
  })

  describe(AccountRepository.prototype.deleteAll.name, () => {
    it('deletes all', async () => {
      await repository.addOrUpdateMany(modelAccounts1)
      await repository.deleteAll()

      expect(await repository.getAll()).toEqual([])
    })
  })

  describe(AccountRepository.prototype.getCount.name, () => {
    it('zero on empty', async () => {
      expect(await repository.getCount()).toEqual(0)
    })

    it('many accounts', async () => {
      await repository.addOrUpdateMany(modelAccounts1)
      const result = await repository.getCount()

      expect(result).toEqual(modelAccounts1.length)
    })

    it('many accounts with deletion', async () => {
      await repository.addOrUpdateMany(modelAccounts1)
      await repository.deleteAll()
      const result = await repository.getCount()

      expect(result).toEqual(0)
    })
  })
})

import { EthereumAddress, Hex } from '@byor/shared'
import { Logger } from '@l2beat/backend-tools'
import { PublicClient, WalletClient } from 'viem'

import { abi } from '../../core/abi'
import { EthereumClient } from './EthereumClient'

export class EthereumPrivateClient extends EthereumClient {
  constructor(
    private readonly privateProvider: WalletClient,
    publicProvider: PublicClient,
    private readonly ctcContractAddress: EthereumAddress,
    logger: Logger,
  ) {
    super(publicProvider, logger)
    this.logger = this.logger.for(this)
  }

  async writeToInputsContract(batchBytes: Hex): Promise<void> {
    await this.privateProvider.writeContract({
      address: this.ctcContractAddress.toString(),
      abi: abi,
      functionName: 'appendBatch',
      args: [batchBytes.toString()],
      // NOTE(radomski): ESLint is not that smart unfortunately :(
      // eslint-disable-next-line
      account: this.privateProvider.account!,
      chain: this.privateProvider.chain,
    })
  }
}

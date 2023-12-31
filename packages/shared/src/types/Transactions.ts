import { EthereumAddress } from './EthereumAddress'
import { Hex } from './Hex'
import { Unsigned8 } from './Unsigned8'
import { Unsigned64 } from './Unsigned64'

export interface UnsignedTransaction {
  to: EthereumAddress
  value: Unsigned64
  nonce: Unsigned64
  fee: Unsigned64
}

export interface Transaction extends UnsignedTransaction {
  from: EthereumAddress
  hash?: Hex
}

export interface SignedTransaction extends Transaction {
  r: Hex
  s: Hex
  v: Unsigned8
}

export const SIGNED_TX_SIZE = 20 + 8 + 8 + 8 + 32 + 32 + 1

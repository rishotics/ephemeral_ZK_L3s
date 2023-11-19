/* eslint-disable */
import { FastifyInstance, RouteHandler } from 'fastify'
import logger from './logger'
import { GuessAppMoves } from './constant'
import { getGameContract } from './contract'
import { ethers } from 'ethers'

const playerA =
  '0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80'
const playerB =
  '0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d'
const provider = new ethers.providers.JsonRpcProvider('http://127.0.0.1:8545')
const playerASigner = new ethers.Wallet(playerA, provider)
const playerBSigner = new ethers.Wallet(playerB, provider)

export interface ServerOptions {
  server: FastifyInstance
}

export class AppSequencerApi {
  private server: FastifyInstance
  private transactionBatch: any[] = [] // Array to store transaction batches
  private gameNonce;
  signatures: string[] = [];

  constructor(options: ServerOptions) {
    this.server = options.server
    this.setupRoutes()
    this.gameNonce = 0;
  }

  private setupRoutes(): void {
    console.log('Sequencer route setuped!')
    this.server.post('/sequence', this.handleSequenceRoute())
    logger.info('Setup route for dev: /sequence/')
    return
  }

  init() {
    setInterval(() => {
        this.executeTransactionBatch()
      }, 5000) 
  }

  private handleSequenceRoute(): RouteHandler {
    // console.log('Reached here while setup !!')
    return async (req, res): Promise<void> => {
      const { method, params, jsonrpc, id } = req.body as any

      // Create and cache the transaction
      const transaction = await this.createTransaction(method, params[0])
      const signer = params[1] === 'A' ? playerASigner : playerBSigner

      if (transaction) this.cacheTransaction({ transaction, signer })

      return res.status(200).send({
        success: true,
        received: 'ok',
      })
    }
  }

  private async createTransaction(
    method: string,
    parameter: any,
  ): Promise<any> {
    // Create a transaction based on the method
    let transaction

    const gasPrice = await provider.getGasPrice()
    let signer, hash, signature;

    switch (method) {
      case GuessAppMoves.game_playerAChoose:
        signer = playerASigner
        //@ts-ignore
        transaction = await getGameContract(signer)
          .connect(signer)
          .populateTransaction.playerAMoveChoose(parameter)
        hash = ethers.utils.solidityKeccak256(['string', 'string'], [this.gameNonce, parameter]);
        signature = await signer.signMessage(hash);
        this.signatures.push(signature);
        break
      case GuessAppMoves.game_playerBChoose:
        signer = playerBSigner
        //@ts-ignore
        transaction = await getGameContract(signer)
          .connect(signer)
          .populateTransaction.playerBMoveChoose(parameter)
        hash = ethers.utils.solidityKeccak256(['string', 'string'], [this.gameNonce, parameter]);
        signature = await signer.signMessage(hash);
        this.signatures.push(signature);
        break
      case GuessAppMoves.game_playerAGuess:
        signer = playerASigner
        //@ts-ignore
        transaction = await getGameContract(signer)
          .connect(signer)
          .populateTransaction.playerAMoveGuessForPlayerB(parameter)
        hash = ethers.utils.solidityKeccak256(['string', 'string'], [this.gameNonce, parameter]);
        signature = await signer.signMessage(hash);
        this.signatures.push(signature);
        break
      case GuessAppMoves.game_playerBGuess:
        signer = playerBSigner
        //@ts-ignore
        transaction = await getGameContract(signer)
          .connect(signer)
          .populateTransaction.playerBMoveGuessForPlayerA(parameter)
        hash = ethers.utils.solidityKeccak256(['string', 'string'], [this.gameNonce, parameter]);
        signature = await signer.signMessage(hash);
        this.signatures.push(signature);
        break
    }
    this.gameNonce++;

    return { ...transaction, gasLimit: '0x186A0', gasPrice }
  }

  private cacheTransaction(object: any): void {
    this.transactionBatch.push(object)
  }

  private async executeTransactionBatch(): Promise<void> {
    console.log('Start submission...!');
    console.log('Batch length', this.transactionBatch.length);
    console.log('All signatures', this.signatures);
    for (let i = 0; i < this.transactionBatch.length; i++) {
      try {
        const { transaction, signer } = this.transactionBatch[i];
        const resp = await signer.sendTransaction(transaction)
        console.log('Response: ', resp)
      } catch (err) {
        console.log(err)
      }
    }

    this.transactionBatch = []
  }
}

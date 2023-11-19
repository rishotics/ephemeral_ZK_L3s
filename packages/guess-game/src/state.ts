/* eslint-disable */
/**
 * manage state
 * provide updated state to take action on
 * update state with local state transitions
 * submit the action to the app sequencer
 */

import { ethers } from 'ethers'
const GuessAppMoves = {
  game_playerAChoose: 'game_playerAChoose',
  game_playerBChoose: 'game_playerBChoose',
  game_playerAGuess: 'game_playerAGuess',
  game_playerBGuess: 'game_playerBGuess',
}

// this will just a local state wrapper around the solidity functions defined
export class GameLocalStateManager {
  private playerAChoose: number
  private playerBChoose: number

  private playerAWins: number
  private playerBWins: number

  readonly provider: ethers.providers.StaticJsonRpcProvider

  constructor() {
    this.playerAChoose = 1
    this.playerBChoose = 1
    this.playerAWins = 0
    this.playerBWins = 0
    this.provider = new ethers.providers.StaticJsonRpcProvider(
      'http://127.0.0.1:80/sequence',
    )
  }

  async playerAChooseNumber(_choose: number): Promise<void> {
    this.playerAChoose = _choose
    const resp = await this.provider.send(GuessAppMoves.game_playerAChoose, [_choose, 'A'])
  }

  async playerBChooseNumber(_choose: number): Promise<void> {
    this.playerBChoose = _choose
    const resp = await this.provider.send(GuessAppMoves.game_playerBChoose, [_choose, 'B'])
  }

  async playerAMakeGuess(_guess: number): Promise<boolean> {
    if (this.playerBChoose === _guess) {
      this.playerAWins++
      return true
    }
    const resp = await this.provider.send(GuessAppMoves.game_playerAGuess, [_guess, 'A'])
    return false
  }

  async playerBMakeGuess(_guess: number): Promise<boolean> {
    if (this.playerAChoose === _guess) {
      this.playerBWins++
      return true
    }
    const resp = await this.provider.send(GuessAppMoves.game_playerBGuess, [_guess, 'B'])
    return false
  }

  reset(): void {
    this.playerAChoose = 1
    this.playerBChoose = 1
    this.playerAWins = 0
    this.playerBWins = 0
  }

  get playerAWinnings(): number {
    return this.playerAWins
  }

  get playerBWinnings(): number {
    return this.playerBWins
  }
}

/**
 * init game
 * start making move by fetching the updated state
 */
import { GameLocalStateManager } from './state'

const getRandomGuess = (min: number, max: number): number => {
  return Math.floor(Math.random() * (max - min + 1)) + min
}

;void (async (): Promise<void> => {
  const game = new GameLocalStateManager()

  for (let i = 0; i < 20; i++) {
    const playerAChoosedNumber = getRandomGuess(1, 10)
    const playerBGuessedNumber = getRandomGuess(1, 10)

    await game.playerAChooseNumber(playerAChoosedNumber)
    await game.playerBMakeGuess(playerBGuessedNumber)
  }

  for (let i = 0; i < 20; i++) {
    const playerBChoosedNumber = getRandomGuess(1, 10)
    const playerAGuessedNumber = getRandomGuess(1, 10)

    await game.playerAChooseNumber(playerBChoosedNumber)
    await game.playerBMakeGuess(playerAGuessedNumber)
  }

  const playerAWinsGuesses = game.playerAWinnings
  const playerBWinsGuesses = game.playerBWinnings

  if (playerAWinsGuesses > playerBWinsGuesses) {
    console.log('Player A won the guessing game !!')
  } else if (playerBWinsGuesses > playerAWinsGuesses) {
    console.log('Player B wons the guessing game !!')
  } else console.log('Draw between Player A and Player B')
})()

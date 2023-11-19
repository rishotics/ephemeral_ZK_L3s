import React, { useState, useEffect } from 'react'
import './game.css'
import { GameLocalStateManager } from '../../state/state'
// import useWindowSize from 'react-use/lib/useWindowSize'
import Confetti from 'react-confetti'

const Game = () => {
  const [steps, setSteps] = useState(new Array(20))
  const [playerAScore, setPlayerAScore] = useState(0)
  const [playerBScore, setPlayerBScore] = useState(0)
  //   const { width, height } = useWindowSize()

  const [currentStepIndex, setCurrentStepIndex] = useState(0)
  const [winner, setWinner] = useState('')
  const [isConfetti, setIsConfetti] = useState(true)

  const getRandomGuess = (min, max) => {
    return Math.floor(Math.random() * (max - min + 1)) + min
  }

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentStepIndex((prevIndex) => (prevIndex + 1) % steps.length)
    }, 200)

    return () =>  { console.log('Interval cleared'); clearInterval(interval) }
  }, [steps.length])

  const startPlayerATurn = async () => {
    // player A -> choose
    // player B -> Guess
    setSteps(new Array(20))
    setCurrentStepIndex(0);

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

    let currentStep = []
    new Array(10).fill(undefined).map((ele, index) => {
      console.log(' index ', index)
      if (index % 2 === 0) currentStep.push('Player A Chooses')
      else currentStep.push('Player B Guesses')
    })
    new Array(10).fill(undefined).map((ele, index) => {
      if (index % 2 === 0) currentStep.push('Player B Chooses')
      else currentStep.push('Player A Guesses')
    })
    setSteps(currentStep)
    setTimeout(() => {
      setSteps([])

      if (playerAWinsGuesses > playerBWinsGuesses) {
        console.log('Player A won the guessing game !!')
        setWinner('Player A')
        setPlayerAScore((prevScore) => prevScore + 1)
      } else if (playerBWinsGuesses > playerAWinsGuesses) {
        console.log('Player B wons the guessing game !!')
        setWinner('Player B')
        setPlayerBScore((prevScore) => prevScore + 1)
      } else setWinner('None')

      setIsConfetti(true)
      setTimeout(() => {
        setIsConfetti(false)
      }, 2000)
    }, 10000)
  }

  return (
    <div>
      <div className="processing-container">
        {steps.map((step, index) => (
          <div
            key={index}
            className={`step-text ${
              index === currentStepIndex ? 'visible' : 'hidden'
            }`}
          >
            {step}
          </div>
        ))}
      </div>
      <div className="play-container">
        <div className="player-1">
          <img className="player-a-img" src="boy-profile.png" alt="alice" />
          <h3> Player A (Bob)</h3>
          <h2> Score {playerAScore} </h2>
        </div>
        <button className="play-btn" onClick={() => startPlayerATurn()}>
          Player A Choose and Player B Guesses
          <br />
          Player B Choose and Player A Guesses
        </button>
        <div className="player-2">
          <img className="player-b-img" src="girl-profile.png" alt="alice" />
          <h3> Player B (Alice)</h3>
          <h2> Score {playerBScore} </h2>
        </div>
        {/* {isConfetti && (
        <Confetti
          width={window.innerWidth}
          height={window.innerHeight}
          numberOfPieces={100}
        />
      )} */}
      </div>
      {winner && <h1 className='winner'> Yay! {winner} won 🎉 </h1>}
    </div>
  )
}

export default Game

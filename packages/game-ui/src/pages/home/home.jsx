import React from 'react'
import './home.css'
import { Link } from 'react-router-dom'

const Home = () => {
  return (
    <div>
      <div className="game-container">
        <h1> 🎉 Welcome to Guess Game 🎉</h1>
        <div className="game-elem">
          <Link to="/game">
            <button className="start-btn">Start 🚀</button>
          </Link>
        </div>
      </div>
    </div>
  )
}

export default Home

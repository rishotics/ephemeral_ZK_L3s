import logo from './logo.svg'
import './App.css'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Game from './pages/game/game'
import Home from './pages/home/home'

function App() {
  return (
    <div className="App">
      <Router>
        <Routes>
          <Route path='/' element={<Home />} />
          <Route path="/game" element={<Game />} />
        </Routes>
      </Router>
    </div>
  )
}

export default App

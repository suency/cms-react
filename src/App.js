import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Login from './pages/Login'
import Layout from './pages/Layout'

function App () {
  return (
    <BrowserRouter>
      <div>
        <Routes>
          <Route path="/" element={<Layout />}></Route>
          <Route path="/Login" element={<Login />}></Route>
        </Routes>
      </div>
    </BrowserRouter>
  )
}

export default App

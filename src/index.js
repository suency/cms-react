import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
//import 'antd/dist/antd.min.css'
import 'antd/dist/antd.less'
import App from './App'
import './index.scss'
import './index.less'



const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>
)

import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
//import 'antd/dist/antd.min.css' 

import 'antd/dist/reset.css'; //^5.0.0
//import 'antd/dist/antd.less' ^4.23.1
import App from './App'
import './index.scss'
import './index.less'



const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>
)

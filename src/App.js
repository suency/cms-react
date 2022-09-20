import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Login from '@/pages/Login'
import Layout from './pages/Layout'
import { observer } from 'mobx-react-lite'

import useStore from '@/store/index'
function App () {
  return (
    <BrowserRouter>
      <div>
        {useStore.loginStore.token}
        {useStore.listStore.diao}
        <Routes>
          <Route path="/" element={<Layout />}></Route>
          <Route path="/Login" element={<Login />}></Route>
        </Routes>
      </div>
    </BrowserRouter>
  )
}

export default observer(App)

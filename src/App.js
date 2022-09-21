import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Login from '@/pages/Login'
import Layout from './pages/Layout'
import { observer } from 'mobx-react-lite'
import Home from './pages/Home'
import User from './pages/User'
import NotFound from './pages/404'

import Team1 from './pages/Team/team1'
import Team2 from './pages/Team/team2'

//import useStore from '@/store/index'
function App () {
  return (
    <BrowserRouter>
      <div>
        {/* {useStore.loginStore.token}
        {useStore.listStore.diao} */}
        <Routes>
          <Route path="/" element={<Layout />}>
            <Route index element={<Home />} />
            <Route path="user" element={<User />} />
            <Route path="team/team1" element={<Team1 />} />
            <Route path="team/team2" element={<Team2 />} />
          </Route>
          <Route path="/Login" element={<Login />}></Route>
          <Route path="*" element={<NotFound />}></Route>
        </Routes>
      </div>
    </BrowserRouter>
  )
}

export default observer(App)

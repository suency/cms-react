import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Login from '@/pages/Login'
import Layout from './pages/Layout'
import { observer } from 'mobx-react-lite'
import Home from './pages/Home'
import NotFound from './pages/404'
import Setting from './pages/Setting'
import Tools from './pages/Tools'

import Team1 from './pages/Team/team1'
import Team2 from './pages/Team/team2'

import Admins from './pages/People/admins'
import Roles from './pages/People/roles'
import Users from './pages/People/users'

function App () {
  return (
    <BrowserRouter>
      <div id="appRoot">
        <Routes>
          <Route path="/" element={<Layout />}>
            <Route index element={<Home />} />
            <Route path="setting" element={<Setting />} />
            <Route path="tools" element={<Tools />} />
            <Route path="team/team1" element={<Team1 />} />
            <Route path="team/team2" element={<Team2 />} />
            <Route path="people/admins" element={<Admins />} />
            <Route path="people/roles" element={<Roles />} />
            <Route path="people/users" element={<Users />} />
          </Route>
          <Route path="/Login" element={<Login />}></Route>
          <Route path="*" element={<NotFound />}></Route>
        </Routes>
      </div>
    </BrowserRouter>
  )
}

export default observer(App)

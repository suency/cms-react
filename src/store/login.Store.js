import { makeAutoObservable, runInAction } from 'mobx'
import http from '@/tools/http.js'
import tool from '@/tools/index.js'
import { UserOutlined } from '@ant-design/icons'

class LoginStore {
  loginInfo = {
    token: '',
    status: '',
    error: '',
    routerList: [
      { path: "/", element: "Layout" },
      { path: "/Login", element: "Login" },
      { path: "/Logout", element: "Login" },
      { path: "*", element: "NotFound" }
    ],
    role: "",
    username: 'not login',
    avatar: <UserOutlined />,
  }

  constructor() {
    makeAutoObservable(this, { routerList: false })
  }
  async setToken(username, password) {
    try {
      let response = await http.post('/login', { username, password })
      runInAction(() => {
        if (response.data.status === "OK") {
          this.loginInfo = {
            status: "OK",
            token: response.data.info.token,
            routerList: response.data.info.routerList,
            role: response.data.info.role,
            avatar: response.data.info.avatar,
            username: response.data.info.username
          }
          tool.setToken(response.data.info.token)
          tool.setLoginInfo(response.data.info)

          /* this.status = "OK"
          this.token = response.data.info.token
          this.routerList = response.data.info.routerList

          this.role = response.data.info.role
          this.avatar = response.data.info.avatar
          this.username = response.data.info.username */
        } else {
          this.loginInfo.status = "fail"
          this.loginInfo.error = response.data.info.error
          tool.setLoginInfo(response.data.info)
        }
      })

    } catch (e) {
      console.log(e)
    }
  }
}

export default LoginStore
import { makeAutoObservable, runInAction } from 'mobx'
import http from '@/tools/http.js'
import tool from '@/tools/index.js'

class LoginStore {
  token = ''
  status = ''
  error = ''
  routerList = [{ path: "/", element: "Layout" },
  { path: "/Login", element: "Login" },
  { path: "*", element: "NotFound" }]
  role = ""
  constructor() {
    makeAutoObservable(this, { routerList: false })
  }
  async setToken (username, password) {
    try {
      let response = await http.post('/login', { username, password })
      runInAction(() => {
        if (response.data.status === "OK") {
          tool.setToken(response.data.info.token)
          this.status = "OK"
          this.token = response.data.info.token
          this.routerList = response.data.info.routerList
          //console.log(response.data.info.routerList)
          //this.menuList = response.data.info.menuList
          this.role = response.data.info.role
        } else {
          this.status = "fail"
          this.error = response.data.info.error
        }
      })

    } catch (e) {
      console.log(e)
    }
  }
}

export default LoginStore
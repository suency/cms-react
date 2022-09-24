import { makeAutoObservable } from 'mobx'
import http from '@/tools/http.js'
import tool from '@/tools/index.js'

class LoginStore {
  token = ''
  status = ''
  error = ''
  constructor() {
    makeAutoObservable(this)
  }
  async setToken (username, password) {
    try {
      let response = await http.post('/login', { username, password })
      if (response.data.status === "OK") {
        tool.setToken(response.data.info.token) //local storage
        this.status = "OK"
        this.token = response.data.info.token
      } else {
        this.status = "fail"
        this.error = response.data.info.error
      }
    } catch (e) {
      console.log(e)
    }
  }
}

export default LoginStore
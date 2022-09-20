import { makeAutoObservable } from 'mobx'
class LoginStore {
  token = '123'
  constructor() {
    makeAutoObservable(this)
  }
  setToken = ({ username, password }) => {

  }
}

export default LoginStore
import loginStore from './login.Store.js'
import listStore from './list.store.js'

class RootStore {
  constructor() {
    this.loginStore = new loginStore()
    this.listStore = new listStore()
  }
}

const useStore = new RootStore()
export default useStore
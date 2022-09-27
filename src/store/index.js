import loginStore from './login.Store.js'
import listStore from './list.store.js'
import menuStore from './menu.Store.js'

class RootStore {
  constructor() {
    this.loginStore = new loginStore()
    this.listStore = new listStore()
    this.menuStore = new menuStore()
  }
}

const useStore = new RootStore()
export default useStore
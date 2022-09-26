import loginStore from './login.Store.js'
import listStore from './list.store.js'
import routerStore from './router.Store.js'

class RootStore {
  constructor() {
    this.loginStore = new loginStore()
    this.listStore = new listStore()
    this.routerStore = new routerStore()
  }
}

const useStore = new RootStore()
export default useStore
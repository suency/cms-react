import { makeAutoObservable } from 'mobx'

class MenuStore {
  menuList = []
  constructor() {
    makeAutoObservable(this, { menuList: false })
  }
  setMenuList (data) {
    this.menuList = data
  }
}

export default MenuStore
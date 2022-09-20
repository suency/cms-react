import { makeAutoObservable } from 'mobx'
class ListStore {
  diao = '666'
  constructor() {
    makeAutoObservable(this)
  }
}

export default ListStore
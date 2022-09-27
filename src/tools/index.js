// 对外暴露一个函数
// 存储token
const tokenKey = "token"
const _ = require('underscore')
module.exports = {
  setToken: (token) => {
    localStorage.setItem(tokenKey, token)
  },
  getToken: () => {
    return localStorage.getItem(tokenKey)
  },
  removeToken: () => {
    localStorage.removeItem(tokenKey)
  },
  deepClone: (o) => {
    return JSON.parse(JSON.stringify(o))
  },
  convertPathToMenu: (menuList, list) => {
    menuList = JSON.parse(JSON.stringify(menuList))
    list = JSON.parse(JSON.stringify(list))
    let finalList = []
    // [ '/setting' ]
    let singleParent = _.filter(_.filter(list, item => item.split("/").length === 2), item => {
      return !_.some(menuList, item2 => { return item === item2.key && item2["children"] && item2["children"].length > 0 })
    })

    _.each(singleParent, item => {
      let subGroup = _.find(menuList, findItem => {
        return findItem.key === item
      })

      finalList.push(subGroup)
    })

    // [ '/people/admins', '/people/users', '/people/roles', '/team/team1' ]
    let childNode = list.filter((item) => {
      return (item.split("/")).length === 3
    })

    //let testGroup = ['/people/admins', '/team/team1', '/people/users', '/fei/enen1', '/people/roles', '/team/team2', '/team/team1', '/fei/enen2']

    let familyGroup = _.groupBy(childNode, item => { return item.split("/")[1] })

    _.each(familyGroup, (item, key) => {
      let subGroup = _.find(menuList, findItem => {
        return findItem.key === "/" + key
      })

      subGroup["children"] = _.filter(subGroup["children"], filterItem => {
        return _.some(item, someItem => {
          return someItem === filterItem.key
        })
      })
      finalList.push(subGroup)

    })

    finalList.unshift(_.find(menuList, findItem => {
      return findItem.key === "/"
    }))
    return finalList
    //console.log(finalList)
  }
}
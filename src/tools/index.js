// 对外暴露一个函数
// 存储token
const tokenKey = "token"
const loginKey = "loginKey"
const userKey = "userKey"
const _ = require('underscore')
const getAllLabelsFromMenu = (menu, result = []) => {
  menu.forEach(element => {
    result.push(element.label)
    if (element.hasOwnProperty("children")) {
      getAllLabelsFromMenu(element.children, result)
    }
  });
}
module.exports = {
  baseURL: 'http://localhost:8888/',
  setToken: (token) => {
    localStorage.setItem(tokenKey, token)
  },
  getToken: () => {
    return localStorage.getItem(tokenKey)
  },
  removeToken: () => {
    localStorage.removeItem(tokenKey)
  },
  setLoginInfo: (obj) => {
    localStorage.setItem(loginKey, JSON.stringify(obj))
  },
  getLoginInfo: () => {
    return JSON.parse(localStorage.getItem(loginKey))
  },
  removeLoginInfo: () => {
    localStorage.removeItem(loginKey)
  },
  setUserInfo: (obj) => {
    localStorage.setItem(userKey, JSON.stringify(obj))
  },
  getUserInfo: () => {
    return JSON.parse(localStorage.getItem(userKey))
  },
  removeUserInfo: () => {
    localStorage.removeItem(userKey)
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
  },
  convertPathToRouter: (menuList, list) => {
    menuList = JSON.parse(JSON.stringify(menuList))
    list = JSON.parse(JSON.stringify(list))
    let finalList = [{
      "path": "/",
      "element": "Layout",
      children: [
        {
          "path": "/",
          "element": "Home"
        }
      ]
    }]
    // [ '/setting' ]
    let singleParent = _.filter(_.filter(list, item => item.split("/").length === 2), item => {
      return !_.some(menuList, item2 => { return item === item2.key && item2["children"] && item2["children"].length > 0 })
    })

    _.each(singleParent, item => {
      const pathArr = item.split("/")
      finalList[0]["children"].push({
        "path": item,
        "element": pathArr[1].charAt(0).toUpperCase() + pathArr[1].slice(1)
      })
    })

    // [ '/people/admins', '/people/users', '/people/roles', '/team/team1' ]
    let childNode = list.filter((item) => {
      return (item.split("/")).length === 3
    })

    //let testGroup = ['/people/admins', '/team/team1', '/people/users', '/fei/enen1', '/people/roles', '/team/team2', '/team/team1', '/fei/enen2']


    _.each(childNode, item => {
      //console.log(item.split("/"))
      const pathArr = item.split("/")
      finalList[0]["children"].push({
        "path": item,
        "element": pathArr[2].charAt(0).toUpperCase() + pathArr[2].slice(1)
      })
    })

    finalList.push(
      { "path": "/Login", "element": "Login" },
      { "path": "/Logout", "element": "Login" },
      { "path": "*", "element": "NotFound" })

    return finalList
  },
  capital(str) {
    if (str === '') {
      return ''
    }
    return str.slice(0, 1).toUpperCase() + str.slice(1).toLowerCase();
  },
  getAllLabelsFromMenu
}
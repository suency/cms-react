/* let a = new Promise((resolve, reject) => {
  setTimeout(() => {

  }, 100)
  return 1
})

a.then((a1) => {
  console.log("a1", a1)
  return 2
}).then((d1) => {
  console.log("d1", d1)
})
 */

/* File sizes after gzip:
  not all icon
  195.13 KB  build\static\js\2.b428306f.chunk.js
  66.6 KB    build\static\css\2.32d536ee.chunk.css
  6.54 KB    build\static\js\main.1372579c.chunk.js
  1.73 KB    build\static\css\main.e7b9f18d.chunk.css
  768 B      build\static\js\runtime-main.4faa7ac6.js

The project was built assuming it is hosted at /.
You can control this with the homepage field in your package.json. */

/* File sizes after gzip:

  340.52 KB  build\static\js\2.c81b7ad5.chunk.js
  66.6 KB    build\static\css\2.55edbdd9.chunk.css
  6.63 KB    build\static\js\main.19538470.chunk.js
  1.73 KB    build\static\css\main.e7b9f18d.chunk.css
  768 B      build\static\js\runtime-main.4faa7ac6.js

The project was built assuming it is hosted at /.
You can control this with the homepage field in your package.json. */
const _ = require('underscore')
let menuList = [
  {
    "key": "/",
    "icon": "PieChartOutlined",
    "label": "Dashboard"
  },
  {
    "key": "/setting",
    "icon": "SettingOutlined",
    "label": "Settings"
  },
  {
    "key": "/people",
    "icon": "UserOutlined",
    "label": "People",
    "children": [
      {
        "key": "/people/admins",
        "icon": "SolutionOutlined",
        "label": "Admins"
      },
      {
        "key": "/people/roles",
        "icon": "TrademarkCircleOutlined",
        "label": "Roles"
      },
      {
        "key": "/people/users",
        "icon": "CommentOutlined",
        "label": "Users"
      }
    ]
  },
  {
    "key": "/team",
    "icon": "TeamOutlined",
    "label": "Team",
    "children": [
      {
        "key": "/team/team1",
        "icon": "AndroidOutlined",
        "label": "Team1"
      },
      {
        "key": "/team/team2",
        "icon": "AppleOutlined",
        "label": "Team2"
      }
    ]
  },
  {
    "key": "/tools",
    "icon": "ToolOutlined",
    "label": "Tools"
  }
]


let list = [
  "/people/admins",
  "/people/users",
  "/setting",
  "/people",
  "/people/roles",
  "/team/team1"
]

function getAllpages () {
  let finalList = []
  menuList.forEach(item1 => {
    if (item1["children"] && item1["children"].length > 0) {
      item1["children"].forEach(item2 => {
        finalList.push({
          [item2.key]: item2
        })
      })
      item1.children = []
      finalList.push({
        [item1.key]: item1
      })
    } else {
      finalList.push({
        [item1.key]: item1
      })
    }
  })

  return finalList
}

function convertPathToMenu (menuList, list) {
  let finalList = []
  // [ '/setting' ]
  let singleParent = _.filter(_.filter(list, item => item.split("/").length === 2), item => {
    return !_.some(menuList, item2 => { return item == item2.key && item2["children"] && item2["children"].length > 0 })
  })

  _.each(singleParent, item => {
    let subGroup = _.find(menuList, findItem => {
      return findItem.key == item
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
      return findItem.key == "/" + key
    })

    subGroup["children"] = _.filter(subGroup["children"], filterItem => {
      return _.some(item, someItem => {
        return someItem == filterItem.key
      })
    })
    finalList.push(subGroup)

  })
  //console.log(finalList)
}

//simpleList()


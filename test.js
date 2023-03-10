const _ = require("underscore")
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
/* let menuList = [
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
 
let allList = [
  '/',
  '/setting',
  '/people/admins',
  '/people/roles',
  '/people/users',
  '/people',
  '/team/team1',
  '/team/team2',
  '/team',
  '/tools'
]
 
let allListR = _.filter(allList, item => {
  return item.split("/").length === 3
})
 
let list_ori = [
  "/people/admins",
  "/people/users",
  "/people/roles",
  "/team/team1",
  "/team/team2"
]
 
let list_tar = [
  "/people/admins",
  "/people/roles",
  "/team/team1",
]
 
 
let list3 = [
  "/setting",
  "/tools",
  "/people/admins",
  "/people",
  "/people/roles",
  "/team/team1",
  "/team"
]
let list_ori_1 = _.groupBy(list_ori, item => {
  return item.split("/")[1]
})
 
let list_tar_1 = _.groupBy(list_tar, item => {
  return item.split("/")[1]
})
 
let deleteArr = []
_.each(list_tar_1, (item, key) => {
  if (item.length !== list_ori_1[key].length) {
    deleteArr.push("/" + key)
  }
}) */

/* console.log(deleteArr)
console.log(list3)
console.log(_.difference(list3, deleteArr)) */


function getAllpages() {
  let finalList = [];
  menuList.forEach((item1) => {
    if (item1["children"] && item1["children"].length > 0) {
      item1["children"].forEach((item2) => {
        finalList.push({
          [item2.key]: item2,
        });
      });
      item1.children = [];
      finalList.push({
        [item1.key]: item1,
      });
    } else {
      finalList.push({
        [item1.key]: item1,
      });
    }
  });

  return finalList;
}

function convertPathToMenu(menuList, list) {
  let finalList = [];
  // [ '/setting' ]
  let singleParent = _.filter(
    _.filter(list, (item) => item.split("/").length === 2),
    (item) => {
      return !_.some(menuList, (item2) => {
        return (
          item == item2.key && item2["children"] && item2["children"].length > 0
        );
      });
    }
  );

  _.each(singleParent, (item) => {
    let subGroup = _.find(menuList, (findItem) => {
      return findItem.key == item;
    });

    finalList.push(subGroup);
  });

  // [ '/people/admins', '/people/users', '/people/roles', '/team/team1' ]
  let childNode = list.filter((item) => {
    return item.split("/").length === 3;
  });

  //let testGroup = ['/people/admins', '/team/team1', '/people/users', '/fei/enen1', '/people/roles', '/team/team2', '/team/team1', '/fei/enen2']

  let familyGroup = _.groupBy(childNode, (item) => {
    return item.split("/")[1];
  });

  _.each(familyGroup, (item, key) => {
    let subGroup = _.find(menuList, (findItem) => {
      return findItem.key == "/" + key;
    });

    subGroup["children"] = _.filter(subGroup["children"], (filterItem) => {
      return _.some(item, (someItem) => {
        return someItem == filterItem.key;
      });
    });
    finalList.push(subGroup);
  });
  //console.log(finalList)
}

//simpleList()

function convertPathToRouter(menuList, list) {
  menuList = JSON.parse(JSON.stringify(menuList));
  list = JSON.parse(JSON.stringify(list));
  let finalList = [
    {
      path: "/",
      element: "Layout",
      children: [
        {
          path: "/",
          element: "Home",
        },
      ],
    },
  ];
  // [ '/setting' ]
  let singleParent = _.filter(
    _.filter(list, (item) => item.split("/").length === 2),
    (item) => {
      return !_.some(menuList, (item2) => {
        return (
          item == item2.key && item2["children"] && item2["children"].length > 0
        );
      });
    }
  );

  _.each(singleParent, (item) => {
    const pathArr = item.split("/");
    finalList[0]["children"].push({
      path: item,
      element: pathArr[1].charAt(0).toUpperCase() + pathArr[1].slice(1),
    });
  });

  // [ '/people/admins', '/people/users', '/people/roles', '/team/team1' ]
  let childNode = list.filter((item) => {
    return item.split("/").length === 3;
  });

  //let testGroup = ['/people/admins', '/team/team1', '/people/users', '/fei/enen1', '/people/roles', '/team/team2', '/team/team1', '/fei/enen2']

  _.each(childNode, (item) => {
    //console.log(item.split("/"))
    const pathArr = item.split("/");
    finalList[0]["children"].push({
      path: item,
      element: pathArr[2].charAt(0).toUpperCase() + pathArr[2].slice(1),
    });
  });

  finalList.push(
    {
      path: "/Login",
      element: "Login",
    },
    {
      path: "*",
      element: "NotFound",
    }
  );

  return finalList;
  //console.log(JSON.stringify(finalList))
}


//convertPathToRouter(menuList, list)

let allMenu = {
  id: 1,
  name: "admin",
  menu_list: [
    {
      key: "/",
      icon: "PieChartOutlined",
      label: "Dashboard",
    },
    {
      key: "/setting",
      icon: "SettingOutlined",
      label: "Settings",
    },
    {
      key: "/people",
      icon: "UserOutlined",
      label: "People",
      children: [
        {
          key: "/people/admins",
          icon: "SolutionOutlined",
          label: "Admins",
        },
        {
          key: "/people/roles",
          icon: "TrademarkCircleOutlined",
          label: "Roles",
        },
        {
          key: "/people/users",
          icon: "CommentOutlined",
          label: "Users",
        },
      ],
    },
    {
      key: "/team",
      icon: "TeamOutlined",
      label: "Team",
      children: [
        {
          key: "/team/team1",
          icon: "AndroidOutlined",
          label: "Team1",
        },
        {
          key: "/team/team2",
          icon: "AppleOutlined",
          label: "Team2",
        },
      ],
    },
    {
      key: "/tools",
      icon: "ToolOutlined",
      label: "Tools",
    },
    {
      key: "/finance",
      icon: "ChromeFilled",
      label: "Finance",
    },
  ],
  router_list: [
    {
      path: "/",
      element: "Layout",
      children: [
        {
          path: "/",
          element: "Home",
        },
        {
          path: "/setting",
          element: "Setting",
        },
        {
          path: "/tools",
          element: "Tools",
        },
        {
          path: "/team/team1",
          element: "Team1",
        },
        {
          path: "/team/team2",
          element: "Team2",
        },
        {
          path: "/people/admins",
          element: "Admins",
        },
        {
          path: "/people/roles",
          element: "Roles",
        },
        {
          path: "/people/users",
          element: "Users",
        },
        {
          path: "/finance",
          element: "Finance",
        },
      ],
    },
    {
      path: "/Login",
      element: "Login",
    },
    {
      path: "/Logout",
      element: "Login",
    },
    {
      path: "*",
      element: "NotFound",
    },
  ],
  avatar: "Guacamole.png",
};

function getAllLabelsFromMenu(menu, result = []) {
  menu.forEach(element => {
    result.push(element.label)
    if (element.hasOwnProperty("children")) {
      getAllLabelsFromMenu(element.children, result)
    }
  });
}

//let result = [];
//getAllLabelsFromMenu(allMenu.menu_list, result)

function isValid(str) {
  var reg = /^\w+$/g;
  return reg.test(str);
}

//console.log(isValid("???"));

import { useRoutes } from 'react-router-dom'
//import { observer } from 'mobx-react-lite'
import * as AllPages from './pages/index'
import { useState } from 'react'
import useStore from '@/store'
import DynComp from '@/components/DynamicComponent'
import { deepClone } from '@/tools'
import { useEffect } from 'react'
//import http from '@/tools/http'
//import * as AllIcon from '@ant-design/icons'



function organzeRouter (list) {
  let copy = deepClone(list)
  copy.forEach(ele => {
    if (ele["children"] && ele["children"].length !== 0) {
      ele["children"].forEach(child => {
        child.element = <DynComp Obj={AllPages} name={child.element} />
      })
    }
    ele.element = <DynComp Obj={AllPages} name={ele.element} />
  })

  return copy
}

function App () {
  /*   let routerDataList = [
      {
        label: "Setting",
        key: "/setting",
        icon: <DynComp Obj={AllIcon} name="SettingOutlined" />
      }, {
        label: "Tools",
        key: "/tools",
        icon: <DynComp Obj={AllIcon} name="ToolOutlined" />,
      },
      {
        label: "Team",
        key: "/team",
        icon: <DynComp Obj={AllIcon} name="ToolOutlined" />,
        children: [
          {
            label: "Team1",
            key: "/team/team1",
            icon: <DynComp Obj={AllIcon} name="AndroidOutlined" />
          },
          {
            label: "Team2",
            key: "/team/team2",
            icon: <DynComp Obj={AllIcon} name="AppleOutlined" />
          }
        ]
      },
      {
        label: "People",
        key: "/people",
        icon: <DynComp Obj={AllIcon} name="ToolOutlined" />,
        children: [
          {
            label: "Admins",
            key: "/people/admins",
            icon: <DynComp Obj={AllIcon} name="SolutionOutlined" />
          },
          {
            label: "Roles",
            key: "/people/roles",
            icon: <DynComp Obj={AllIcon} name="TrademarkCircleOutlined" />
          },
          {
            label: "Users",
            key: "/people/users",
            icon: <DynComp Obj={AllIcon} name="CommentOutlined" />
          }
        ]
      }
    ] */

  //let menuList = [];

  let initRouter = [
    { path: "/", element: "Layout" },
    { path: "/Login", element: "Login" },
    { path: "*", element: "NotFound" },
  ]

  let [routerData, setRouterData] = useState(organzeRouter(initRouter))

  useEffect(() => {

    /* let resultRouter = [
      {
        path: "/",
        element: "Layout",
        children: [
          { path: "/", element: "Home", },
          { path: "/setting", element: "Setting" },
          { path: "/tools", element: "Tools" },
          { path: "/team/team1", element: "Team1" },
          { path: "/team/team2", element: "Team2" },
          { path: "/people/admins", element: "Admins" },
          { path: "/people/roles", element: "Roles" },
          { path: "/people/users", element: "Users" },
        ],
      },
      { path: "/Login", element: "Login" },
      { path: "*", element: "NotFound" },
    ] */
    setRouterData(organzeRouter(useStore.loginStore.routerList))
    //console.log(useStore.loginStore.routerList)
    // eslint-disable-next-line
  }, [useStore.loginStore.token])

  return useRoutes(routerData)

  /*   return (
      <div id="appRoot">
        <Routes>
          <Route path="/" element={<Layout />}>
            <Route index element={<Home />} />
            <Route path="/setting" element={<Setting />} />
            <Route path="/tools" element={<Tools />} />
            <Route path="/team/team1" element={<Team1 />} />
            <Route path="/team/team2" element={<Team2 />} />
            <Route path="/people/admins" element={<Admins />} />
            <Route path="/people/roles" element={<Roles />} />
            <Route path="/people/users" element={<Users />} />
          </Route>
          <Route path="/Login" element={<Login />}></Route>
          <Route path="*" element={<NotFound />}></Route>
        </Routes>
      </div>
    ) */
}

export default App

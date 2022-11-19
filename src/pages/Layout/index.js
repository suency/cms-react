import * as AllIcon from '@ant-design/icons'
import { Breadcrumb, Layout, Menu, Avatar, Dropdown, Image, Space, Tag } from 'antd'
import React, { useState } from 'react'
import './index.scss'
import { Outlet, Link, useLocation, useNavigate } from 'react-router-dom'
import iconGeng from '@/assets/sprout.png'
import useStore from '@/store'
import { useEffect } from 'react'
import { deepClone, baseURL } from '@/tools'
import DynComp from '@/components/DynamicComponent'
//import http from '@/tools/http'
import tool from '@/tools/index.js'

const { Header, Content, Footer, Sider } = Layout
const topRightMenu = (
  <Menu
    items={[
      getItem(<Link to="/">Dashboard</Link>, '0', <AllIcon.PieChartOutlined />),
      {
        type: 'divider',
      },
      getItem(<Link to="/logout">Logout</Link>, '1', <AllIcon.LogoutOutlined />),
    ]}
  />
)


function getItem(label, key, icon, children) {
  return {
    key,
    icon,
    children,
    label,
  }
}

/* let items = [
  getItem(<Link to="/">Dashboard</Link>, '/', <PieChartOutlined />),
  getItem(<Link to="/setting">Settings</Link>, '/setting', <SettingOutlined />),
  getItem('People', '/people', <UserOutlined />, [
    getItem(<Link to="/people/admins">Admins</Link>, '/people/admins', <SolutionOutlined />),
    getItem(<Link to="/people/roles">Roles</Link>, '/people/roles', <TrademarkCircleOutlined />),
    getItem(<Link to="/people/users">Users</Link>, '/people/users', <CommentOutlined />),
  ]),
  getItem('Team', '/team', <TeamOutlined />, [
    getItem(<Link to="/team/team1">Team1</Link>, '/team/team1', <AndroidOutlined />),
    getItem(<Link to="/team/team2">Team2</Link>, '/team/team2', <AppleOutlined />)
  ]),
  getItem(<Link to="/tools">Tools</Link>, '/tools', <ToolOutlined />),
] */

function organzeMenu(list) {
  let copy = deepClone(list)
  copy.forEach(ele => {
    if (ele["children"] && ele["children"].length !== 0) {
      ele["children"].forEach(child => {
        child.icon = <DynComp Obj={AllIcon} name={child.icon} />
        child.label = <Link to={child.key}>{child.label}</Link>
      })
    } else {
      ele.label = <Link to={ele.key}>{ele.label}</Link>
    }
    ele.icon = <DynComp Obj={AllIcon} name={ele.icon} />

  })

  return copy
}
//for test
/* let items = [
  {
    label: "Dashboard",
    key: "/",
    icon: "PieChartOutlined"
  }, {
    label: "Settings",
    key: "/setting",
    icon: "SettingOutlined"
  },
  {
    label: "People",
    key: "/people",
    icon: "UserOutlined",
    children: [
      {
        label: "Admins",
        key: "/people/admins",
        icon: "SolutionOutlined"
      },
      {
        label: "Roles",
        key: "/people/roles",
        icon: "TrademarkCircleOutlined"
      },
      {
        label: "Users",
        key: "/people/users",
        icon: "CommentOutlined"
      }
    ]
  },
  {
    label: "Team",
    key: "/team",
    icon: "TeamOutlined",
    children: [
      {
        label: "Team1",
        key: "/team/team1",
        icon: "AndroidOutlined"
      },
      {
        label: "Team2",
        key: "/team/team2",
        icon: "AppleOutlined"
      }
    ]
  },
  {
    label: "Tools",
    key: "/tools",
    icon: "ToolOutlined"
  }
] */

const MyLayout = () => {
  /* const loginError = (info) => {
    message.error(info)
  } */
  const [collapsed, setCollapsed] = useState(false)
  const location = useLocation()
  const pathArr = location.pathname.split("/")
  const firstPath = pathArr[1] ? (pathArr[1].charAt(0).toUpperCase() + pathArr[1].slice(1)) : "Dashboard"
  const secondPath = firstPath ? pathArr[2] : "undefined"

  let defaultOpenKeys = pathArr[1] ? '/' + pathArr[1] : "dashboard"

  const navigate = useNavigate()

  let [menuList, setMenuList] = useState([])
  useEffect(() => {

    if (!tool.getToken()) {
      navigate("/Login")
    } else {
      //keep same with login store, refresh to keep login
      useStore.loginStore.loginInfo = {
        status: "OK",
        token: tool.getLoginInfo().token,
        routerList: tool.getLoginInfo().routerList,
        role: tool.getLoginInfo().role,
        avatar: tool.getLoginInfo().avatar,
        username: tool.getLoginInfo().username
      }

      useStore.menuStore.setMenuList(tool.getLoginInfo().menuList)
      setMenuList(organzeMenu(tool.getLoginInfo().menuList))

      /* useStore.loginStore.status = "OK"
      useStore.loginStore.token = tool.getLoginInfo().token
      useStore.loginStore.routerList = tool.getLoginInfo().routerList

      useStore.loginStore.role = tool.getLoginInfo().role
      useStore.loginStore.avatar = tool.getLoginInfo().avatar
      useStore.loginStore.username = tool.getLoginInfo().username */

      /* let response = async () => {
        try {
          message.loading({
            content: 'Loading Menus...',
            key: 'loading',
          })

          let result = await http.post('/menuList', { role: tool.getLoginInfo().role })

          if (result.data.status === "OK") {
            message.success({
              content: 'Loaded!',
              key: 'loading',
              duration: 2,
            })
            useStore.menuStore.setMenuList(result.data.info.menuList)
            setMenuList(organzeMenu(result.data.info.menuList))
          } else {
            loginError(result.data.info.error)
            setTimeout(() => {
              navigate("/Login")
            }, 2000)
          }
        } catch (e) {
          loginError(e)
          setTimeout(() => {
            navigate("/Login")
          }, 2000)
        }

      }
      response() */
    }
    // eslint-disable-next-line
  }, [])

  return menuList.length > 0 && (
    <>
      <Layout
        style={{
          minHeight: '100vh',
        }}
      >
        <Sider collapsible collapsed={collapsed} onCollapse={(value) => setCollapsed(value)}>
          <div className="logo" >
            <Image
              width={30}
              src={iconGeng}
            />
            <div style={{ marginLeft: '5px' }}>CMS</div>
          </div>
          <Menu theme="dark" defaultOpenKeys={[defaultOpenKeys]} defaultSelectedKeys={[location.pathname]} mode="inline" items={menuList} />
        </Sider>
        <Layout className="site-layout">
          <Header
            className="top-header"
          >
            <Space>
              <div>
                <Tag color="success">{useStore.loginStore.loginInfo.username}</Tag>
                <Tag color="processing">{useStore.loginStore.loginInfo.role}</Tag>
              </div>
              <Dropdown arrow={true} overlay={topRightMenu} trigger={['click']}>
                <Avatar className='logout' src={baseURL + 'static/' + useStore.loginStore.loginInfo.avatar} />
              </Dropdown>
            </Space>

          </Header>
          <Content
            style={{
              margin: '0 16px',
            }}
          >
            <Breadcrumb
              style={{
                margin: '16px 0',
              }}
            >
              <Breadcrumb.Item>{firstPath}</Breadcrumb.Item>
              <Breadcrumb.Item>{secondPath}</Breadcrumb.Item>
            </Breadcrumb>
            <div
              className="site-layout-background"
              style={{
                padding: 24,
                minHeight: 360,
              }}
            >
              <Outlet />
            </div>
          </Content>
          <Footer
            style={{
              textAlign: 'center',
            }}
          >
            enen.me ©2022 Created by genggeng
          </Footer>
        </Layout>
      </Layout>
    </>
  )
}

export default MyLayout
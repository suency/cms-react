import {
  SettingOutlined,
  ToolOutlined,
  PieChartOutlined,
  TeamOutlined,
  UserOutlined,
  SolutionOutlined,
  TrademarkCircleOutlined,
  CommentOutlined,
  AndroidOutlined,
  AppleOutlined,
  LogoutOutlined
} from '@ant-design/icons'
import { Breadcrumb, Layout, Menu, Avatar, Dropdown, Image } from 'antd'
import React, { useState } from 'react'
import './index.scss'
import { Outlet, Link, useLocation } from 'react-router-dom'
import iconGeng from '@/assets/sprout.png'
const { Header, Content, Footer, Sider } = Layout

const topRightMenu = (
  <Menu
    items={[
      getItem(<Link to="/">Dashboard</Link>, '0', <PieChartOutlined />),
      {
        type: 'divider',
      },
      getItem(<Link to="/logout">Logout</Link>, '1', <LogoutOutlined />),
    ]}
  />
)


function getItem (label, key, icon, children) {
  return {
    key,
    icon,
    children,
    label,
  }
}

const items = [
  getItem(<Link to="/">Dashboard</Link>, '/', <PieChartOutlined />),
  getItem(<Link to="/setting">Settings</Link>, '/setting', <SettingOutlined />),
  getItem('People', 'people', <UserOutlined />, [
    getItem(<Link to="/people/admins">Admins</Link>, '/people/admins', <SolutionOutlined />),
    getItem(<Link to="/people/roles">Roles</Link>, '/people/roles', <TrademarkCircleOutlined />),
    getItem(<Link to="/people/users">Users</Link>, '/people/users', <CommentOutlined />),
  ]),
  getItem('Team', 'team', <TeamOutlined />, [
    getItem(<Link to="/team/team1">team1</Link>, '/team/team1', <AndroidOutlined />),
    getItem(<Link to="/team/team2">team2</Link>, '/team/team2', <AppleOutlined />)
  ]),
  getItem(<Link to="/tools">Tools</Link>, '/tools', <ToolOutlined />),
]

const MyLayout = () => {
  const [collapsed, setCollapsed] = useState(false)
  const location = useLocation()
  const pathArr = location.pathname.split("/")
  const firstPath = pathArr[1] ? (pathArr[1].charAt(0).toUpperCase() + pathArr[1].slice(1)) : "Dashboard"
  const secondPath = firstPath ? pathArr[2] : "undefined"

  const defaultOpenKeys = pathArr[1] ? pathArr[1] : "dashboard"

  return (
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
        <Menu theme="dark" defaultOpenKeys={[defaultOpenKeys]} defaultSelectedKeys={[location.pathname]} mode="inline" items={items} />
      </Sider>
      <Layout className="site-layout">
        <Header
          className="top-header"
        >
          <Dropdown arrow={true} overlay={topRightMenu} trigger={['click']}>
            <Avatar className='logout' icon={<UserOutlined />} />
          </Dropdown>

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
  )
}

export default MyLayout
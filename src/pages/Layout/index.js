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
import { Breadcrumb, Layout, Menu, Avatar, Dropdown } from 'antd'
import React, { useState } from 'react'
import './index.scss'
import { Outlet, Link, useLocation } from 'react-router-dom'
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
  getItem(<Link to="/">Dashboard</Link>, '1', <PieChartOutlined />),
  getItem(<Link to="/setting">Settings</Link>, '2', <SettingOutlined />),
  getItem('People', 'sub1', <UserOutlined />, [
    getItem(<Link to="people/admins">Admins</Link>, '3', <SolutionOutlined />),
    getItem(<Link to="people/roles">Roles</Link>, '4', <TrademarkCircleOutlined />),
    getItem(<Link to="people/users">Users</Link>, '5', <CommentOutlined />),
  ]),
  getItem('Team', 'sub2', <TeamOutlined />, [
    getItem(<Link to="team/team1">team1</Link>, '6', <AndroidOutlined />),
    getItem(<Link to="team/team2">team2</Link>, '8', <AppleOutlined />)
  ]),
  getItem(<Link to="/tools">Tools</Link>, '9', <ToolOutlined />),
]

const MyLayout = () => {
  const [collapsed, setCollapsed] = useState(false)
  const location = useLocation()
  const pathArr = location.pathname.split("/").map(item => item.charAt(0).toUpperCase() + item.slice(1))
  const firstPath = pathArr[1] ? pathArr[1] : "Dashboard"
  const secondPath = firstPath ? pathArr[2] : "undefined"

  return (
    <Layout
      style={{
        minHeight: '100vh',
      }}
    >
      <Sider collapsible collapsed={collapsed} onCollapse={(value) => setCollapsed(value)}>
        <div className="logo" >CMS</div>
        <Menu theme="dark" defaultSelectedKeys={['1']} mode="inline" items={items} />
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
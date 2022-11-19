import './index.scss'
import { Button, Checkbox, Form, Input, message } from 'antd'
import cover from '@/assets/cover-blockchain.jpg'
import useStore from '@/store'
import { observer } from 'mobx-react-lite'
import { removeToken, removeLoginInfo, getUserInfo, setUserInfo, removeUserInfo } from '@/tools'
import { useNavigate } from 'react-router-dom'


const Login = () => {
  const navigate = useNavigate()
  removeToken()
  removeLoginInfo()
  const loginSuccess = () => {
    message.success('login success!')
  }

  const loginError = (info) => {
    message.error(info)
  }
  const onFinish = async values => {

    //setUserInfo used to do remember function

    if (values.remember) {
      setUserInfo(values)
    } else {
      removeUserInfo()
    }


    await useStore.loginStore.setToken(values.username, values.password)
    if (useStore.loginStore.status === "OK") {
      loginSuccess()
      navigate('/')
    } else {
      loginError(useStore.loginStore.error)
    }
  }

  const onFinishFailed = errorInfo => {
    console.log('Failed:', errorInfo)
  }


  return (
    <div className="login-page">
      <div className="login-box">
        <div className="illustration-wrapper">
          <img src={cover} alt="Login" />
        </div>
        <Form
          name="login-form"
          initialValues={{
            remember: (getUserInfo())?.remember,
            password: (getUserInfo())?.password,
            username: (getUserInfo())?.username
          }}
          onFinish={onFinish}
          onFinishFailed={onFinishFailed}
        >
          <p className="form-title">Welcome back</p>
          <p>Login to the Dashboard</p>
          <Form.Item
            name="username"
            rules={[{ required: true, message: 'Please input your username!' }]}
          >
            <Input
              placeholder="Username"
            />
          </Form.Item>

          <Form.Item
            name="password"
            rules={[{ required: true, message: 'Please input your password!' }]}
          >
            <Input.Password
              placeholder="Password"
            />
          </Form.Item>

          <Form.Item name="remember" valuePropName="checked">
            <Checkbox>Remember me</Checkbox>
          </Form.Item>

          <Form.Item>
            <Button type="primary" htmlType="submit" className="login-form-button">
              LOGIN
            </Button>
          </Form.Item>
        </Form>
      </div>
    </div>
  )
}

export default observer(Login)
import { useEffect, useState } from "react"
import {
  message, Tree, Avatar, Segmented, Card, Row, Col, Button, Modal, Divider, Space,
  Form, Input, Image, Select, Tag
} from 'antd'
import http from "@/tools/http"
import { deepClone, convertPathToMenu, convertPathToRouter } from "@/tools"
import DynComp from '@/components/DynamicComponent'
import * as AllIcon from '@ant-design/icons'
import { baseURL } from "@/tools"
import './roles.scss'
//import useStore from "@/store"
import _ from "underscore"

// convert to tree menu including icon for ant design format
function organzeTreeMenu(list, roleName = "admin", targetRole = "admin") {
  let handleList = []
  list.forEach(item => {
    if (item.name === roleName) {
      handleList = deepClone(item.menu_list)
    }
  })

  handleList.forEach((item) => {
    if (item["children"]) {
      item["children"].forEach((ele) => {
        ele.title = ele.label
        ele.value = ele.key
        ele.icon = <DynComp Obj={AllIcon} name={ele.icon} />
        if ((roleName === 'admin' || roleName === 'root') && (targetRole === 'admin' || targetRole === 'root')) {
          ele.disabled = true
        }
      })
    }
    if (item.key === "/") {
      item.disabled = true
    }
    if ((roleName === 'admin' || roleName === 'root') && (targetRole === 'admin' || targetRole === 'root')) {
      item.disabled = true
    }
    item.title = item.label
    item.value = item.key
    item.icon = <DynComp Obj={AllIcon} name={item.icon} />
  })
  return handleList
}

function organzeTreeMenuEdit(list, roleName = "admin", targetRole = "admin") {
  let handleList = []
  list.forEach(item => {
    if (item.name === roleName) {
      handleList = deepClone(item.menu_list)
    }
  })

  handleList.forEach((item) => {
    if (item["children"]) {
      item["children"].forEach((ele) => {
        ele.title = <Space size={1}>
          <div style={{ marginRight: 25 }}>{ele.label}</div>
          <Tag onClick={() => { editMenu(ele.label) }} color="#2db7f5">edit</Tag>
          <Tag onClick={() => { deleteMenu(ele.label) }} color="#f50">delete</Tag>
        </Space>
        if (ele.key === "/people/roles"
          || ele.key === "/people/admins"
          || ele.key === "/people/users") {
          ele.title = ele.label
          ele.disabled = true
        }
        ele.value = ele.key
        ele.icon = <DynComp Obj={AllIcon} name={ele.icon} />
        if ((roleName === 'admin' || roleName === 'root') && (targetRole === 'admin' || targetRole === 'root')) {
          ele.disabled = true
        }
      })
    }

    if ((roleName === 'admin' || roleName === 'root') && (targetRole === 'admin' || targetRole === 'root')) {
      item.disabled = true
    }
    item.title =
      <Space size={1}>
        <div style={{ marginRight: 25 }}>{item.label}</div>
        <Tag onClick={() => { editMenu(item.label) }} color="#2db7f5">edit</Tag>
        <Tag onClick={() => { deleteMenu(item.label) }} color="#f50">delete</Tag>
      </Space>
    if (item.key === "/" || item.key === "/people") {
      item.disabled = true
      item.title = item.label
    }
    item.value = item.key
    item.icon = <DynComp Obj={AllIcon} name={item.icon} />
  })
  return handleList
}
const editMenu = (value) => {
  //console.log("edit", value)

}
const deleteMenu = (value) => {
  console.log("delete", value)
}
function getAllKeys(list) {
  list = deepClone(list)
  let handleList = []
  _.each(list, item => {
    if (item["children"] && item["children"].length > 0) {
      _.each(item["children"], ele => {
        handleList.push(ele.key)
      })
    }
    handleList.push(item.key)
  })

  return handleList
}

//delete the parent key if children keys are not all selected
function selectMyKeys(allMenu, targetMenu) {
  allMenu = deepClone(allMenu)
  targetMenu = deepClone(targetMenu)

  let allMenuKeys = getAllKeys(allMenu)
  let targetMenuKeys = getAllKeys(targetMenu)

  let twoLevelKeysAllmenu = _.filter(allMenuKeys, item => {
    return item.split("/").length === 3
  })
  let twoLevelKeysTargetMenu = _.filter(targetMenuKeys, item => {
    return item.split("/").length === 3
  })

  let allMenuGroups = _.groupBy(twoLevelKeysAllmenu, item => {
    return item.split("/")[1]
  })
  let targetMenuGroups = _.groupBy(twoLevelKeysTargetMenu, item => {
    return item.split("/")[1]
  })

  let deleteArr = []
  _.each(targetMenuGroups, (item, key) => {
    if (item.length !== allMenuGroups[key].length) {
      deleteArr.push("/" + key)
    }
  })

  return _.difference(targetMenuKeys, deleteArr)
}
// get menulist by role, default admin(all menu)
function getAllMenuListByRole(list, roleName = "admin") {
  let handleList = []
  list.forEach(item => {
    if (item.name === roleName) {
      handleList = deepClone(item.menu_list)
    }
  })
  return handleList
}

function Roles() {
  const [treeOptions, setTreeOptions] = useState({ treeData: [], onCheck: () => { }, checkedKeys: [] })
  const [confirmModal, setConfirmModal] = useState({ from: '', show: false, title: "", content: "" })
  const [roleData, setRoleData] = useState({ roleId: 1, roleName: "admin", resultMenu: [], resultRouter: [] })
  const [avatarList, setAvatarList] = useState({})
  const [addMenu, setAddMenu] = useState({ checkedButton: true, treeData: [] }) //use reactive in modal form
  //const [modalVisble, setModalVisible] = useState(false)

  const [addMenuForm] = Form.useForm()
  const [editRoleForm] = Form.useForm()

  const [editTreeOptions, editSetTreeOptions] = useState({ treeData: [] })


  const [refreshValue, setRefreshValue] = useState(false)
  useEffect(() => {
    const importAll = require =>
      require.keys().reduce((acc, next) => {
        acc[next.replace("./", "")] = require(next)
        return acc
      }, {})
    const images = importAll(require.context('@/assets/head', false, /\.(png|jpe?g|svg)$/))
    setAvatarList(images)

    const loginError = (info) => {
      message.error(info)
    }
    let response = async () => {
      try {
        message.loading({
          content: 'Loading Roles...',
          key: 'loading',
        })
        let result = await http.get('/roles/getRoles')
        if (result.data.status === "OK") {
          message.success({
            content: 'Loaded!',
            key: 'loading',
            duration: 2,
          })

          let allServerData = result.data.info.roles

          //['/', '/setting', '/people', '/team', '/tools']
          // let testData = allServerData[0].menu_list;
          // let allMenuKeys = _.pluck(testData, 'key');
          //console.log(_.pluck(testData, 'key'));

          let adminMenu = getAllMenuListByRole(result.data.info.roles)
          setTreeOptions({
            ...treeOptions,
            allMenu: allServerData,
            checkedKeys: getAllKeys(adminMenu),
            treeData: organzeTreeMenu(allServerData, "admin", "admin") //this data is always unchangable
          })

          // edit tree data another tree
          editSetTreeOptions({
            ...editTreeOptions,
            allMenu: allServerData,
            treeData: organzeTreeMenuEdit(allServerData, "admin", "edit")
          })
        } else {
          loginError(result.data.info.error)
        }
      } catch (e) {
        loginError(e)
      }
    }

    response()
    // eslint-disable-next-line
  }, [refreshValue])

  const changeRole = (value) => {
    const result = _.find(treeOptions.allMenu, item => item.id === value)
    const adminMenu = _.find(treeOptions.allMenu, item => item.id === 1)
    const finalResult = selectMyKeys(adminMenu.menu_list, result.menu_list)
    //const finalResult = getAllKeys(result.menu_list)

    //console.log("result.name", result.name)

    setRoleData({
      ...roleData,
      roleId: result.id,
      roleName: result.name,
      resultMenu: [],
      resultRouter: []
    })
    setTreeOptions({
      ...treeOptions,
      checkedKeys: finalResult,
      treeData: organzeTreeMenu(treeOptions.allMenu, "admin", result.name)
    })
  }

  const mySuperCheck = (checkedKeys, info) => {
    //console.log("checkedKeys-super", checkedKeys)
    let adminRoleInfo = _.find(treeOptions.allMenu, item => item.name === 'admin')
    let filterDashKey = _.filter(checkedKeys, item => item !== "/")

    setTreeOptions({ ...treeOptions, checkedKeys })

    let resultMenu = convertPathToMenu(adminRoleInfo.menu_list, filterDashKey)
    let resultRouter = convertPathToRouter(adminRoleInfo.router_list, filterDashKey)

    setRoleData({
      ...roleData,
      resultMenu: JSON.stringify(resultMenu),
      resultRouter: JSON.stringify(resultRouter)
    })
    //console.log("resultMenu", resultMenu)
    //console.log("resultRouter", resultRouter)

  }

  const showModal = (from, title, content) => {
    setConfirmModal({ ...confirmModal, from, title, content, show: true })
  }

  const hideModal = () => {
    setConfirmModal({ ...confirmModal, show: false })
  }

  const onFinish = (values) => {
    console.log("finish", values)
    let newMenu = JSON.stringify([{ "key": "/", "icon": "PieChartOutlined", "label": "Dashboard" }])
    let newRouter = JSON.stringify([{ "path": "/", "element": "Layout", "children": [{ "path": "/", "element": "Home" }] }, { "path": "/Login", "element": "Login" }, { "path": "/Logout", "element": "Login" }, { "path": "*", "element": "NotFound" }])
    http.post('/roles/createRole', { newMenu, newRouter, ...values }).then(res => {
      console.log(res)
      if (res.data.status === "OK") {
        message.success({
          content: 'Save successfully!',
          key: 'Processing...',
          duration: 2,
        })
        refresh()
        hideModal()
      }
    })
  }

  const refresh = () => {
    setRefreshValue(!refreshValue)
  }

  const onFinishEdit = values => {
    let editRoleIcon = values.editRoleIcon
    let editRoleName = values.editRoleName
    let editRoleId = JSON.parse(values.editRoleId).id
    http.post('/roles/updateRoleName', { editRoleIcon, editRoleName, editRoleId }).then(res => {
      console.log(res)
      if (res.data.status === "OK") {
        message.success({
          content: 'Save successfully!',
          key: 'Processing...',
          duration: 2,
        })

        editRoleForm.setFieldsValue({
          editRoleId: values.editRoleName,
          editRoleName: values.editRoleName,
          editRoleIcon: values.editRoleIcon
        })
        refresh()
        hideModal()
        //changeRole(editRoleId)
      }
    })
  }

  const deleteRole = () => {
    if (editRoleForm.getFieldValue("editRoleId")) {
      let id = JSON.parse(editRoleForm.getFieldValue("editRoleId")).id
      http.post('/roles/deleteRole', { id }).then(res => {
        console.log(res)
        if (res.data.status === "OK") {
          message.success({
            content: 'Delete successfully!',
            key: 'Processing...',
            duration: 2,
          })
          refresh()
          hideModal()
        }
      })
    } else {
      message.error({
        content: 'Please select one role',
        key: 'Processing...',
        duration: 2
      })
    }

  }

  const editChangeRole = (values) => {
    let formData = JSON.parse(values)
    editRoleForm.setFieldsValue({
      editRoleId: values,
      editRoleName: formData.name,
      editRoleIcon: formData.avatar
    })
  }
  const onConfirm = () => {
    hideModal()
    if (confirmModal.from === "updateMenu") {
      http.post('/roles/updateRole', roleData).then(res => {
        console.log(res)
        if (res.data.status === "OK") {
          message.success({
            content: 'Save successfully!',
            key: 'Processing...',
            duration: 2,
          })
          refresh()
          hideModal()
        }
      })
    }

    if (confirmModal.from === "createRole") {
      /* let newMenu = '[{"key": "/", "icon": "PieChartOutlined", "label": "Dashboard"}]'
      let newRouter = '[{"path": "/", "element": "Layout", "children": [{"path": "/", "element": "Home"}]}, {"path": "/Login", "element": "Login"}, { "path": "/Logout", "element": "Login" },{"path": "*", "element": "NotFound"}]' */
      //console.log("createRole")
    }
  }

  const onFinishAddMenu = () => {
    let submitData = addMenuForm.getFieldsValue();
    //let createRouterOrNot = true;
    if (submitData.parentMenu === "/") {
      //no router for root menu, must create submenu to match router
      //createRouterOrNot = false;
    }

    //app1 {"key": "/app1", "icon": "menuIcon", "label": "App1"}
    //no router

    //app1/users
    // {"key": "/app1/users", "icon": "SolutionOutlined", "label": "Users"}
    // {"path": "/app1/users", "element": "Users"}

    //create app1 folder, users.js, add router config in index.js

    //hideModal()
    /* let mockData = {
      menuIcon: "ChromeOutlined",
      menuName: "abc",
      parentMenu: "/setting"
    } */

    //menu
    //{"key": "/people/admins", "icon": "SolutionOutlined", "label": "Admins"} have children
    //{"key": "/setting", "icon": "SettingOutlined", "label": "Settings"} no children

    //router
    //{"path": "/setting", "element": "Setting"}
    //{"path": "/team/team1", "element": "Team1"}
    console.log(addMenuForm.getFieldsValue());
  }

  const onAddMenuChangeSwitch = () => {
    setAddMenu(pre => {
      return { ...pre, checkedButton: !pre.checkedButton }
    })
    addMenuForm.setFieldValue("menuName", "12222")

  }

  return (
    treeOptions.treeData.length > 0 &&
    <>
      <button>{addMenu.checkedButton.toString()}</button>
      <button onClick={onAddMenuChangeSwitch}>click</button>
      <Row gutter={16}>

        <Col className="gutter-row" span={15}>
          <Card title="Roles Management (can only update by one role once)">
            <Segmented onChange={changeRole}

              options={
                treeOptions.allMenu.map(item => {
                  return {
                    label: (
                      <div style={{ padding: 4 }}>
                        <Avatar src={baseURL + 'static/' + item.avatar} />
                        <div>{item.name}</div>
                      </div>
                    ),
                    value: item.id
                  }
                })
              }
            />
            <Tree className="roleGap"
              checkable
              defaultExpandAll={true}
              onCheck={mySuperCheck}
              showIcon={true}
              checkedKeys={treeOptions.checkedKeys}
              showLine={{ showLeafIcon: false }}
              treeData={treeOptions.treeData}
            />
            <Space size="small">
              <Button type="primary" disabled={
                roleData.roleName === "admin" ||
                roleData.roleName === "root" ||
                roleData.resultMenu.length === 0
              } onClick={() => showModal(
                "updateMenu",
                "Update Role Menu",
                `Are you sure updating role ${roleData.roleName} menu?`)}>
                Save Settings</Button>
              <Button type="ghost" onClick={() => {
                showModal(
                  "createRole",
                  "Create New Role",
                  <Row style={{ marginTop: 20 }} gutter={16}>
                    <Col className="gutter-row" span={24}>
                      <Form
                        labelCol={{ span: 8 }}
                        preserve={false}
                        wrapperCol={{ span: 8 }}
                        layout="horizontal"
                        onFinish={onFinish}
                        initialValues={{
                          newRoleName: '',
                          newRoleIcon: "01.png"
                        }}
                      >
                        <Form.Item label="New Role Name" name="newRoleName"
                          rules={[
                            {
                              required: true,
                              message: "Can be empty!"
                            },
                          ]}
                        >
                          <Input style={{ width: 200 }} />
                        </Form.Item>
                        <Form.Item label="Upload Icon" name="newRoleIcon">
                          <Select style={{ width: 100 }} size="large" className="avatarSelect">
                            {_.map(avatarList, (value, key) => {
                              return (
                                <Select.Option key={key} value={key} className="avatarOption">
                                  <Image preview={false} src={value["default"]} className="avatarList" />
                                </Select.Option>
                              )
                            })}
                          </Select>
                        </Form.Item>

                        <Form.Item wrapperCol={{ offset: 8 }}>
                          <Button type="primary" htmlType="submit">
                            Save Role
                          </Button>
                        </Form.Item>
                      </Form>
                    </Col>
                  </Row>
                )
              }}>Create A Role</Button>
              <Button type="ghost" onClick={() => {
                showModal(
                  "editRole",
                  "Edit Role",
                  <Row style={{ marginTop: 20 }} gutter={16}>
                    <Col className="gutter-row" span={24}>
                      <Form
                        labelCol={{ span: 8 }}
                        wrapperCol={{ span: 8 }}
                        layout="horizontal"
                        onFinish={onFinishEdit}
                        form={editRoleForm}
                        preserve={false}
                      >
                        <Form.Item label="Edit role" name="editRoleId">
                          <Select onChange={editChangeRole} style={{ width: 200 }} placeholder="Select a Role" size="large" className="avatarSelect">
                            {_.map(treeOptions.allMenu, item => {
                              return (
                                <Select.Option disabled={item.name === 'admin' || item.name === 'root'} key={item.id} value={JSON.stringify({ id: item.id, name: item.name, avatar: item.avatar })} className="avatarOption">
                                  {item.name}
                                </Select.Option>
                              )
                            })}
                          </Select>
                        </Form.Item>
                        <Form.Item label="Edit Name" name="editRoleName"
                          rules={[
                            {
                              required: true,
                              message: "Can be empty!"
                            },
                          ]}
                        >
                          <Input style={{ width: 200 }} />
                        </Form.Item>
                        <Form.Item label="Upload Icon" name="editRoleIcon">
                          <Select style={{ width: 100 }} size="large" className="avatarSelect">
                            {_.map(avatarList, (value, key) => {
                              return (
                                <Select.Option key={key} value={key} className="avatarOption">
                                  <Image preview={false} src={value["default"]} className="avatarList" />
                                </Select.Option>
                              )
                            })}
                          </Select>
                        </Form.Item>

                        <Form.Item wrapperCol={{ offset: 8 }}>
                          <Space>
                            <Button type="primary" htmlType="submit">
                              Save Role
                            </Button>
                            <Button type="primary" htmlType="button" danger={true} onClick={() => { deleteRole() }}>
                              Delete Role
                            </Button>
                          </Space>

                        </Form.Item>
                      </Form>
                    </Col>
                  </Row>
                )
              }}>Edit Roles</Button>
            </Space>

          </Card>
        </Col>

        {/* eidt menu  Add Menu*/}
        <Col className="gutter-row" span={9}>
          <Card title="Edit or Create Menu">
            <Divider orientation="left">All avaiable menu</Divider>
            <Tree className="roleGap"
              defaultExpandAll={true}
              showIcon={true}
              showLine={{ showLeafIcon: false }}
              treeData={editTreeOptions.treeData}
            />
            <Space size="small">
              <Button type="primary" onClick={() => {
                showModal(
                  "addMenu",
                  "Add Menu",
                  <Row style={{ marginTop: 20 }} gutter={16}>
                    <Col className="gutter-row" span={24}>
                      <Form
                        labelCol={{ span: 8 }}
                        wrapperCol={{ span: 8 }}
                        layout="horizontal"
                        onFinish={onFinishAddMenu}
                        initialValues={
                          {
                            menuIcon: "ClockCircleOutlined",
                            parentMenu: "/"
                          }
                        }
                        form={addMenuForm}
                      >
                        <Form.Item label="Select Parent Menu" name="parentMenu">
                          <Select style={{ width: 200 }} placeholder="Select a Menu" size="large" className="avatarSelect">
                            {
                              _.map(_.pluck(treeOptions.allMenu[0].menu_list, 'key'), item => {
                                return (
                                  <Select.Option value={item} key={item}>{item}</Select.Option>
                                )
                              })
                            }
                          </Select>
                        </Form.Item>

                        <Form.Item label="Menu Name" name="menuName"
                          rules={[
                            {
                              required: true,
                              message: "Can be empty!"
                            },
                          ]}
                        >
                          <Input style={{ width: 200 }} />
                        </Form.Item>
                        <Form.Item label="Upload Icon" name="menuIcon">
                          <Select style={{ width: 200 }} size="large" className="avatarSelect">
                            {_.map(_.allKeys(AllIcon).slice(100, 200), (key) => {
                              return (
                                <Select.Option key={key} value={key} className="avatarOption" >
                                  <DynComp Obj={AllIcon} name={key} />
                                </Select.Option>

                              )
                            })}
                          </Select>
                        </Form.Item>

                        <Form.Item wrapperCol={{ offset: 8 }}>
                          <Space>
                            <Button type="primary" htmlType="submit">
                              Save Menu
                            </Button>
                          </Space>

                        </Form.Item>
                      </Form>
                    </Col>
                  </Row>
                )
              }}>Add Menu</Button>
            </Space>

          </Card>
        </Col>
      </Row>

      {/* <Row style={{ marginTop: 20 }} gutter={16}>
        <Col className="gutter-row" span={12}>
          <Card title="Create Role">
            <Select defaultValue="jack" style={{ width: 100 }} size="large" className="avatarSelect">
              <Select.Option value="jack" className="avatarOption">
                <Image src={avatarList["01.png"]["default"]} className="avatarList" />
              </Select.Option>
              <Select.Option value="lucy">Lucy</Select.Option>
              <Select.Option value="disabled" disabled>
                Disabled
              </Select.Option>
              <Select.Option value="Yiminghe">yiminghe</Select.Option>
            </Select>

          </Card>
        </Col>
      </Row> */}
      <Modal
        title={confirmModal.title}
        open={confirmModal.show}
        onOk={onConfirm}
        onCancel={hideModal}
        okText="confirm"
        cancelText="cancel"
        forceRender
        destroyOnClose={true}
      >
        <div>{confirmModal.content}</div>
      </Modal>
    </>
  )
}

export default Roles
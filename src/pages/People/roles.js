import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import {
  message,
  Tree,
  Avatar,
  Segmented,
  Card,
  Row,
  Col,
  Button,
  Modal,
  Divider,
  Space,
  Form,
  Input,
  Image,
  Select,
  Tag,
  Descriptions,
} from "antd";
import http from "@/tools/http";
import {
  deepClone,
  convertPathToMenu,
  convertPathToRouter,
  getAllLabelsFromMenu
} from "@/tools";
import DynComp from "@/components/DynamicComponent";
import * as AllIcon from "@ant-design/icons";
import { baseURL } from "@/tools";
import "./roles.scss";
//import useStore from "@/store"
import _ from "underscore";

// convert to tree menu including icon for ant design format

function Roles() {
  const [treeOptions, setTreeOptions] = useState({
    treeData: [],
    onCheck: () => { },
    checkedKeys: [],
  });
  const [confirmModal, setConfirmModal] = useState({
    from: "",
    show: false,
    title: "",
    content: "",
  });
  const [roleData, setRoleData] = useState({
    roleId: 1,
    roleName: "admin",
    resultMenu: [],
    resultRouter: [],
  });
  const [avatarList, setAvatarList] = useState({});

  const navicate = useNavigate();
  const [addMenuForm] = Form.useForm();
  const [editRoleForm] = Form.useForm();
  const [addRootSubMenuForm] = Form.useForm();

  const [editTreeOptions, editSetTreeOptions] = useState({ treeData: [] });

  const [refreshValue, setRefreshValue] = useState(false);
  useEffect(() => {
    const importAll = (require) =>
      require.keys().reduce((acc, next) => {
        acc[next.replace("./", "")] = require(next);
        return acc;
      }, {});
    const images = importAll(
      require.context("@/assets/head", false, /\.(png|jpe?g|svg)$/)
    );
    setAvatarList(images);

    const loginError = (info) => {
      message.error(info);
    };
    let response = async () => {
      try {
        message.loading({
          content: "Loading Roles...",
          key: "loading",
        });
        let result = await http.get("/roles/getRoles");
        if (result.data.status === "OK") {
          message.success({
            content: "Loaded!",
            key: "loading",
            duration: 2,
          });

          let allServerData = result.data.info.roles;

          //['/', '/setting', '/people', '/team', '/tools']
          // let testData = allServerData[0].menu_list;
          // let allMenuKeys = _.pluck(testData, 'key');
          //console.log(_.pluck(testData, 'key'));

          let adminMenu = getAllMenuListByRole(result.data.info.roles);
          setTreeOptions({
            ...treeOptions,
            allMenu: allServerData,
            checkedKeys: getAllKeys(adminMenu),
            treeData: organzeTreeMenu(allServerData, "admin", "admin"), //this data is always unchangable
          });

          // edit tree data another tree
          editSetTreeOptions({
            ...editTreeOptions,
            allMenu: allServerData,
            treeData: organzeTreeMenuEdit(allServerData, "admin", "edit"),
          });
        } else {
          loginError(result.data.info.error);
        }
      } catch (e) {
        loginError(e);
      }
    };

    response();
    // eslint-disable-next-line
  }, [refreshValue]);

  function organzeTreeMenu(list, roleName = "admin", targetRole = "admin") {
    let handleList = [];
    list.forEach((item) => {
      if (item.name === roleName) {
        handleList = deepClone(item.menu_list);
      }
    });

    handleList.forEach((item) => {
      if (item["children"]) {
        item["children"].forEach((ele) => {
          ele.title = ele.label;
          ele.value = ele.key;
          ele.icon = <DynComp Obj={AllIcon} name={ele.icon} />;
          if (
            (roleName === "admin" || roleName === "root") &&
            (targetRole === "admin" || targetRole === "root")
          ) {
            ele.disabled = true;
          }
        });
      }
      if (item.key === "/") {
        item.disabled = true;
      }
      if (
        (roleName === "admin" || roleName === "root") &&
        (targetRole === "admin" || targetRole === "root")
      ) {
        item.disabled = true;
      }
      item.title = item.label;
      item.value = item.key;
      item.icon = <DynComp Obj={AllIcon} name={item.icon} />;
    });
    return handleList;
  }

  function organzeTreeMenuEdit(list, roleName = "admin", targetRole = "admin") {
    let handleList = [];
    list.forEach((item) => {
      if (item.name === roleName) {
        handleList = deepClone(item.menu_list);
      }
    });

    handleList.forEach((item) => {
      if (item["children"]) {
        item["children"].forEach((ele) => {
          ele.title = (
            <Space size={1}>
              <div style={{ marginRight: 25 }}>{ele.label}</div>
              <Tag
                onClick={() => {
                  editMenu(ele.label);
                }}
                color="#2db7f5"
              >
                edit
              </Tag>
              <Tag
                onClick={() => {
                  deleteMenu({ "parentLabel": item.label, "childLabel": ele.label }, item, "child");
                }}
                color="#f50"
              >
                delete
              </Tag>
            </Space>
          );
          if (
            ele.key === "/people/roles" ||
            ele.key === "/people/admins" ||
            ele.key === "/people/users"
          ) {
            ele.title = ele.label;
            ele.disabled = true;
          }
          ele.value = ele.key;
          ele.icon = <DynComp Obj={AllIcon} name={ele.icon} />;
          if (
            (roleName === "admin" || roleName === "root") &&
            (targetRole === "admin" || targetRole === "root")
          ) {
            ele.disabled = true;
          }
        });
      }

      if (
        (roleName === "admin" || roleName === "root") &&
        (targetRole === "admin" || targetRole === "root")
      ) {
        item.disabled = true;
      }
      item.title = (
        <Space size={1}>
          <div style={{ marginRight: 25 }}>{item.label}</div>
          <Tag
            onClick={() => {
              editMenu(item.label);
            }}
            color="#2db7f5"
          >
            edit
          </Tag>
          <Tag
            onClick={() => {
              deleteMenu({ "parentLabel": item.label, "childLabel": item.label }, item, "parent");
            }}
            color="#f50"
          >
            delete
          </Tag>
        </Space>
      );
      if (item.key === "/" || item.key === "/people") {
        item.disabled = true;
        item.title = item.label;
      }
      item.value = item.key;
      item.icon = <DynComp Obj={AllIcon} name={item.icon} />;
    });
    return handleList;
  }

  function getAllKeys(list) {
    list = deepClone(list);
    let handleList = [];
    _.each(list, (item) => {
      if (item["children"] && item["children"].length > 0) {
        _.each(item["children"], (ele) => {
          handleList.push(ele.key);
        });
      }
      handleList.push(item.key);
    });

    return handleList;
  }

  //delete the parent key if children keys are not all selected
  function selectMyKeys(allMenu, targetMenu) {
    allMenu = deepClone(allMenu);
    targetMenu = deepClone(targetMenu);

    let allMenuKeys = getAllKeys(allMenu);
    let targetMenuKeys = getAllKeys(targetMenu);

    let twoLevelKeysAllmenu = _.filter(allMenuKeys, (item) => {
      return item.split("/").length === 3;
    });
    let twoLevelKeysTargetMenu = _.filter(targetMenuKeys, (item) => {
      return item.split("/").length === 3;
    });

    let allMenuGroups = _.groupBy(twoLevelKeysAllmenu, (item) => {
      return item.split("/")[1];
    });
    let targetMenuGroups = _.groupBy(twoLevelKeysTargetMenu, (item) => {
      return item.split("/")[1];
    });

    let deleteArr = [];
    _.each(targetMenuGroups, (item, key) => {
      if (item.length !== allMenuGroups[key].length) {
        deleteArr.push("/" + key);
      }
    });

    return _.difference(targetMenuKeys, deleteArr);
  }
  // get menulist by role, default admin(all menu)
  function getAllMenuListByRole(list, roleName = "admin") {
    let handleList = [];
    list.forEach((item) => {
      if (item.name === roleName) {
        handleList = deepClone(item.menu_list);
      }
    });
    return handleList;
  }

  const changeRole = (value) => {
    const result = _.find(treeOptions.allMenu, (item) => item.id === value);
    const adminMenu = _.find(treeOptions.allMenu, (item) => item.id === 1);
    const finalResult = selectMyKeys(adminMenu.menu_list, result.menu_list);
    //const finalResult = getAllKeys(result.menu_list)

    //console.log("result.name", result.name)

    setRoleData({
      ...roleData,
      roleId: result.id,
      roleName: result.name,
      resultMenu: [],
      resultRouter: [],
    });
    setTreeOptions({
      ...treeOptions,
      checkedKeys: finalResult,
      treeData: organzeTreeMenu(treeOptions.allMenu, "admin", result.name),
    });
  };

  const mySuperCheck = (checkedKeys, info) => {
    //console.log("checkedKeys-super", checkedKeys)
    let adminRoleInfo = _.find(
      treeOptions.allMenu,
      (item) => item.name === "admin"
    );
    let filterDashKey = _.filter(checkedKeys, (item) => item !== "/");

    setTreeOptions({ ...treeOptions, checkedKeys });

    let resultMenu = convertPathToMenu(adminRoleInfo.menu_list, filterDashKey);
    let resultRouter = convertPathToRouter(
      adminRoleInfo.router_list,
      filterDashKey
    );

    setRoleData({
      ...roleData,
      resultMenu: JSON.stringify(resultMenu),
      resultRouter: JSON.stringify(resultRouter),
    });
    //console.log("resultMenu", resultMenu)
    //console.log("resultRouter", resultRouter)
  };

  const showModal = (from, title, content) => {
    setConfirmModal({ ...confirmModal, from, title, content, show: true });
  };

  const hideModal = () => {
    setConfirmModal({ ...confirmModal, show: false });
  };

  const onFinish = (values) => {
    console.log("finish", values);
    if (treeOptions.allMenu.length > 5) {
      message.error("roles number can not exceed 6");
      return;
    }
    let newMenu = JSON.stringify([
      { key: "/", icon: "PieChartOutlined", label: "Dashboard" },
    ]);
    let newRouter = JSON.stringify([
      {
        path: "/",
        element: "Layout",
        children: [{ path: "/", element: "Home" }],
      },
      { path: "/Login", element: "Login" },
      { path: "/Logout", element: "Login" },
      { path: "*", element: "NotFound" },
    ]);

    http
      .post("/roles/createRole", { newMenu, newRouter, ...values })
      .then((res) => {
        console.log(res);
        if (res.data.status === "OK") {
          message.success({
            content: "Save successfully!",
            key: "Processing...",
            duration: 2,
          });
          refresh();
          hideModal();
        }
      });
  };

  const refresh = () => {
    setRefreshValue(!refreshValue);
  };

  const onFinishEdit = (values) => {
    let editRoleIcon = values.editRoleIcon;
    let editRoleName = values.editRoleName;
    let editRoleId = JSON.parse(values.editRoleId).id;
    http
      .post("/roles/updateRoleName", { editRoleIcon, editRoleName, editRoleId })
      .then((res) => {
        console.log(res);
        if (res.data.status === "OK") {
          message.success({
            content: "Save successfully!",
            key: "Processing...",
            duration: 2,
          });

          editRoleForm.setFieldsValue({
            editRoleId: values.editRoleName,
            editRoleName: values.editRoleName,
            editRoleIcon: values.editRoleIcon,
          });
          refresh();
          hideModal();
          //changeRole(editRoleId)
        }
      });
  };

  const deleteRole = () => {
    if (editRoleForm.getFieldValue("editRoleId")) {
      let id = JSON.parse(editRoleForm.getFieldValue("editRoleId")).id;
      http.post("/roles/deleteRole", { id }).then((res) => {
        console.log(res);
        if (res.data.status === "OK") {
          message.success({
            content: "Delete successfully!",
            key: "Processing...",
            duration: 2,
          });
          refresh();
          hideModal();
        }
      });
    } else {
      message.error({
        content: "Please select one role",
        key: "Processing...",
        duration: 2,
      });
    }
  };

  const editChangeRole = (values) => {
    let formData = JSON.parse(values);
    editRoleForm.setFieldsValue({
      editRoleId: values,
      editRoleName: formData.name,
      editRoleIcon: formData.avatar,
    });
  };
  const onConfirm = () => {
    hideModal();
    if (confirmModal.from === "updateMenu") {
      http.post("/roles/updateRole", roleData).then((res) => {
        //console.log(res);
        if (res.data.status === "OK") {
          message.success({
            content: "Save successfully!",
            key: "Processing...",
            duration: 2,
          });
          refresh();
          hideModal();
        }
      });
    }

    if (confirmModal.from === "createRole") {
      /* let newMenu = '[{"key": "/", "icon": "PieChartOutlined", "label": "Dashboard"}]'
      let newRouter = '[{"path": "/", "element": "Layout", "children": [{"path": "/", "element": "Home"}]}, {"path": "/Login", "element": "Login"}, { "path": "/Logout", "element": "Login" },{"path": "*", "element": "NotFound"}]' */
      //console.log("createRole")
    }
  };

  const onlyConfirmModal = (from, title, content, callback, params) => {
    Modal.success({
      title,
      content,
      onOk: () => {
        callback(...params);
      },
    });
  };
  const isValid = (str) => {
    var reg = /^[a-zA-Z0-9_]+$/g;
    return !reg.test(str);
  };
  const onFinishAddMenu = () => {
    //console.log(treeOptions);
    let submitData = addMenuForm.getFieldsValue();
    let existingMenuNames = [];
    getAllLabelsFromMenu(treeOptions.allMenu[0].menu_list, existingMenuNames);
    existingMenuNames.push("Login");
    existingMenuNames.push("NotFound");
    existingMenuNames.push("Layout");
    existingMenuNames.push("Home");
    existingMenuNames = existingMenuNames.map((item) => item.toLowerCase());

    //name validation only for a-z A-Z and _
    if (isValid(submitData.menuName)) {
      message.error("name is not valid!");
      addMenuForm.setFieldValue("menuName", "");
      return;
    }

    if (submitData.menuName.length > 10) {
      message.error("name is too long!");
      addMenuForm.setFieldValue("menuName", "");
      return;
    }

    //name existing checking
    if (existingMenuNames.includes(submitData.menuName)) {
      message.error("name exist, please change another one!");
      addMenuForm.setFieldValue("menuName", "");
      return;
    }
    //generate both root menu and router
    if (submitData.parentMenu === "/") {
      http.post("/roles/addrootmenu", { ...submitData })
        .then((res) => {
          if (res.data.status === "OK") {
            onlyConfirmModal(
              "addRootMenuSuccess",
              "Successfully Added New Root Menu",
              "Please try to login to refresh!  Click OK button to redirect login page! And you should also configure pages first to make effective!",
              navicate,
              ["/Login"]
            );
          }
        })
        .catch((err) => {
          message.error(err);
        });
      //console.log(submitData);
    } else {
      // add only submenu, one submenu and one router
      http.post("/roles/addsubmenu", { ...submitData })
        .then((res) => {
          if (res.data.status === "OK") {
            onlyConfirmModal(
              "addSubMenuSuccess",
              "Successfully Added New Sub Menu",
              "Please try to login to refresh!  Click OK button to redirect login page! And you should also configure pages first to make effective!",
              navicate,
              ["/Login"]
            );
          }
        })
        .catch((err) => {
          message.error(err);
        });
    }

    //app1 {"key": "/app1", "icon": "menuIcon", "label": "App1"} 直接push到总菜单
    //no router //第一个元素下的children push([0].children) {"path": "/app1", "element": "App1"}

    //app1/users
    // {"key": "/app1/users", "icon": "SolutionOutlined", "label": "Users"}
    // {"path": "/app1/users", "element": "Users"}

    //create app1 folder, users.js, add router config in index.js

    //hideModal()
    /* let mockData = {
      isRootMenu:false,
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
    //console.log(addMenuForm.getFieldsValue());
  };

  const onFinishAddRootSubMenu = () => {
    let submitData = addRootSubMenuForm.getFieldsValue();
    let existingMenuNames = [];
    getAllLabelsFromMenu(treeOptions.allMenu[0].menu_list, existingMenuNames);
    existingMenuNames.push("Login");
    existingMenuNames.push("NotFound");
    existingMenuNames.push("Layout");
    existingMenuNames.push("Home");
    existingMenuNames = existingMenuNames.map((item) => item.toLowerCase());
    /* let mockData = {
      rootMenuIcon: "ClockCircleOutlined",
      rootMenuName: "/",
      subMenuIcon: "ClockCircleOutlined",
      subMenuName: "/"
    }; */

    //console.log(submitData);
    if (submitData.rootMenuName.length > 10) {
      message.error("name is too long!");
      addMenuForm.setFieldValue("rootMenuName", "");
      return;
    }

    if (submitData.subMenuName.length > 10) {
      message.error("name is too long!");
      addMenuForm.setFieldValue("subMenuName", "");
      return;
    }
    //name validation only for a-z A-Z and _
    if (isValid(submitData.rootMenuName)) {
      message.error("name is not valid!");
      addMenuForm.setFieldValue("rootMenuName", "");
      return;
    }

    if (isValid(submitData.subMenuName)) {
      message.error("name is not valid!");
      addMenuForm.setFieldValue("subMenuName", "");
      return;
    }

    if (submitData.rootMenuName === submitData.subMenuName) {
      message.error("root name can not be same as sub name");
      addMenuForm.setFieldValue("subMenuName", "");
      addMenuForm.setFieldValue("rootMenuName", "");
      return;
    }

    //name existing checking
    if (existingMenuNames.includes(submitData.rootMenuName)) {
      message.error("rootname exist, please change another one!");
      addMenuForm.setFieldValue("rootMenuName", "");
      return;
    }

    if (existingMenuNames.includes(submitData.subMenuName)) {
      message.error("subname exist, please change another one!");
      addMenuForm.setFieldValue("rootMenuName", "");
      return;
    }

    http.post("/roles/addrootsubmenu", { ...submitData })
      .then((res) => {
        if (res.data.status === "OK") {
          onlyConfirmModal(
            "addRootSubMenuSuccess",
            "Successfully Added New Root Sub Menu",
            "Please try to login to refresh!  Click OK button to redirect login page! And you should also configure pages first to make effective!",
            navicate,
            ["/Login"]
          );
        }
      })
      .catch((err) => {
        message.error(err);
      });
  }
  const editMenu = (value) => {
    //console.log("edit", value)
  };
  const deleteMenu = (label, parentNode, from) => {
    //four cases, 1. delete just parent, 2. delete just child, 
    //3.delete parent and children together 4. one parent and one child, can not be deleted

    if (from === "parent") {
      if (parentNode?.children?.length === undefined) {
        //I am a parent, I have no children, delete one route and one menu
        Modal.confirm({
          title: `No submenu, delete root menu`,
          content: (
            <div>
              <p>Are you sure to delete {label.parentLabel} ?</p>
            </div>
          ),
          onOk() {
            http.post("/roles/deleterootmenu", { label: label.parentLabel })
              .then((res) => {
                if (res.data.status === "OK") {
                  onlyConfirmModal(
                    "DeleteRootMenuSuccess",
                    "Successfully Delete New Root Menu",
                    "Please try to login to refresh!  Click OK button to redirect login page! ",
                    navicate,
                    ["/Login"]
                  );
                }
              })
              .catch((err) => {
                message.error(err);
              });
          },
        });
      } else {
        //console.log(`I am a parent, I have ${parentNode.children.length} children`)
        Modal.confirm({
          title: `Delete root and all submenu`,
          content: (
            <div>
              <p>Are you sure to delete {label.parentLabel} and all of submenu?</p>
            </div>
          ),
          onOk() {
            //need two parme
            //console.log(label);
            //console.log(parentNode.children[0].label);
            //return;
            http.post("/roles/deletewholerootsubmenu", { parentLabel: label.parentLabel, childLabel: parentNode.children[0].label })
              .then((res) => {
                if (res.data.status === "OK") {
                  onlyConfirmModal(
                    "DeleteWholeParentSubMenuSuccess",
                    "Successfully Delete parent and sub together!",
                    "Please try to login to refresh!  Click OK button to redirect login page!",
                    navicate,
                    ["/Login"]
                  );
                }
              })
              .catch((err) => {
                message.error(err);
              });
          },
        });
      }
    } else {
      //console.log(`i am a child, my parents have ${parentNode.children.length} children`)
      if (parentNode.children.length === 1) {
        Modal.warn({
          title: `You have only one child`,
          content: (
            <div>
              <p>
                You can not delete in this case, if you want to delete, delete the <b>{label.parentLabel}</b> parent menu
                and <b>{label.childLabel}</b> submenu will be deleted!
              </p>
            </div>
          )
        })
      } else { // two more children submenu,just delete submenu
        Modal.confirm({
          title: `Delete a submenu`,
          content: (
            <div>
              <p>Are you sure to delete {label.childLabel}</p>
            </div>
          ),
          onOk() {
            //sanme as delete just root menu
            http.post("/roles/deleterootmenu", { label: label.childLabel })
              .then((res) => {
                if (res.data.status === "OK") {
                  onlyConfirmModal(
                    "DeleteRootMenuSuccess",
                    "Successfully Delete sub Menu",
                    "Please try to login to refresh!  Click OK button to redirect login page!",
                    navicate,
                    ["/Login"]
                  );
                }
              })
              .catch((err) => {
                message.error(err);
              });
          },
        });
      }
    }
    /* Modal.confirm({
      title: `Dangerous Deleting Operation`,
      content: (
        <div>
          <p>Are you sure to delete {value} ?</p>
        </div>
      ),
      onOk() {
        console.log("ok");
      },
    });
    console.log("delete", value); */
  };
  /* const addMenuRootControl = (value) => {
    if (value.target.checked) {
      addMenuForm.setFieldValue("parentMenu", "/")
    }

  } */

  /* const onAddMenuChangeSwitch = () => {
    setAddMenu(pre => {
      return { ...pre, checkedButton: !pre.checkedButton }
    })
    addMenuForm.setFieldValue("menuName", "12222")

  } */

  return (
    treeOptions.treeData.length > 0 && (
      <>
        {/* <button onClick={deleteMenu}>click</button> */}
        <Row gutter={[16, 16]}>
          <Col className="gutter-row" span={24}>
            <Descriptions
              title="Operations Notice (Developer Only, Carefully for adding and deleting)"
              bordered
              column={1}
              size="small"
            >
              <Descriptions.Item label="First Case" labelStyle={{ width: 120 }}>
                Create root menu like [Setting], if so, it have both
                corresponding router and menu. But it can not have submenu,
                otherwise it will report an error! <b>(One menu, one router)</b>
              </Descriptions.Item>
              <Descriptions.Item label="Second Case">
                Create a new root menu and also you must add at least one
                submenu, the root menu does not have corresponding router. The
                submenu have have both corresponding router and menu
                <b> (One root menu, one submenu, and a router for submenu)</b>
              </Descriptions.Item>
              <Descriptions.Item label="Third Case">
                Just create a submenu, not a root menu
                <b> (One submenu, one router for submenu)</b>
              </Descriptions.Item>
              <Descriptions.Item label="Others">
                Once you have created new, you should add corresponding pages
                and configure router! BTW, deleting is also the same method!
              </Descriptions.Item>
            </Descriptions>
          </Col>
        </Row>

        <Row gutter={[16, 16]}>
          <Col className="gutter-row" span={14}>
            <Card title="Roles Management (can only update by one role once)">
              <Segmented
                onChange={changeRole}
                options={treeOptions.allMenu.map((item) => {
                  return {
                    label: (
                      <div style={{ padding: 4 }}>
                        <Avatar src={baseURL + "static/" + item.avatar} />
                        <div>{item.name}</div>
                      </div>
                    ),
                    value: item.id,
                  };
                })}
              />
              <Tree
                className="roleGap"
                checkable
                defaultExpandAll={true}
                onCheck={mySuperCheck}
                showIcon={true}
                checkedKeys={treeOptions.checkedKeys}
                showLine={{ showLeafIcon: false }}
                treeData={treeOptions.treeData}
              />
              <Space size="small">
                <Button
                  type="primary"
                  disabled={
                    roleData.roleName === "admin" ||
                    roleData.roleName === "root" ||
                    roleData.resultMenu.length === 0
                  }
                  onClick={() =>
                    showModal(
                      "updateMenu",
                      "Update Role Menu",
                      `Are you sure updating role ${roleData.roleName} menu?`
                    )
                  }
                >
                  Save Settings
                </Button>
                <Button
                  type="primary"
                  onClick={() => {
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
                              newRoleName: "",
                              newRoleIcon: "01.png",
                            }}
                          >
                            <Form.Item
                              label="New Role Name"
                              name="newRoleName"
                              rules={[
                                {
                                  required: true,
                                  message: "Can be empty!",
                                },
                              ]}
                            >
                              <Input style={{ width: 200 }} />
                            </Form.Item>
                            <Form.Item label="Upload Icon" name="newRoleIcon">
                              <Select
                                style={{ width: 100 }}
                                size="large"
                                className="avatarSelect"
                              >
                                {_.map(avatarList, (value, key) => {
                                  return (
                                    <Select.Option
                                      key={key}
                                      value={key}
                                      className="avatarOption"
                                    >
                                      <Image
                                        preview={false}
                                        src={value["default"]}
                                        className="avatarList"
                                      />
                                    </Select.Option>
                                  );
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
                    );
                  }}
                >
                  Create A Role
                </Button>
                <Button
                  type="primary"
                  onClick={() => {
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
                              <Select
                                onChange={editChangeRole}
                                style={{ width: 200 }}
                                placeholder="Select a Role"
                                size="large"
                                className="avatarSelect"
                              >
                                {_.map(treeOptions.allMenu, (item) => {
                                  return (
                                    <Select.Option
                                      disabled={
                                        item.name === "admin" ||
                                        item.name === "root"
                                      }
                                      key={item.id}
                                      value={JSON.stringify({
                                        id: item.id,
                                        name: item.name,
                                        avatar: item.avatar,
                                      })}
                                      className="avatarOption"
                                    >
                                      {item.name}
                                    </Select.Option>
                                  );
                                })}
                              </Select>
                            </Form.Item>
                            <Form.Item
                              label="Edit Name"
                              name="editRoleName"
                              rules={[
                                {
                                  required: true,
                                  message: "Can be empty!",
                                },
                              ]}
                            >
                              <Input style={{ width: 200 }} />
                            </Form.Item>
                            <Form.Item label="Upload Icon" name="editRoleIcon">
                              <Select
                                style={{ width: 100 }}
                                size="large"
                                className="avatarSelect"
                              >
                                {_.map(avatarList, (value, key) => {
                                  return (
                                    <Select.Option
                                      key={key}
                                      value={key}
                                      className="avatarOption"
                                    >
                                      <Image
                                        preview={false}
                                        src={value["default"]}
                                        className="avatarList"
                                      />
                                    </Select.Option>
                                  );
                                })}
                              </Select>
                            </Form.Item>

                            <Form.Item wrapperCol={{ offset: 8 }}>
                              <Space>
                                <Button type="primary" htmlType="submit">
                                  Save Role
                                </Button>
                                <Button
                                  type="primary"
                                  htmlType="button"
                                  danger={true}
                                  onClick={() => {
                                    deleteRole();
                                  }}
                                >
                                  Delete Role
                                </Button>
                              </Space>
                            </Form.Item>
                          </Form>
                        </Col>
                      </Row>
                    );
                  }}
                >
                  Edit Roles
                </Button>
              </Space>
            </Card>
          </Col>

          {/* eidt menu  Add sub Menu*/}
          <Col className="gutter-row" span={10}>
            <Card title="Edit or Create Menu">
              <Divider orientation="left">All avaiable menu</Divider>
              <Tree
                className="roleGap"
                defaultExpandAll={true}
                showIcon={true}
                showLine={{ showLeafIcon: false }}
                treeData={editTreeOptions.treeData}
              />
              <Space size="small">
                <Button
                  type="primary"
                  onClick={() => {
                    showModal(
                      "addMenu",
                      "Add Root Menu",
                      <Row style={{ marginTop: 20 }} gutter={16}>
                        <Col className="gutter-row" span={24}>
                          <Form
                            labelCol={{ span: 8 }}
                            wrapperCol={{ span: 8 }}
                            layout="horizontal"
                            onFinish={onFinishAddMenu}
                            initialValues={{
                              menuIcon: "ClockCircleOutlined",
                              parentMenu: "/",
                            }}
                            form={addMenuForm}
                          >
                            <Form.Item
                              label="Select Menu"
                              name="parentMenu"
                              tooltip="/ for root menu, others for submenu"
                            >
                              <Select
                                style={{ width: 200 }}
                                placeholder="Select a Menu"
                                size="large"
                                className="avatarSelect"
                              >
                                <Select.Option value="/" key="/">
                                  /
                                </Select.Option>{" "}
                                {/* for root menu and others together */}
                                {treeOptions.allMenu[0].menu_list
                                  .map((e1) => {
                                    if (e1.hasOwnProperty("children")) {
                                      return e1.key;
                                    } else {
                                      return undefined;
                                    }
                                  })
                                  .filter((e2) => e2 !== undefined)
                                  .map((e3) => {
                                    return (
                                      <Select.Option value={e3} key={e3}>
                                        {e3}
                                      </Select.Option>
                                    );
                                  })}
                              </Select>
                            </Form.Item>

                            <Form.Item
                              label="Menu Name"
                              name="menuName"
                              tooltip="Do not contain '/', best for a unique word"
                              rules={[
                                {
                                  required: true,
                                  message: "Can be empty!",
                                },
                              ]}
                            >
                              <Input style={{ width: 200 }} />
                            </Form.Item>
                            <Form.Item label="Upload Icon" name="menuIcon">
                              <Select
                                style={{ width: 200 }}
                                size="large"
                                className="avatarSelect"
                              >
                                {_.map(
                                  _.allKeys(AllIcon).slice(100, 200),
                                  (key) => {
                                    return (
                                      <Select.Option
                                        key={key}
                                        value={key}
                                        className="avatarOption"
                                      >
                                        <DynComp Obj={AllIcon} name={key} />
                                      </Select.Option>
                                    );
                                  }
                                )}
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
                    );
                  }}
                >
                  Add Root Menu
                </Button>
              </Space>
              <Space size="small" style={{ marginLeft: 10 }}>
                <Button
                  type="primary"
                  onClick={() => {
                    showModal(
                      "addRootSubMenu",
                      "Add Root Sub Menu (create one root and one sub menu)",
                      <Row style={{ marginTop: 20 }} gutter={16}>
                        <Col className="gutter-row" span={24}>
                          <Form
                            labelCol={{ span: 8 }}
                            wrapperCol={{ span: 8 }}
                            layout="horizontal"
                            onFinish={onFinishAddRootSubMenu}
                            initialValues={{
                              rootMenuIcon: "ControlTwoTone",
                              subMenuIcon: "FileImageTwoTone",
                              rootMenuName: "",
                              subMenuName: ""
                            }}
                            form={addRootSubMenuForm}
                          >
                            <Form.Item
                              label="Root Menu Name"
                              name="rootMenuName"
                              tooltip="Do not contain '/', best for a unique word"
                              rules={[
                                {
                                  required: true,
                                  message: "Can be empty!",
                                },
                              ]}
                            >
                              <Input style={{ width: 200 }} />
                            </Form.Item>

                            <Form.Item
                              label="Sub Menu Name"
                              name="subMenuName"
                              tooltip="Do not contain '/', best for a unique word"
                              rules={[
                                {
                                  required: true,
                                  message: "Can be empty!",
                                },
                              ]}
                            >
                              <Input style={{ width: 200 }} />
                            </Form.Item>
                            <Form.Item label="Upload Root Icon" name="rootMenuIcon">
                              <Select
                                style={{ width: 200 }}
                                size="large"
                                className="avatarSelect"
                              >
                                {_.map(
                                  _.allKeys(AllIcon).slice(150, 200),
                                  (key) => {
                                    return (
                                      <Select.Option
                                        key={key}
                                        value={key}
                                        className="avatarOption"
                                      >
                                        <DynComp Obj={AllIcon} name={key} />
                                      </Select.Option>
                                    );
                                  }
                                )}
                              </Select>
                            </Form.Item>
                            <Form.Item label="Upload Sub Icon" name="subMenuIcon">
                              <Select
                                style={{ width: 200 }}
                                size="large"
                                className="avatarSelect"
                              >
                                {_.map(
                                  _.allKeys(AllIcon).slice(250, 300),
                                  (key) => {
                                    return (
                                      <Select.Option
                                        key={key}
                                        value={key}
                                        className="avatarOption"
                                      >
                                        <DynComp Obj={AllIcon} name={key} />
                                      </Select.Option>
                                    );
                                  }
                                )}
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
                    );
                  }}
                >
                  Add Root Sub Menu
                </Button>
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
  );
}

export default Roles;

//import useStore from "@/store"
import { useEffect, useState } from "react"
import { message, Tree } from 'antd'
import http from "@/tools/http"
import { deepClone, convertPathToMenu } from "@/tools"
import DynComp from '@/components/DynamicComponent'
import * as AllIcon from '@ant-design/icons'
import useStore from "@/store"
//const _ = require('underscore')

function organzeTreeMenu (roleName, list) {
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
      })
    }
    if (item.key === "/") {
      item.disabled = true
    }
    item.title = item.label
    item.value = item.key
    item.icon = <DynComp Obj={AllIcon} name={item.icon} />
  })
  return handleList
}

function getAllMenuList (roleName, list) {
  let handleList = []
  list.forEach(item => {
    if (item.name === roleName) {
      handleList = deepClone(item.menu_list)
    }
  })
  return handleList
}
/* function submitTreeMenu (allList, list) {
  let resultList = []

  list.forEach(ele1 => {
    allList.forEach(ele2 => {
      if (ele1 === ele2.key) {
        resultList.push(ele2)
      }
    })
  })
} */

function Roles () {
  const [treeOptions, setTreeOptions] = useState({ treeData: [] })
  const [allMenu, setAllMenu] = useState([])
  useEffect(() => {
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
          let allTempMenu = getAllMenuList(useStore.loginStore.role, result.data.info.roles)
          console.log(allTempMenu)
          setAllMenu(allTempMenu)
          //console.log(getAllMenuList(useStore.loginStore.role, result.data.info.roles))
          setTreeOptions({
            checkable: true,
            defaultExpandAll: true,
            defaultCheckedKeys: ["/people"],
            treeData: organzeTreeMenu("admin", result.data.info.roles),
            onSelect,
            onCheck
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
  }, [])


  const onSelect = (selectedKeys, info) => {
    //console.log('selected', selectedKeys, info)
  }

  const onCheck = (checkedKeys, info) => {
    console.log('onCheck', checkedKeys)
    let result = convertPathToMenu(allMenu, checkedKeys)

    console.log(result)
    console.log("hehe", allMenu)
  }

  return (
    treeOptions.treeData.length > 0 && <Tree
      checkable
      defaultExpandAll={true}
      onSelect={onSelect}
      onCheck={onCheck}
      showIcon={true}
      showLine={{ showLeafIcon: false }}
      treeData={treeOptions.treeData}
    />
  )
}

export default Roles
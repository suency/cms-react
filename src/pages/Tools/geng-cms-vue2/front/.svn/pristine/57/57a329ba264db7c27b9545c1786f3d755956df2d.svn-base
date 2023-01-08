import request from '@/utils/request'

// 跟asyncRoutes 一样
export function getRoutes(data) {
  return request({
    url: 'admin/routes/getRoutes',
    method: 'post',
    data
  })
}

export function getRoles() {
  return request({
    url: 'admin/roles',
    method: 'get'
  })
}

export function addRole(data) {
  return request({
    url: 'admin/role/create',
    method: 'post',
    data
  })
}

export function updateRole(id, data) {
  return request({
    url: `admin/role/update`,
    method: 'post',
    data
  })
}

export function deleteRole(id) {
  return request({
    url: `admin/role/delete`,
    method: 'post',
    data: { id: id }
  })
}

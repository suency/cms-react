import request from '@/utils/request'

export function login(data) {
  return request({
    url: 'admin/user/login',
    method: 'post',
    data
  })
}

export function createUser(data) {
  return request({
    url: 'admin/user/create',
    method: 'post',
    data
  })
}

export function editUser(data) {
  return request({
    url: 'admin/user/edit',
    method: 'post',
    data
  })
}

export function deleteUser(data) {
  return request({
    url: 'admin/user/delete',
    method: 'post',
    data
  })
}

export function getInfo(token) {
  return request({
    url: 'admin/user/info',
    method: 'get',
    params: { token }
  })
}

export function systemUsers() {
  return request({
    url: 'admin/user/systemUsers',
    method: 'get'
  })
}

export function logout() {
  return request({
    url: 'admin/user/logout',
    method: 'post'
  })
}

import request from '@/utils/request'

export function getAllTables() {
  return request({
    url: 'admin/DbAdmin/getAllTables',
    method: 'get'
  })
}

export function updateUser(data) {
  return request({
    url: 'admin/userList/updateUser',
    method: 'post',
    data
  })
}

export function deleteVote() {
  return request({
    url: 'admin/tip/deleteVote',
    method: 'post'
  })
}

export function changeVoteStatus(data) {
  return request({
    url: 'admin/tip/changeVoteStatus',
    method: 'post',
    data: { stop: data }
  })
}

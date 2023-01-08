import request from '@/utils/request'

export function getTip() {
  return request({
    url: 'admin/tip/getTip',
    method: 'get'
  })
}

export function updateTip(data) {
  return request({
    url: 'admin/tip/updateTip',
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

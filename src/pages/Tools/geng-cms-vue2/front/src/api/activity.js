import request from '@/utils/request'

export function getBanner() {
  return request({
    url: 'admin/activity/getBanner',
    method: 'get'
  })
}

export function updateOrder(data) {
  return request({
    url: 'admin/activity/updateOrder',
    method: 'post',
    data
  })
}

export function updateBanner(data) {
  return request({
    url: 'admin/activity/updateBanner',
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

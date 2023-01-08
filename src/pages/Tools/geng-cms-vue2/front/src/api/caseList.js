import request from '@/utils/request'

export function getCaseList(data) {
  return request({
    url: 'admin/caseList/getCaseList',
    method: 'POST',
    data
  })
}

export function getCaseDetail(data) {
  return request({
    url: 'admin/caseList/getCaseDetail',
    method: 'POST',
    data
  })
}

export function updateCase(data) {
  return request({
    url: 'admin/caseList/updateCase',
    method: 'post',
    data
  })
}

export function deleteCase(data) {
  return request({
    url: 'admin/caseList/deleteCase',
    method: 'post',
    data
  })
}

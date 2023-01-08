import request from '@/utils/request'

export function getConsume(data) {
  return request({
    url: 'admin/money/getConsume',
    method: 'post',
    data
  })
}

export function getIncome(data) {
  return request({
    url: 'admin/money/getIncome',
    method: 'post',
    data
  })
}

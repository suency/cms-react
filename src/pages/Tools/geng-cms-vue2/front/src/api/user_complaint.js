import request from '@/utils/request'

export function get_user_complaint(data) {
  return request({
    url: 'admin/userComplaint/get_user_complaint',
    method: 'post',
    data
  })
}

export function update_user_complaint(data) {
  return request({
    url: 'admin/userComplaint/update_user_complaint',
    method: 'post',
    data
  })
}

export function add_user_complaint(data) {
  return request({
    url: 'admin/userComplaint/add_user_complaint',
    method: 'post',
    data
  })
}

export function delete_user_complaint(data) {
  return request({
    url: 'admin/userComplaint/delete_user_complaint',
    method: 'post',
    data
  })
}

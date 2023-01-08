
export function getApiT(options) {
  return `
import request from '@/utils/request'

export function get_${options.name}(data) {
    return request({
        url: '${options.app}/${options.controller}/get_${options.name}',
        method: 'post',
        data
    })
}

export function update_${options.name}(data) {
    return request({
        url: '${options.app}/${options.controller}/update_${options.name}',
        method: 'post',
        data
    })
}

export function add_${options.name}(data) {
    return request({
        url: '${options.app}/${options.controller}/add_${options.name}',
        method: 'post',
        data
    })
}

export function delete_${options.name}(data) {
    return request({
        url: '${options.app}/${options.controller}/delete_${options.name}',
        method: 'post',
        data
    })
}`
}


// 对外暴露一个函数
// 存储token
const tokenKey = "token"

module.exports = {
  setToken: (token) => {
    localStorage.setItem(tokenKey, token)
  },
  getToken: () => {
    localStorage.getItem(tokenKey)
  },
  removeToken: () => {
    localStorage.removeItem(tokenKey)
  }
}
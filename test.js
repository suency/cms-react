let a = new Promise((resolve, reject) => {
  setTimeout(() => {

  }, 100)
  return 1
})

a.then((a1) => {
  console.log("a1", a1)
  return 2
}).then((d1) => {
  console.log("d1", d1)
})
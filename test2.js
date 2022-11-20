let a = [
  {
    key: 10,
    children: [1]
  },
  {
    key: 11,
    children: [2]
  },
  {
    key: 12
  }
]

let result = a.map((e1) => {
  if (!e1.hasOwnProperty("children")) {
    return e1.key
  }
}).filter(e2 => e2 !== undefined)

console.log(result);
//console.log(a[2].hasOwnProperty("children"));
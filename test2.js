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

let str = "$[0].children[1].element";

//var str = "1,2,3,4,5,99999p-9";
str = "$[1].label";
str = str.replace(/\.([^\.]*)$/, '');
console.log(str);
//console.log(a[2].hasOwnProperty("children"));
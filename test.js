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


/* File sizes after gzip:
  not all icon
  195.13 KB  build\static\js\2.b428306f.chunk.js
  66.6 KB    build\static\css\2.32d536ee.chunk.css
  6.54 KB    build\static\js\main.1372579c.chunk.js
  1.73 KB    build\static\css\main.e7b9f18d.chunk.css
  768 B      build\static\js\runtime-main.4faa7ac6.js

The project was built assuming it is hosted at /.
You can control this with the homepage field in your package.json. */

/* File sizes after gzip:

  340.52 KB  build\static\js\2.c81b7ad5.chunk.js
  66.6 KB    build\static\css\2.55edbdd9.chunk.css
  6.63 KB    build\static\js\main.19538470.chunk.js
  1.73 KB    build\static\css\main.e7b9f18d.chunk.css
  768 B      build\static\js\runtime-main.4faa7ac6.js

The project was built assuming it is hosted at /.
You can control this with the homepage field in your package.json. */
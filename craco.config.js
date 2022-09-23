const path = require('path')
const CracoLessPlugin = require('craco-less')

const mainColor = "#744FC6"
module.exports = {

  plugins: [
    {
      plugin: CracoLessPlugin,
      options: {
        lessLoaderOptions: {
          lessOptions: {
            modifyVars: {
              "@primary-color": mainColor,
              "@link-color": mainColor
            },
            javascriptEnabled: true,
          },
        },
      },
    },
  ],
  webpack: {
    alias: {
      '@': path.resolve(__dirname, 'src')
    }
  }
}
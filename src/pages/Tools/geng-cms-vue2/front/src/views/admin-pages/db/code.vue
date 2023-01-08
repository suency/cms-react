<template>
  <div class="app-container">
    <el-tabs type="border-card">
      <el-tab-pane label="php">
        <div ref="php">
          <pre>
            <code class="php">
                {{ myPHP }}
            </code>
          </pre>
        </div>

      </el-tab-pane>

      <el-tab-pane label="vue">
        <div ref="vue">
          <pre>
              <code class="vue">
                  {{ myVUE }}
              </code>
            </pre>
        </div>
      </el-tab-pane>
      <el-tab-pane label="api">
        <div ref="api">
          <pre>
            <code class="javascript">
                {{ myJS }}
            </code>
          </pre>
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import { getApiT } from './codeTemplate/apiT'
import { getPhpT } from './codeTemplate/phpT'
import { getVueT } from './codeTemplate/vueT'
import hljs from 'highlight.js'
import 'highlight.js/styles/monokai-sublime.css'
// 下划线转换驼峰
function toHump(name) {
  return name.replace(/\_(\w)/g, function(all, letter) {
    return letter.toUpperCase()
  })
}
// 驼峰转换下划线
/* function toLine(name) {
  return name.replace(/([A-Z])/g, '_$1').toLowerCase()
} */

export default {
  data() {
    return {
      myJS: '',
      myPHP: '',
      myVUE: ''
    }
  },
  created() {
    var tname = this.$route.query.tableName
    const data = {
      app: 'admin',
      controller: toHump(tname),
      name: tname
    }
    this.myJS = getApiT(data)
    this.myPHP = getPhpT(data)
    this.myVUE = getVueT(data)
  },
  mounted() {
    this.initCode('php')
    this.initCode('vue')
    this.initCode('api')
  },
  methods: {
    initCode(e) {
      const blocks = this.$refs[e].querySelectorAll('pre code')
      blocks.forEach((block) => {
        hljs.highlightBlock(block)
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>

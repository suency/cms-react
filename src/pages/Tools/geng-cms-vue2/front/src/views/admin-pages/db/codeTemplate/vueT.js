
export function getVueT(options) {
  return `
 <template>
    <div class="app-container">
      <el-form :inline="true" class="demo-form-inline">
        <el-form-item label="关键词查询">
          <el-input v-model="query.keyword" placeholder="关键词" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="refresh">查询</el-button>
        </el-form-item>
      </el-form>
      <el-table :data="tableData" class="tip" border fit highlight-current-row style="width: 100%">
        <el-table-column v-for="(item, key) in displayProps" :key="key" :label="item.name" width="150">
          <template slot-scope="scope">
            <el-image
              v-if="item.type === 'image'"
              style="width: 50px;"
              :src="scope.row[key]"
              :preview-src-list="[scope.row[key]]"
            />
            <span v-else>{{ scope.row[key] }}</span>
          </template>
        </el-table-column>
  
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" @click="modify(scope.row.id)">修改</el-button>
            <el-button size="mini" type="danger" @click="deleteDong(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
  
      <el-pagination
        style="margin-top: 20px"
        background
        :current-page="query.currentPage"
        :page-sizes="[10, 20, 50, 100, 200]"
        :page-size="query.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
        @size-change="pageSizeChange"
        @current-change="pageChange"
      />
      <!-- 弹出框 -->
      <el-dialog title="修改内容" :visible.sync="dialogFormVisible">
        <el-form v-if="dialogFormVisible" :model="form">
          <el-form-item v-for="(item, key) in form" :key="key" :label="form[key].name">
            <el-input v-model="form[key].value" autocomplete="off" :disabled="key=='id' || key=='create_date'" />
          </el-form-item>
        </el-form>
  
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="confirm">确 定</el-button>
        </div>
      </el-dialog>
  
      <el-dialog
        title="提示"
        :visible.sync="dialogVisibleDelete"
        width="30%"
      >
        <span>确定要删除当前动态吗？id:{{ deleteId }}</span>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisibleDelete = false">取 消</el-button>
          <el-button type="primary" @click="confirmDelete">确 定</el-button>
        </span>
      </el-dialog>
    </div>
  </template>
  
  <script>
  import { get_${options.name}, update_${options.name} } from '@/api/${options.name}'
  import _ from 'underscore'
  
  export default {
    filters: {
      topicFilter(e) {
        return _.pluck(e, 'topic').toString()
      }
    },
    data() {
      return {
        displayProps: {
          id: {
            name: 'id',
            type: 'string'
          },
          phone: {
            name: '手机号',
            type: 'string'
          }
        },
        dialogFormVisible: false,
        dialogVisibleDelete: false,
        tableData: [
        ],
        form: {
        },
        formLabelWidth: 'auto',
        total: 0,
        query: {
          pageSize: 10,
          currentPage: 1,
          keyword: ''
        },
        deleteId: ''
      }
    },
    mounted: function() {
      this.refresh()
    },
    methods: {
      checkVideo(url) {
        if (url) {
          url = url + ''
        } else {
          return false
        }
        return ['mp4', 'mov', 'm4v', '3gp', 'avi', 'm3u8', 'webm'].some(item => {
          return item === url.substring(url.lastIndexOf('.') + 1)
        })
      },
      checkImg(url) {
        if (url) {
          url = url + ''
        } else {
          return false
        }
  
        return ['jpg', 'jpeg', 'png', 'svg', 'webp', 'gif', 'bmp'].some(item => {
          return item === url.substring(url.lastIndexOf('.') + 1)
        })
      },
      viewMore(index) {
  
      },
      pageSizeChange(e) {
        this.query.pageSize = e
        this.refresh()
      },
      pageChange(e) {
        this.query.currentPage = e
        this.refresh()
      },
      deleteDong(id) {
        this.dialogVisibleDelete = true
        this.deleteId = id
      },
      refresh() {
        var that = this
        get_${options.name}(that.query).then(res => {
          that.tableData = res.data.data
          that.total = res.data.total
          // console.log(res)
        })
      },
      modify(id) {
        const that = this
        this.dialogFormVisible = true
        this.form = _.find(that.tableData, item => {
          return item.id === id
        })
        const obj = {}
        for (const iterator in that.displayProps) {
          obj[iterator] = {
            value: that.form[iterator],
            name: that.displayProps[iterator].name
          }
        }
        this.form = obj
        console.log(obj)
      },
      confirmDelete() {
  
      },
      confirm() {
        const that = this
        const temp = JSON.parse(JSON.stringify(this.form))
        for (const iterator in temp) {
          temp[iterator] = temp[iterator].value
        }
        update_${options.name}(temp).then(res => {
          if (res.code === 20000) {
            this.$message(res.data.msg)
            that.dialogFormVisible = false
            that.refresh()
          }
        })
      }
    }
  }
  </script>
  
  <style scoped>
  
  </style>
  `
}


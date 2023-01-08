<template>
  <div class="app-container">
    <!-- Note that row-key is necessary to get a correct row order. -->
    <el-table ref="dragTable" v-loading="listLoading" :data="list" row-key="id" border fit highlight-current-row style="width: 100%">
      <el-table-column align="center" label="ID" width="65">
        <template slot-scope="{row}">
          <span>{{ row.id }}</span>
        </template>
      </el-table-column>

      <el-table-column width="180" align="center" label="时间">
        <template slot-scope="{row}">
          <span>{{ row.create_date | parseTime('{y}-{m}-{d} {h}:{i}') }}</span>
        </template>
      </el-table-column>

      <el-table-column width="200" label="轮播图" align="center">
        <template slot-scope="{row}">
          <el-image
            style="width: 180px;"
            :src="row.img_url"
            :preview-src-list="[row.img_url]"
          />
        </template>
      </el-table-column>

      <el-table-column width="180" label="链接地址">
        <template slot-scope="{row}">
          <span>{{ row.jump_url }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="排名权重" width="95">
        <template slot-scope="{row}">
          <span>{{ row.ranking }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="标题" width="125">
        <template slot-scope="{row}">
          <span>{{ row.title }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="是否隐藏" width="90">
        <template slot-scope="{row}">
          <span>{{ row.display?"显示":"隐藏" }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="拖动改变顺序" width="80">
        <template slot-scope="{}">
          <svg-icon class="drag-handler" icon-class="drag" />
        </template>
      </el-table-column>

      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button size="mini" type="primary" @click="editbanner(scope.$index)">编辑</el-button>
          <el-button size="mini" type="danger">删除</el-button>
        </template>
      </el-table-column>

    </el-table>

    <!-- 弹出框 -->
    <el-dialog title="编辑内容" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="标题" :label-width="formLabelWidth">
          <el-input v-model="form.title" autocomplete="off" />
        </el-form-item>
      </el-form>

      <el-form :model="form">
        <el-form-item label="链接地址" :label-width="formLabelWidth">
          <el-input v-model="form.jump_url" autocomplete="off" />
        </el-form-item>
      </el-form>

      <!-- <el-form :model="form">
        <el-form-item label="排名" :label-width="formLabelWidth">
          <el-input v-model="form.ranking" autocomplete="off" />
        </el-form-item>
      </el-form> -->

      <el-form :model="form">
        <el-form-item label="是否隐藏" :label-width="formLabelWidth">
          <el-switch
            v-model="form.display"
            :active-text="form.display?'显示':'隐藏'"
            :active-value="1"
            :inactive-value="0"
          />
        </el-form-item>
      </el-form>

      <el-form :model="form">
        <el-form-item label="图片" :label-width="formLabelWidth">
          <el-upload
            ref="my-upload"
            :action="server"
            list-type="picture-card"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove"
            :on-success="handleSuccess"
            :limit="1"
          >
            <i class="el-icon-plus" />
          </el-upload></el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="confirm">确 定</el-button>
      </div>
    </el-dialog>
    <!-- <div class="show-d">
      <el-tag>The default order :</el-tag> {{ oldList }}
    </div>
    <div class="show-d">
      <el-tag>The after dragging order :</el-tag> {{ newList }}
    </div> -->
  </div>
</template>

<script>
import { getBanner, updateOrder, updateBanner } from '@/api/activity'
import _ from 'underscore'
import Sortable from 'sortablejs'

let oldList = []
export default {
  name: 'DragTable',
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: 'success',
        draft: 'info',
        deleted: 'danger'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      server: process.env.VUE_APP_BASE_API + '/admin/upload/uploadFile',
      dialogFormVisible: false,
      formLabelWidth: 'auto',
      list: [],
      form: {},
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 10
      },
      sortable: null,
      oldList: [],
      newList: []
    }
  },
  mounted() {
    this.getList()
  },
  created() {
  },
  methods: {
    handleRemove(file, fileList) {
      console.log(file, fileList)
    },
    handleSuccess(response, file, fileList) {
      console.log(response)
      this.form.img_url = response.data.ossUrl
    },
    handlePictureCardPreview(file) {
      // this.dialogImageUrl = file.url
      // this.dialogVisible = true
    },
    confirm() {
      const that = this
      updateBanner(that.form).then(res => {
        if (res.code === 20000) {
          this.$message('更新成功')
          that.dialogFormVisible = false
          that.getList()
          that.$refs['my-upload'].clearFiles()
        }
      })
    },
    editbanner(index) {
      const that = this
      that.form = ''
      that.dialogFormVisible = true
      that.form = that.list[index]

      console.log(that.form)
    },
    async getList() {
      this.listLoading = true
      const { data } = await getBanner(this.listQuery)

      this.list = _.sortBy(data, item => -item.ranking)
      // 复制一份list
      oldList = JSON.parse(JSON.stringify(this.list))
      this.listLoading = false
      this.oldList = this.list.map(v => v.id)
      this.newList = this.oldList.slice()
      this.$nextTick(() => {
        this.setSort()
      })
    },
    setSort() {
      const el = this.$refs.dragTable.$el.querySelectorAll('.el-table__body-wrapper > table > tbody')[0]
      this.sortable = Sortable.create(el, {
        ghostClass: 'sortable-ghost', // Class name for the drop placeholder,
        setData: function(dataTransfer) {
          // to avoid Firefox bug
          // Detail see : https://github.com/RubaXa/Sortable/issues/1012
          dataTransfer.setData('Text', '')
        },
        onEnd: evt => {
          const targetRow = this.list.splice(evt.oldIndex, 1)[0]

          updateOrder({ old: oldList[evt.oldIndex], new: oldList[evt.newIndex] }).then(res => {
            // console.log(oldList[evt.oldIndex])
            // console.log(oldList[evt.newIndex])
            this.getList()
            this.list.splice(evt.newIndex, 0, targetRow)

            const tempIndex = this.newList.splice(evt.oldIndex, 1)[0]
            this.newList.splice(evt.newIndex, 0, tempIndex)
          })
        }
      })
    }
  }
}
</script>

<style>
.sortable-ghost{
  opacity: .8;
  color: #fff!important;
  background: #42b983!important;
}
</style>

<style scoped>
.icon-star{
  margin-right:2px;
}
.drag-handler{
  width: 20px;
  height: 20px;
  cursor: pointer;
}
.show-d{
  margin-top: 15px;
}

.el-form-item {
  display: flex;
  align-items: center;
}
</style>

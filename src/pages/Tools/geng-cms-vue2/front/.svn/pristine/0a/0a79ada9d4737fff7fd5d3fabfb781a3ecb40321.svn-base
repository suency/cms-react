<template>
  <div>
    <el-table :data="tableData" style="width: 100%" class="tip">
      <el-table-column label="左边名字" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.left_name }}</span>
        </template>
      </el-table-column>

      <el-table-column label="中间名字" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.middle_name }}</span>
        </template>
      </el-table-column>

      <el-table-column label="右边名字" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.right_name }}</span>
        </template>
      </el-table-column>

      <el-table-column label="左边颜色" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.left_color }}</span>
        </template>
      </el-table-column>

      <el-table-column label="右边颜色" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.right_color }}</span>
        </template>
      </el-table-column>

      <el-table-column label="背景图片" width="180">
        <template slot-scope="scope">
          <img width="120" :src="scope.row.url" alt>
        </template>
      </el-table-column>

      <el-table-column label="操作">
        <template>
          <el-button size="mini" @click="dialogFormVisible = true">修改</el-button>
        </template>

        <template>
          <el-button size="mini" type="danger" @click="deleteVote">清除投票数据</el-button>
        </template>

        <template>
          <el-button size="mini" type="primary" @click="stopVote">暂停/开启投票</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="修改内容" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="左边名字" :label-width="formLabelWidth">
          <el-input v-model="form.left_name" autocomplete="off" />
        </el-form-item>
      </el-form>

      <el-form :model="form">
        <el-form-item label="中间名字" :label-width="formLabelWidth">
          <el-input v-model="form.middle_name" autocomplete="off" />
        </el-form-item>
      </el-form>

      <el-form :model="form">
        <el-form-item label="右边名字" :label-width="formLabelWidth">
          <el-input v-model="form.right_name" autocomplete="off" />
        </el-form-item>
      </el-form>

      <el-form :model="form">
        <el-form-item label="左边颜色" :label-width="formLabelWidth">
          <el-color-picker v-model="form.left_color" />
        </el-form-item>
      </el-form>

      <el-form :model="form">
        <el-form-item label="右边颜色" :label-width="formLabelWidth">
          <el-color-picker v-model="form.right_color" />
        </el-form-item>
      </el-form>

      <el-form :model="form">
        <el-form-item label="背景图片" :label-width="formLabelWidth">
          <el-upload
            :action="server"
            list-type="picture-card"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove"
            :on-success="handleSuccess"
            :limit="1"
          >
            <i class="el-icon-plus" />
          </el-upload>
          <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="dialogImageUrl" alt>
          </el-dialog>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="confirm">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="修改投票状态" :visible.sync="dialogFormVisibleStop">
      <el-form :model="form">
        <el-form-item :label="form.stop=='0'?'开启投票':'暂停投票'" :label-width="formLabelWidth">
          <el-switch
            v-model="form.stop"
            active-color="#13ce66"
            inactive-color="#ff4949"
            active-value="0"
            inactive-value="1"
            @change="changeVote"
          />
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogFormVisibleStop = false">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog
      title="提示"
      :visible.sync="dialogVisibleDelete"
      width="30%"
    >
      <span>确定要删除所有投票数据？</span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisibleDelete = false">取 消</el-button>
        <el-button type="primary" @click="confirmDelete">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { getTip, updateTip, deleteVote, changeVoteStatus } from '@/api/tip'

export default {
  data() {
    return {
      dialogFormVisible: false,
      dialogFormVisibleStop: false,
      dialogVisibleDelete: false,
      dialogImageUrl: '',
      dialogVisible: false,
      limit: 1,
      server: process.env.VUE_APP_BASE_API + '/admin/tip/uploadPhoto',
      tableData: [
        {
          left_name: '2016-05-02',
          middle_name: '王小虎',
          right_name: '上海市普陀区金沙江路 1518 弄',
          left_color: 'red',
          right_color: 'yellow',
          url: ''
        }
      ],
      form: {
        left_name: '2016-05-02',
        middle_name: '王小虎',
        right_name: '上海市普陀区金沙江路 1518 弄',
        left_color: 'red',
        right_color: 'yellow',
        url: '',
        stop: false
      },
      value: true,
      formLabelWidth: 'auto'
    }
  },
  mounted: function() {
    var that = this
    getTip().then(res => {
      console.log(res)
      that.tableData[0].left_name = res.data.left_name
      that.tableData[0].middle_name = res.data.middle_name
      that.tableData[0].right_name = res.data.right_name
      that.tableData[0].left_color = res.data.left_color
      that.tableData[0].right_color = res.data.right_color
      that.tableData[0].url = res.data.url
      that.form = res.data
    })
  },
  methods: {
    changeVote() {
      var that = this
      console.log(that.form.stop)
      changeVoteStatus(that.form.stop).then(res => {
        console.log(res)
      })
    },
    stopVote() {
      var that = this
      that.dialogFormVisibleStop = true
    },
    deleteVote() {
      var that = this
      that.dialogVisibleDelete = true
    },
    confirmDelete() {
      var that = this
      deleteVote().then(res => {
        console.log(res)
        that.dialogVisibleDelete = false
      })
    },
    handleRemove(file, fileList) {
      console.log(file, fileList)
    },
    handleSuccess(response, file, fileList) {
      console.log(response)
      this.form.url = response.data.url
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    confirm() {
      var that = this
      updateTip(that.form).then(res => {
        console.log(res)
        if (res.status === 'ok') {
          that.dialogFormVisible = false
          that.tableData[0].left_name = res.data.left_name
          that.tableData[0].middle_name = res.data.middle_name
          that.tableData[0].right_name = res.data.right_name
          that.tableData[0].left_color = res.data.left_color
          that.tableData[0].right_color = res.data.right_color
          that.tableData[0].url = res.data.url
        }
      })
    },
    handleEdit(index, row) {
      console.log(index, row)
    },
    handleDelete(index, row) {
      console.log(index, row)
    }
  }
}
</script>

<style scoped>
.tip {
  padding: 30px;
}
</style>

<template>
  <div class="app-container">
    <el-table :data="tableData" class="tip" border fit highlight-current-row style="width: 100%">
      <el-table-column label="id" width="50">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>

      <el-table-column label="标题" width="250">
        <template slot-scope="scope">
          <span>{{ scope.row.discussionTitle }}</span>
        </template>
      </el-table-column>

      <el-table-column label="创建时间" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.createDate }}</span>
        </template>
      </el-table-column>

      <el-table-column label="类型" width="120">
        <template slot-scope="scope">
          <span>{{ scope.row.type == 0? "经验分享" : "复杂病例" }}</span>
        </template>
      </el-table-column>

      <el-table-column label="话题分类" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.topicInfos | topicFilter }}</span>
        </template>
      </el-table-column>

      <el-table-column label="发布者头像" width="100">
        <template slot-scope="scope">
          <img width="30" :src="scope.row.authorVo.headUrl" alt>
        </template>
      </el-table-column>

      <el-table-column label="是否匿名发布" width="130">
        <template slot-scope="scope">
          <span>{{ scope.row.authorVo.anonymous?'匿名发布':'实名发布' }}</span>
        </template>
      </el-table-column>

      <el-table-column label="名字" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.authorVo.name }}</span>
        </template>
      </el-table-column>
      <el-table-column label="uid" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.authorVo.uid }}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作">
        <template slot-scope="scope">
          <router-link :to="'/group/groupdetail/'+scope.row.id">
            <el-button
              size="mini"
              type="primary"
            >
              查看详情
            </el-button>
          </router-link>
          <el-button size="mini" type="danger" @click="deleteDong(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- <el-pagination
      background
      layout="prev, pager, next"
      :total="totalPage"
      :page-size="pageSize"
      :current-page="page"
      @current-change="pageChange"
    /> -->

    <el-pagination
      style="margin-top: 20px"
      background
      :current-page="page"
      :page-sizes="[10, 20, 50, 100, 200]"
      :page-size="10"
      layout="total, sizes, prev, pager, next, jumper"
      :total="totalPage"
      @size-change="pageSizeChange"
      @current-change="pageChange"
    />
    <!-- 弹出框 -->
    <el-dialog title="修改内容" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="电话" :label-width="formLabelWidth">
          <el-input v-model="form.phone" autocomplete="off" />
        </el-form-item>
      </el-form>

      <el-form :model="form">
        <el-form-item label="真实姓名" :label-width="formLabelWidth">
          <el-input v-model="form.realname" autocomplete="off" />
        </el-form-item>
      </el-form>

      <el-form :model="form">
        <el-form-item label="昵称" :label-width="formLabelWidth">
          <el-input v-model="form.nickname" autocomplete="off" />
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
import { getCaseList, updateCase, deleteCase } from '@/api/caseList'
import _ from 'underscore'

export default {
  filters: {
    topicFilter(e) {
      return _.pluck(e, 'topic').toString()
    }
  },
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
      ],
      form: {
      },
      value: true,
      formLabelWidth: 'auto',
      page: 1,
      pageSize: 10,
      totalPage: 0,
      deleteId: ''
    }
  },
  mounted: function() {
    this.refresh()
  },
  methods: {
    viewMore(index) {

    },
    pageSizeChange(e) {
      this.pageSize = e
      this.refresh()
    },
    pageChange(e) {
      // console.log(e)
      this.page = e
      this.refresh()
    },
    deleteDong(id) {
      this.dialogVisibleDelete = true
      this.deleteId = id
      // console.log(id)
    },
    refresh() {
      var that = this
      getCaseList({ page: that.page, pageSize: that.pageSize }).then(res => {
        // console.log(res)
        that.tableData = res.data.data
        that.totalPage = res.data.count
      })
    },
    modify(index) {
      this.dialogFormVisible = true
      this.form = this.tableData[index]
    },
    confirmDelete() {
      var that = this
      deleteCase({ id: that.deleteId }).then(res => {
        // console.log(res)
        if (res.code === 20000) {
          that.dialogVisibleDelete = false
          that.page = 1
          that.refresh()
        }
      })
    },
    confirm() {
      const that = this
      updateCase(this.form).then(res => {
        // console.log(res)
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

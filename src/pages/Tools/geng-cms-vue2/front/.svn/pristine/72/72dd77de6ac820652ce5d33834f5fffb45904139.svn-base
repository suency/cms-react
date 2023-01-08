<template>
  <div class="app-container">
    <el-table :data="tableData" border>
      <el-table-column label="id" width="50">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>

      <el-table-column label="收入前余额" width="150">
        <template slot-scope="scope">
          <span>{{ scope.row.old_amount }}</span>
        </template>
      </el-table-column>

      <el-table-column label="收入后余额" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.new_amount }}</span>
        </template>
      </el-table-column>

      <el-table-column label="收入金额" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.add_amount }}</span>
        </template>
      </el-table-column>

      <el-table-column label="日期" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.create_date }}</span>
        </template>
      </el-table-column>

      <el-table-column label="uid" width="50">
        <template slot-scope="scope">
          <span>{{ scope.row.uid }}</span>
        </template>
      </el-table-column>

      <el-table-column label="头像" width="100">
        <template slot-scope="scope">
          <img width="30" :src="scope.row.user.head_url" alt="">
        </template>
      </el-table-column>

      <el-table-column label="收入用户昵称" width="120">
        <template slot-scope="scope">
          <span>{{ scope.row.user.nickname }}</span>
        </template>
      </el-table-column>

      <el-table-column label="收入用户姓名" width="120">
        <template slot-scope="scope">
          <span>{{ scope.row.user.realname }}</span>
        </template>
      </el-table-column>
      <el-table-column label="电话">
        <template slot-scope="scope">
          <span>{{ scope.row.user.phone }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button size="mini" type="primary" @click="modify(scope.$index)">修改</el-button>
        </template>
      </el-table-column> -->
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
  </div>
</template>

<script>
import { getIncome } from '@/api/money'

export default {
  data() {
    return {
      tableData: [],
      total: 0,
      query: {
        pageSize: 10,
        currentPage: 1
      }
    }
  },
  mounted: function() {
    this.refresh()
  },
  methods: {
    refresh() {
      const that = this
      getIncome(that.query).then(res => {
        that.tableData = res.data.data
        that.total = res.data.total
        // console.log(res)
      })
    },
    pageSizeChange(e) {
      this.query.pageSize = e
      this.refresh()
    },
    pageChange(e) {
      this.query.currentPage = e
      this.refresh()
    }
  }
}
</script>

<style scoped>

</style>

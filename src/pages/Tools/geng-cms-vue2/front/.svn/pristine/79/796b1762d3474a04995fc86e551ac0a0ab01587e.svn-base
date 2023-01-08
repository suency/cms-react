<template>
  <div class="app-container">
    <el-table :data="tableData" border>
      <el-table-column label="index" width="80" align="center">
        <template slot-scope="scope">
          <span>{{ scope.$index + 1 }}</span>
        </template>
      </el-table-column>

      <el-table-column label="表名" width="220" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.TABLE_NAME }}</span>
        </template>
      </el-table-column>

      <el-table-column label="引擎" width="120" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.Engine }}</span>
        </template>
      </el-table-column>

      <el-table-column label="表数据条数" width="100" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.Table_rows }}</span>
        </template>
      </el-table-column>

      <el-table-column label="编码" width="130" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.Table_collation }}</span>
        </template>
      </el-table-column>

      <el-table-column label="注释" width="100" align="center">
        <template slot-scope="scope">
          <img width="30" :src="scope.row.TABLE_COMMENT" alt>
        </template>
      </el-table-column>

      <el-table-column label="创建时间" width="180" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.CREATE_TIME }}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button size="mini" type="success" @click="getCode(scope.row.TABLE_NAME)">生成代码</el-button>
          <!-- <el-button size="mini" type="primary" @click="modify(scope.$index)">查看</el-button> -->
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { getAllTables } from '@/api/dblist'
export default {
  data() {
    return {
      tableData: []
    }
  },
  mounted() {
    var that = this
    getAllTables().then(res => {
      that.tableData = res.data
    })
  },
  methods: {
    getCode(e) {
      this.$router.push(
        {
          path: '/sys-mgt/code', query: { tableName: e }
        })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>

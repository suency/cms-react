<template>
  <div style="padding: 30px;">

    <el-select v-model="selectId" placeholder="请选择表单" @change="selectForm">
      <el-option
        v-for="(item, index) in tableData"
        :key="index"
        :label="item.name"
        :value="item.id"
      />
    </el-select>

    <el-card class="box-card">

      <div slot="header" class="clearfix">
        <span>{{ jsonTitle }}</span>
      </div>
      <div class="a">
        <fm-generate-form
          ref="generateViewForm"
          :data="jsonViewData"
          :value="editViewData"
          :edit="false"
          @on-change="onChange"
        />
      </div>
    </el-card>

  </div>
</template>

<script>
import { getForms } from '@/api/customForms'
import _ from 'underscore'
export default {
  data() {
    return {
      jsonViewData: { 'list': [], 'config': { 'labelWidth': 100, 'labelPosition': 'right', 'size': 'small' }},
      jsonTitle: '',
      tableData: [],
      editViewData: { username: '' },
      selectId: ''
    }
  },

  mounted() {
    var that = this
    that.initData()
  },
  methods: {
    onChange(field, value) {
      console.log(field)
      console.log(value)
    },
    initData() {
      var that = this
      getForms().then(res => {
        console.log(res)
        that.tableData = res.data

        that.jsonViewData = JSON.parse(res.data[0].json)
        that.jsonTitle = res.data[0].name
      })
    },
    selectForm() {
      var that = this
      /* console.log(this.selectId)
      console.log(_.find(that.tableData, (item) => {
        return item.id == that.selectId
      }).json)*/
      var filterItem = _.find(that.tableData, (item) => {
        return item.id === that.selectId
      })

      that.jsonViewData = JSON.parse(filterItem.json)
      that.jsonTitle = filterItem.name
    }
  }
}
</script>

<style scoped>
  .box-card{
    margin-top: 20px;
  }
</style>

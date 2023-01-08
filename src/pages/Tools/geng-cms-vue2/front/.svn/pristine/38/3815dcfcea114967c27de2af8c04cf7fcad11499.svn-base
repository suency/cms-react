<template>
  <div style="padding: 30px;">
    <!-- <fm-making-form style="height: calc(100vh - 84px);" preview generate-code generate-json /> -->
    <div style="height: 50px;">
      <el-button type="primary" @click="newForm">新建表单</el-button>
    </div>

    <el-dialog
      title="表单预览"
      :visible.sync="quickViewForm"
      width="60%"
      center
    >
      <div class="a">
        <fm-generate-form
          ref="generateViewForm"
          :data="jsonViewData"
          :value="editViewData"
          :edit="false"
          @on-change="onChange"
        />
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="quickViewForm = false">确 定</el-button>
        <el-button type="primary" @click="viewData">查看数据</el-button>
      </span>
    </el-dialog>

    <div v-if="displayEditList" class="">
      <el-table
        :data="tableData"
        border
        style="width: 100%"
      >
        <el-table-column
          prop="id"
          label="编号"
          width="180"
        />
        <el-table-column
          prop="name"
          label="名字"
          width="180"
        />

        <el-table-column
          prop="create_time"
          label="创建时间"
          width="180"
        />
        <el-table-column
          label="操作"
        >
          <template slot-scope="scope">
            <el-button type="text" @click="handleView(scope.$index, scope.row)">查看</el-button>
            <el-button type="text" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
            <el-button type="text" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <template>
      <fm-making-form
        v-if="displayForm"
        ref="makingform"
        style="height: calc(100vh - 194px);"
        preview
        :generate-code="false"
        :generate-json="true"
        :upload="false"
      >
        <template slot="action">
          <div class="codeWrap">
            <el-tag style="font-size: 13px;margin-right: 10px;" effect="dark" type="primary">{{ isEdit?"正在编辑":"正在新建" }}</el-tag>
            <el-input v-model="form.name" class="code" placeholder="请输入表单名字" size="mini" />
            <el-button class="" type="primary" size="mini" @click="saveServer">提交</el-button>
            <el-button v-if="displayForm" class="" type="danger" size="mini" @click="back">取消</el-button>
          </div>
        </template>
      </fm-making-form>
    </template>

  </div>
</template>

<script>
import { getForms, createForm, editForm, deteleForm } from '@/api/customForms'
import { isNotEmpty } from '@/utils/validate'
export default {
  data() {
    return {
      jsonViewData: { 'list': [], 'config': { 'labelWidth': 100, 'labelPosition': 'right', 'size': 'small' }},
      editViewData: { myname: '' },
      form: {
        name: '',
        id: '',
        json: ''
      },
      quickViewForm: false,
      displayForm: false,
      displayEditList: true,
      tableData: [],
      isEdit: false
    }
  },
  mounted() {
    this.initData()
  },
  methods: {
    onChange(field, value) {
      console.log(field)
      console.log(value)
    },
    viewData() {
      console.log(JSON.stringify(this.editViewData))
    },
    initData() {
      var that = this
      getForms().then(res => {
        console.log(res)
        that.tableData = res.data
      })
    },
    resetForm1() {
      var that = this
      that.$nextTick(() => {
        that.form.id = ''
        that.form.name = ''
        that.form.json = ''
        that.$refs.makingform.setJSON({ 'list': [], 'config': { 'labelWidth': 100, 'labelPosition': 'right', 'size': 'small' }})
      })
    },
    resetForm2() {
      var that = this
      that.form.id = ''
      that.form.name = ''
      that.form.json = ''
      that.$refs.makingform.setJSON({ 'list': [], 'config': { 'labelWidth': 100, 'labelPosition': 'right', 'size': 'small' }})
    },
    back() {
      var that = this
      that.displayForm = false
      that.displayEditList = true
    },
    handleDelete(index, row) {
      var that = this
      this.$confirm('此操作将永久删除' + row.name + ', 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deteleForm({ id: row.id }).then(res => {
          // console.log(res)
          if (res.status === 'ok') {
            that.$alert(res.data.msg, '提示', {
              confirmButtonText: '确定'
            })

            that.back()
            that.initData()
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    handleView(index, row) {
      var that = this
      that.quickViewForm = true

      that.jsonViewData = JSON.parse(row.json)
    },
    handleEdit(index, row) {
      var that = this
      that.displayForm = true
      that.displayEditList = false
      that.isEdit = true

      that.$nextTick((res) => {
        that.form.name = row.name
        that.form.id = row.id
        that.form.json = row.json
        that.$refs.makingform.setJSON(JSON.parse(row.json))
      })
    },
    saveLocal() {
      var json = this.$refs.makingform.getJSON()
      this.form.json = json
    },
    saveServer() {
      var that = this
      that.saveLocal()
      var form = { name: that.form.name }
      var result = isNotEmpty(form, ['表单名'], this)

      if (result) {
        that.form.json = JSON.stringify(that.form.json)
        // 新增
        if (!that.isEdit) {
          createForm(that.form).then(res => {
            if (res.status === 'ok') {
              that.back()
              that.initData()
            }
            that.$alert(res.data.msg, '提示', {
              confirmButtonText: '确定'
            })
          })
        } else {
          editForm(that.form).then(res => {
            if (res.status === 'ok') {
              that.back()
              that.initData()
            }
            that.$alert(res.data.msg, '提示', {
              confirmButtonText: '确定'
            })
          })
        }
      }
    },
    newForm() {
      var that = this
      that.displayForm = true
      that.displayEditList = false
      that.isEdit = false
      that.resetForm1()
    }
  }
}
</script>

<style scoped>

  .codeWrap{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 15px;
    height: 100%;
  }

  .code{
    margin-right:15px;
    width: 120px;
  }

</style>

<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="newMenu">
        新增菜单
      </el-button>
    </div>
    <el-table
      :data="menuData"
      row-key="id"
      border
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column label="菜单名称">
        <template slot-scope="scope">{{ scope.row.meta.title }}</template>
      </el-table-column>
      <el-table-column prop="path" label="请求路径" />
      <el-table-column prop="component" label="组件地址" />
      <el-table-column prop="rank" label="菜单排序" />
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button class="filter-item" size="mini" style="margin-left: 10px;" type="primary" @click="edit(scope.$index, scope.row)">
            编辑
          </el-button>
          <el-button class="filter-item" size="mini" style="margin-left: 10px;" type="danger" @click="handleDelete(scope.$index, scope.row)">
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog :title="isEdit?'编辑菜单':'新增菜单'" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules">
        <el-form-item label="请选择显示位置" :label-width="formLabelWidth">
          <el-select v-model="form.pid" placeholder="请选择显示位置" @change="changeLocation">
            <el-option style="font-weight:bold;" label="顶级菜单" :value="0" />
            <el-option v-for="(item,index) in setMenuList" :key="index" :label="item.title" :value="item.id" />
          </el-select>
        </el-form-item>

        <el-form-item label="菜单名称" :label-width="formLabelWidth">
          <el-input v-model="form.title" autocomplete="off" placeholder="如：财务管理" />
        </el-form-item>
        <el-form-item label="菜单地址" :label-width="formLabelWidth">
          <el-input v-model="form.path" autocomplete="off" placeholder="如：system" />
        </el-form-item>
        <el-form-item label="组件地址" :label-width="formLabelWidth">
          <el-input v-model="form.component" autocomplete="off" placeholder="如：charts/line" />
        </el-form-item>
        <el-form-item label="菜单排序" :label-width="formLabelWidth">
          <el-input v-model="form.rank" autocomplete="off" placeholder="如：100" />
        </el-form-item>
        <el-form-item label="图标" :label-width="formLabelWidth">
          <el-popover
            placement="bottom-start"
            width="485"
            trigger="click"
            @show="$refs['iconSelect'].reset()"
          >
            <IconSelect ref="iconSelect" @selected="selected" />
            <el-input slot="reference" v-model="form.icon" style="width: 485px;" placeholder="点击选择图标" readonly>
              <svg-icon v-if="form.icon" slot="prefix" :icon-class="form.icon" class="el-input__icon" style="height: 32px;width: 16px;" />
              <i v-else slot="prefix" class="el-icon-search el-input__icon" />
            </el-input>
          </el-popover>
        </el-form-item>
        <el-form-item v-if="form.pid=='0'" label="一直显示根菜单" :label-width="formLabelWidth">
          <el-radio v-model="form.alwaysShow" label="1">是</el-radio>
          <el-radio v-model="form.alwaysShow" label="0">否</el-radio>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="confirm">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { getRoutes, addRoutes, editRoutes, deleteRoutes } from '@/api/asyncRoutes'
import IconSelect from '@/components/IconSelect'
import svgIcons from './svg-icons'
import elementIcons from './element-icons'
import _ from 'underscore'
export default {
  components: { IconSelect },
  data() {
    return {
      isEdit: false,
      svgIcons,
      elementIcons,
      showIcons: false,
      menuData: [],
      setMenuList: [],
      dialogFormVisible: false,
      form: {
        title: '',
        path: '',
        component: '',
        alwaysShow: '1',
        pid: 0,
        icon: '',
        rank: ''
      },
      rules: {
        title: [
          { required: true, message: '请输入名称', trigger: 'blur' }
        ],
        path: [
          { required: true, message: '请输入路径', trigger: 'blur' }
        ],
        component: [
          { required: true, message: '请输入组件地址', trigger: 'blur' }
        ]
      },
      formLabelWidth: '130px'
    }
  },
  computed: {

  },
  mounted() {
    this.refreshMenu()
  },
  methods: {
    newMenu() {
      var that = this
      that.dialogFormVisible = true
      that.resetForm()
    },
    resetForm() {
      this.form = {
        title: '',
        path: '',
        component: '',
        alwaysShow: '1',
        pid: 0,
        icon: '',
        rank: ''
      }
    },
    changeLocation() {
      const that = this
      if (that.form.pid === 0) {
        that.form.alwaysShow = '1'
      } else {
        that.form.alwaysShow = '0'
      }
    },
    confirm() {
      const that = this
      that.$refs['form'].validate((valid) => {
        // console.log(valid)
        if (valid) {
          if (!that.isEdit) {
            that.changeLocation()
            addRoutes(that.form).then(response => {
              if (response.status === 'ok') {
                that.dialogFormVisible = false
                that.resetForm()
                that.refreshMenu()
              }
              that.$alert(response.data.msg, '提示', {
                confirmButtonText: '确定'
              })
            })
          } else {
            that.changeLocation()
            editRoutes(that.form).then(response => {
              if (response.status === 'ok') {
                that.dialogFormVisible = false
                that.resetForm()
                that.refreshMenu()
              }
              that.$alert(response.data.msg, '提示', {
                confirmButtonText: '确定'
              })
            })
          }
        } else {
          return false
        }
      })
    },
    selected(name) {
      this.form.icon = name
    },
    generateIconCode(symbol) {
      return `<svg-icon icon-class="${symbol}" />`
    },
    // 只有管理员有权限看到所有菜单
    refreshMenu() {
      const that = this
      getRoutes(['admin']).then(response => {
        // console.log(response)
        if (response.status === 'ok') {
          // 子菜单排序
          response.data.forEach((item) => {
            if (item.children && item.children.length > 0) {
              item.children = _.filter(_.sortBy(item.children, 'rank').reverse())
            }
          })

          // 主菜单排序
          that.menuData = _.filter(_.sortBy(response.data, 'rank').reverse(),
            function(item) {
              return item.hidden !== true
            })
          that.setMenuList = _.map(that.menuData, function(item) {
            return { id: item.id, pid: item.pid, title: item.meta.title }
          })
        } else {
          that.$message.error(response.data.info.msg)
        }
      })
    },
    handleDelete(index, row) {
      // console.log(row)
      var that = this
      this.$confirm('此操作将永久删除' + row.name + '和它的子菜单, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteRoutes({ id: row.id }).then(res => {
          // console.log(res)
          if (res.status === 'ok') {
            that.$alert(res.data.msg, '提示', {
              confirmButtonText: '确定'
            })

            that.refreshMenu()
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    edit(index, row) {
      // alert(id)
      var that = this
      that.dialogFormVisible = true
      that.isEdit = true
      that.resetForm()
      // console.log(row)
      that.form.pid = row.pid
      that.form.id = row.id
      that.form.title = row.name

      that.form.path = row.path
      that.form.component = row.component
      that.form.alwaysShow = row.alwaysShow ? '1' : '0'
      that.form.icon = row.meta.icon
      that.form.rank = row.rank
    },
    changeValue(e) {
      console.log(this.form)
    }
  }
}
</script>

<style scoped>
.iconPanel{
  width: 100%;
  position: absolute;
  z-index: 2;
  top:40px;
  border-radius: 5px;
  border: 1px solid #DCDFE6;
  background: #ffffff;
  box-sizing: border-box;
  padding: 15px;
  display: flex;
  flex-wrap: wrap;
  overflow: auto;
  height: 200px;
}

.iconItem{
  width: 33.333%;
}
</style>

<template>
  <div class="wrap">
    <el-button class="filter-item" type="primary" @click="newUser">
      新增后台用户
    </el-button>
    <el-table :data="tableData" style="width: 100%; margin-top: 20px;" border>
      <el-table-column align="center" label="用户名" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.username }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="姓名" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.name }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="介绍" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.introduction }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="角色" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.roles }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="头像" width="180">
        <template slot-scope="scope">
          <img :src="scope.row.avatar" width="50" alt="">
        </template>
      </el-table-column>
      <el-table-column align="center" label="操作">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button v-if="scope.row.username !=='admin'" size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog :title="isEdit?'编辑':'新增后台用户'" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form">
        <el-form-item label="登录名" :label-width="formLabelWidth" prop="username">
          <el-input v-model="form.username" autocomplete="off" />
        </el-form-item>
        <el-form-item label="密码" :label-width="formLabelWidth" prop="password">
          <el-input v-model="form.password" autocomplete="off" />
        </el-form-item>
        <el-form-item label="姓名" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off" placeholder="如：张三" />
        </el-form-item>
        <el-form-item label="介绍" :label-width="formLabelWidth" prop="introduction">
          <el-input v-model="form.introduction" autocomplete="off" placeholder="如：运营管理" />
        </el-form-item>
        <el-form-item label="角色" :label-width="formLabelWidth" prop="role">
          <el-select v-model="form.role" placeholder="请选择角色">
            <el-option v-for="(item,index) in roles" :key="index" :label="item.key" :value="item.id" />
          </el-select>
        </el-form-item>
        <el-form-item label="头像" :label-width="formLabelWidth" prop="avatar">
          <el-upload
            class="avatar-uploader"
            :action="server"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload"
            :headers="headers"
          >
            <img v-if="form.avatar" :src="form.avatar" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon" />
          </el-upload>
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
import { systemUsers, createUser, editUser, deleteUser } from '@/api/user'
import { getRoles } from '@/api/role'

import { isNotEmpty } from '@/utils/validate'
import { mapGetters } from 'vuex'
export default {
  data() {
    return {
      isEdit: false,
      server: process.env.VUE_APP_BASE_API + '/admin/user/uploadPhoto',
      headers: { 'X-Token': '' },
      dialogFormVisible: false,
      formLabelWidth: '120px',
      tableData: [],
      form: {
        username: '',
        password: '',
        name: '',
        introduction: '',
        role: 1,
        avatar: ''
      },
      roles: []
    }
  },
  computed: {
    ...mapGetters([
      'token'
    ])
  },
  mounted: function(argument) {
    var that = this
    that.form.username = ''
    this.headers['X-Token'] = this.token
    // console.log(this.form)
    that.getUsers()

    getRoles().then(res => {
      // console.log(res)
      that.roles = res.data
    })
  },
  methods: {
    resetForm() {
      this.form = {
        username: '',
        password: '',
        name: '',
        introduction: '',
        role: 2,
        avatar: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif'
      }
    },
    getUsers() {
      var that = this
      systemUsers().then(res => {
      // console.log(res)
        that.tableData = res.data
      })
    },
    newUser() {
      var that = this
      that.isEdit = false
      this.dialogFormVisible = true
      this.$nextTick(() => {
        that.resetForm()
      })
    },
    handleAvatarSuccess(res, file) {
      // this.form.avatar = URL.createObjectURL(file.raw)
      console.log(res)
      this.form.avatar = res.data.url
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg'
      const isLt2M = file.size / 1024 / 1024 < 2

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!')
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!')
      }
      return isJPG && isLt2M
    },
    confirm() {
      var that = this
      var result = isNotEmpty(that.form, ['登录名', '密码', '姓名', '介绍', '角色', '头像'], this)

      if (result) {
        // 新增
        if (!that.isEdit) {
          createUser(that.form).then(res => {
            if (res.status === 'ok') {
              that.dialogFormVisible = false
              that.resetForm()
              that.getUsers()
            }
            that.$alert(res.data.msg, '提示', {
              confirmButtonText: '确定'
            })
          })
        } else {
          editUser(that.form).then(res => {
            if (res.status === 'ok') {
              that.dialogFormVisible = false
              that.resetForm()
              that.getUsers()
            }
            that.$alert(res.data.msg, '提示', {
              confirmButtonText: '确定'
            })
          })
        }
      }
    },
    handleEdit(index, row) {
      var that = this
      that.dialogFormVisible = true
      that.isEdit = true

      that.form.username = row.username
      that.form.password = ''
      that.form.introduction = row.introduction
      that.form.name = row.name
      that.form.roles = row.roles
      that.form.avatar = row.avatar
      that.form.id = row.id
      // console.log(index, row)
    },
    handleDelete(index, row) {
      // console.log(index, row)
      var that = this
      this.$confirm('此操作将永久删除' + row.username + ', 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteUser({ id: row.id }).then(res => {
          // console.log(res)
          if (res.status === 'ok') {
            that.$alert(res.data.msg, '提示', {
              confirmButtonText: '确定'
            })

            that.getUsers()
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    }
  }
}
</script>

<style scoped>
.wrap {
  padding: 30px;
}

.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>

<template>
  <div class="app-container case">
    <el-form label-position="left" label-width="80px" :model="caseDetail">
      <el-form-item label="讨论标题">
        <span>{{ caseDetail.discussionTitle }}</span>
      </el-form-item>
      <el-divider />
      <el-form-item v-if="caseDetail.briefly" label="简要病史">
        <span>{{ caseDetail.briefly }}</span>
      </el-form-item>

      <el-form-item v-if="caseDetail.brieflyImg" label="图片视频">
        <div v-if="!checkVideo(caseDetail.brieflyImg)">
          <el-image
            v-for="(item, index) in caseDetail.brieflyImg.split(';')"
            :key="index"
            style="width: 100px; height: 100px; margin-right: 10px"
            :src="item"
            fit="cover"
            :preview-src-list="caseDetail.brieflyImg.split(';')"
          />
        </div>

        <div v-if="checkVideo(caseDetail.brieflyImg)">
          <video
            :src="caseDetail.brieflyImg"
            style="width: 300px"
            controls="controls"
          >
            您的浏览器不支持视频播放
          </video>
        </div>
      </el-form-item>
      <el-divider v-if="caseDetail.briefly || caseDetail.brieflyImg" />
      <!-- 简要病史 -->

      <el-form-item v-if="caseDetail.physiqueInspect" label="体格检查">
        <span>{{ caseDetail.physiqueInspect }}</span>
      </el-form-item>

      <el-form-item v-if="caseDetail.physiqueInspectImg" label="图片视频">
        <div v-if="!checkVideo(caseDetail.physiqueInspectImg)">
          <el-image
            v-for="(item, index) in caseDetail.physiqueInspectImg.split(';')"
            :key="index"
            style="width: 100px; height: 100px; margin-right: 10px"
            :src="item"
            fit="cover"
            :preview-src-list="caseDetail.physiqueInspectImg.split(';')"
          />
        </div>

        <div v-if="checkVideo(caseDetail.physiqueInspectImg)">
          <video
            :src="caseDetail.physiqueInspectImg"
            style="width: 300px"
            controls="controls"
          >
            您的浏览器不支持视频播放
          </video>
        </div>
      </el-form-item>
      <el-divider v-if="caseDetail.physiqueInspect || caseDetail.physiqueInspectImg" />
      <!-- 体格检查 -->

      <el-form-item v-if="caseDetail.inspectData" label="辅助检查">
        <span>{{ caseDetail.inspectData }}</span>
      </el-form-item>

      <el-form-item v-if="caseDetail.inspectDataImg" label="图片视频">
        <div v-if="!checkVideo(caseDetail.inspectDataImg)">
          <el-image
            v-for="(item, index) in caseDetail.inspectDataImg.split(';')"
            :key="index"
            style="width: 100px; height: 100px; margin-right: 10px"
            :src="item"
            fit="cover"
            :preview-src-list="caseDetail.inspectDataImg.split(';')"
          />
        </div>

        <div v-if="checkVideo(caseDetail.inspectDataImg)">
          <video
            :src="caseDetail.inspectDataImg"
            style="width: 300px"
            controls="controls"
          >
            您的浏览器不支持视频播放
          </video>
        </div>
      </el-form-item>
      <el-divider v-if="caseDetail.inspectData || caseDetail.inspectDataImg" />
      <!-- 辅助检查 -->

      <el-form-item v-if="caseDetail.treatmentProcess" label="治疗经过">
        <span>{{ caseDetail.treatmentProcess }}</span>
      </el-form-item>

      <el-form-item v-if="caseDetail.treatmentProcessImg" label="图片视频">
        <div v-if="!checkVideo(caseDetail.treatmentProcessImg)">
          <el-image
            v-for="(item, index) in caseDetail.treatmentProcessImg.split(';')"
            :key="index"
            style="width: 100px; height: 100px; margin-right: 10px"
            :src="item"
            fit="cover"
            :preview-src-list="caseDetail.treatmentProcessImg.split(';')"
          />
        </div>

        <div v-if="checkVideo(caseDetail.treatmentProcessImg)">
          <video
            :src="caseDetail.treatmentProcessImg"
            style="width: 300px"
            controls="controls"
          >
            您的浏览器不支持视频播放
          </video>
        </div>
      </el-form-item>
      <el-divider v-if="caseDetail.treatmentProcess || caseDetail.treatmentProcessImg" />
      <!-- 治疗经过 -->

      <el-form-item v-if="caseDetail.diagnosticResults" label="诊断结果">
        <span>{{ caseDetail.diagnosticResults }}</span>
      </el-form-item>

      <el-form-item v-if="caseDetail.diagnosticResultsImg" label="图片视频">
        <div v-if="!checkVideo(caseDetail.diagnosticResultsImg)">
          <el-image
            v-for="(item, index) in caseDetail.diagnosticResultsImg.split(';')"
            :key="index"
            style="width: 100px; height: 100px; margin-right: 10px"
            :src="item"
            fit="cover"
            :preview-src-list="caseDetail.diagnosticResultsImg.split(';')"
          />
        </div>

        <div v-if="checkVideo(caseDetail.diagnosticResultsImg)">
          <video
            :src="caseDetail.diagnosticResultsImg"
            style="width: 300px"
            controls="controls"
          >
            您的浏览器不支持视频播放
          </video>
        </div>
      </el-form-item>
      <el-divider v-if="caseDetail.diagnosticResults || caseDetail.diagnosticResultsImg" />
      <!-- 诊断结果 -->

      <el-form-item v-if="caseDetail.other" label="其他">
        <span>{{ caseDetail.other }}</span>
      </el-form-item>

      <el-form-item v-if="caseDetail.otherImg" label="图片视频">
        <div v-if="!checkVideo(caseDetail.otherImg)">
          <el-image
            v-for="(item, index) in caseDetail.otherImg.split(';')"
            :key="index"
            style="width: 100px; height: 100px; margin-right: 10px"
            :src="item"
            fit="cover"
            :preview-src-list="caseDetail.otherImg.split(';')"
          />
        </div>

        <div v-if="checkVideo(caseDetail.otherImg)">
          <video
            :src="caseDetail.otherImg"
            style="width: 300px"
            controls="controls"
          >
            您的浏览器不支持视频播放
          </video>
        </div>
      </el-form-item>
      <el-divider v-if="caseDetail.other || caseDetail.otherImg" />
      <!-- 诊断结果 -->

      <el-form-item v-if="caseDetail.discussionContent" label="讨论内容">
        <span>{{ caseDetail.discussionContent }}</span>
      </el-form-item>

      <el-form-item v-if="caseDetail.discussionContentImg" label="图片视频">
        <div v-if="!checkVideo(caseDetail.discussionContentImg)">
          <el-image
            v-for="(item, index) in caseDetail.discussionContentImg.split(';')"
            :key="index"
            style="width: 100px; height: 100px; margin-right: 10px"
            :src="item"
            fit="cover"
            :preview-src-list="caseDetail.discussionContentImg.split(';')"
          />
        </div>

        <div v-if="checkVideo(caseDetail.discussionContentImg)">
          <video
            :src="caseDetail.discussionContentImg"
            style="width: 300px"
            controls="controls"
          >
            您的浏览器不支持视频播放
          </video>
        </div>
      </el-form-item>
      <el-divider v-if="caseDetail.discussionContent || caseDetail.discussionContentImg" />
      <!-- 讨论内容 -->
    </el-form>
  </div>
</template>

<script>
import { getCaseDetail } from '@/api/caseList'
export default {
  filters: {
    isVideoLink(url) {
      console.log(url)
      return ['mp4', 'mov', 'm4v', '3gp', 'avi', 'm3u8', 'webm'].some(item => {
        return item === url.substring(url.lastIndexOf('.') + 1)
      })
    }
  },
  data() {
    return {
      caseDetail: {

      }
    }
  },
  created: function() {
    const id = this.$route.params && this.$route.params.id
    this.refresh(id)
  },
  mounted: function() {
  },
  methods: {
    checkVideo(url) {
      if (url.split(';').length === 1) {
        return ['mp4', 'mov', 'm4v', '3gp', 'avi', 'm3u8', 'webm'].some(item => {
          return item === url.substring(url.lastIndexOf('.') + 1)
        })
      }
      return false
    },
    refresh(id) {
      const that = this
      getCaseDetail({ id }).then(res => {
        that.caseDetail = res.data.data
      })
    }
  }
}
</script>

<style scoped>

</style>

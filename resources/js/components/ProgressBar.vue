<template>
  <div class="progress mg-b-10">
    <div
      class="progress-bar progress-bar-striped"
      role="progressbar"
      :style="{ width: getProgress }"
    >
      {{ getProgress }}
    </div>
  </div>
</template>
<script>
export default {
  props: {
    progressValue: {
      type: Number,
      default: 0,
    },
  },

  computed: {
    getProgress() {
      return Math.round(this.progressValue) + "%";
    },
  },
};
</script>
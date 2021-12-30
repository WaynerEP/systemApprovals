<template>
  <div class="row row-sm">
    <div class="col-lg-8">
      <info-profile></info-profile>
      <edit-info></edit-info>
    </div>

    <show-info></show-info>
    <!-- col-8 -->
  </div>
</template>

<script>
import InfoProfile from "../Profile/InfoProfile.vue";
import EditInfo from "../Profile/EditInfo.vue";
import ShowInfo from "../Profile/ShowInfo.vue";
export default {
  components: {
    InfoProfile,
    EditInfo,
    ShowInfo,
  },
};
</script>
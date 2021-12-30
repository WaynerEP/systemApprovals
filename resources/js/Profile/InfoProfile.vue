<template>
  <card-profile>
    <template #body>
      <img src="http://via.placeholder.com/500x500" alt="" />
      <div class="media-body">
        <h3 class="card-profile-name">Katherine Lumaad</h3>
        <p class="card-profile-position">
          Executive Director at <a href="">ThemePixels, Inc.</a>
        </p>
        <p>San Francisco, California</p>

        <p class="mg-b-0">
          A consummate human capital management professional with international
          training and talent management implementations experience across the
          entire universe...<a href="">Read more</a>
        </p>
      <file-pond></file-pond>

      </div>
      <!-- media-body -->
    </template>
    <template #footer>
      <a href="" class="card-profile-direct"
        >http://thmpxls.me/profile?id=katherine</a
      >
      <div>
        <a href="">Profile Settings</a>
      </div>
    </template>
  </card-profile>
</template>
<script>
import CardProfile from "../components/CardProfile.vue";
import FilePond from "../components/FilePond.vue";

export default {
  components: {
    CardProfile,
    FilePond,
  },
};
</script>
<template>
  <div class="row row-sm">
    <div class="col-lg-8">
      <info-profile :user="user_info"></info-profile>
      <edit-info :user="user_info"></edit-info>
    </div>

    <div class="col-lg-4 mg-t-20 mg-lg-t-0">
      <show-info :user="user_info"></show-info>
      <update-password :user="user_info"></update-password>
    </div>
    <!-- col-8 -->
  </div>
</template>

<script>
import InfoProfile from "../Profile/InfoProfile.vue";
import EditInfo from "../Profile/EditInfo.vue";
import ShowInfo from "../Profile/ShowInfo.vue";
import UpdatePassword from "../Profile/Password.vue";
export default {
  props: ["user_id"],

  mounted() {
    this.fetchData();
  },

  data() {
    return {
      user_info: {},
    };
  },

  methods: {
    fetchData() {
      axios
        .get("/api/user-profile/" + this.user_id)
        .then((res) => {
          this.user_info = res.data[0];
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },

  components: {
    InfoProfile,
    EditInfo,
    ShowInfo,
    UpdatePassword,
  },
};
</script>
<template>
  <div></div>
</template>
<script>
export default {
  name: "Notification",

  mounted() {
    if (this.type == "success") {
      this.$awn.success(this.message);
    } else {
      this.$awn.info(this.message);
    }
  },

  props: ["message", "type"],
};
</script>
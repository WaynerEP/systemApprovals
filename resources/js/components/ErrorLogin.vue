<template>
  <div></div>
</template>
<script>
export default {
  name: "Error",

  mounted() {
    this.showMessaggeErrorAuth();
  },

  methods: {
    showMessaggeErrorAuth() {
      this.$awn.warning("No existe el usuario.");
    },
  },
};
</script>
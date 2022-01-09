<template>
  <div class="form-group">
    <div class="input-group">
      <div class="input-group-prepend">
        <div class="input-group-text">
          <i class="icon ion-calendar tx-16 lh-0 op-6"></i>
        </div>
      </div>
      <input
        type="text"
        class="form-control fc-datepicker"
        :class="size"
        placeholder="DD/MM/YYYY"
      />
    </div>
  </div>
</template>
<script>
export default {
  props: {
    size: {
      type: String,
      default: "",
    },
  },
};
</script>    
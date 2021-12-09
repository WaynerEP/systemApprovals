<template>
  <div class="billed-from">
    <h6>{{ info.razonSocial }}</h6>
    <p>
      {{ info.direccion }} <br />
      {{ info.numTelefonico }}<br />
      Email: {{ info.correo }}
    </p>
  </div>
</template>

<script>
export default {
  mounted() {
    this.getData();
  },

  data() {
    return {
      info: {},
    };
  },

  methods: {
    async getData() {
      const res = await axios.get("/api /info-el-valle");
      this.info = res.data;
    },
  },
};
</script>
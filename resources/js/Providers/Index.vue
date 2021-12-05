<template>
  <div class="row">
    <div
      class="col-md-4 mt-4 mg-md-t-0"
      v-for="pros in providers"
      :key="pros.keyPro"
    >
      <div class="card bg-primary tx-white bd-0">
        <div
          class="card-header"
          style="
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ15wheMNG9n-yZ2CSzTD0Gu0KR0oAsmi3iQ&usqp=CAU');
            height: 160px;
          "
        >
          <!-- <h5 class="card-title tx-black tx-medium border">
            {{ "Title" }}
          </h5> -->
        </div>
        <div class="card-body">
          <p class="card-subtitle tx-normal tx-white-8 mg-b-15">
            Representante: {{ pros.names }}
          </p>
          <p class="card-text">Razón Social: {{ pros.businessName }}</p>
          <a href="#" class="card-link tx-white-7 hover-white">Editar</a>
          <a href="#" class="card-link tx-white-7 hover-white">Eliminar</a>
        </div>
      </div>
      <!-- card -->
    </div>
    <!-- col -->
  </div>
  <!-- row -->
</template>

<script>
export default {
  name: "Providers",

  components: {},

  mounted() {
    this.getProviders();
  },

  data() {
    return {
      providers: [],
      provider: {
        name: "",
        email: "",
        dni: "",
        role: "",
        status: "1",
      },
      errors: [],
      selected_id: "",
      isLoading: false,
      isNoEmpty: true,
      isActionNew: true,
    };
  },

  methods: {
    async getProviders() {
      const res = await axios.get("/dataProviders");
      this.providers = res.data;
      // console.log(this.providers);
      if (res) {
        this.isNoEmpty = false;
      }
    },
  },
};
</script>

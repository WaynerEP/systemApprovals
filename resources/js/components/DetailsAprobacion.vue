<template>
  <div class="row row-sm">
    <div class="col-lg-4">
      <div class="card card-sales">
        <h6 class="slim-card-title tx-primary">JEFE DE COMPRAS</h6>
        <div class="row">
          <div class="col">
            <label class="tx-12">25-35-2001</label>
            <p>APROBADO</p>
          </div>
          <!-- col -->
        </div>
        <!-- row -->

        <div class="progress mg-b-5">
          <div
            class="progress-bar bg-primary wd-100p"
          >
          </div>
        </div>
        <p class="tx-12 mg-b-0">Todo Ok.</p>
      </div>
      <!-- card -->
    </div>
    <!-- col-4 -->
  </div>
</template>
<script>
import Loader from "../components/LoaderAction.vue";
import moment from "moment";

export default {
  components: {
    Loader,
  },

  data() {
    return {
      details: [],
      isLoading: true,
    };
  },

  methods: {
    formatDateAsString(value) {
      moment.locale("es");
      return moment(value).format("LLLL");
    },

    fetchData(val) {
      //   axios
      //     .get("/api/pedidos/detalle/" + val)
      //     .then((res) => {
      //       this.details = res.data;
      //     })
      //     .catch((error) => {
      //       this.$awn.error("La petición ha fallado");
      //       this.isLoading = false;
      //     });
      $("#exampleModal").modal("show");
    },
  },
};
</script>
<template>
  <div class="row row-sm">
    <template v-if="details.length > 0">
      <div class="col-lg-4" v-for="d in details" :key="d.idAprobacion">
        <div class="card card-sales">
          <h6 class="slim-card-title tx-primary ht-35">{{ d.cargo }}</h6>
          <div class="row">
            <div class="col">
              <label class="tx-12">{{ d.fechaRespuesta }}</label>
              <p v-if="d.estado == 'A'">APROBADO</p>
              <p v-else-if="d.estado == 'R'">RECHAZADO</p>
              <p v-else>PENDIENTE</p>
            </div>
            <!-- col -->
          </div>
          <!-- row -->
          <div class="progress mg-b-5">
            <div
              class="progress-bar wd-100p"
              :class="{
                'bg-success': d.estado == 'A',
                'bg-danger': d.estado == 'R',
                'bg-secondary': d.estado == '0',
              }"
            ></div>
          </div>
          <p class="tx-12 mg-b-0">Comentario: {{ d.motivoDesicion }}</p>
        </div>
        <!-- card -->
      </div>
    </template>
    <div class="col-12 text-center" v-else>
      <template v-if="isNoEmpty">
        <Loader class="tx-info" />
      </template>
      <p v-else>No hay resultados!.</p>
    </div>
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
      isNoEmpty: true,
    };
  },

  methods: {
    formatDateAsString(value) {
      moment.locale("es");
      return moment(value).format("LLLL");
    },

    fetchData(val) {
      axios
        .get("/api/aprobaciones/detail/" + val)
        .then((res) => {
          this.details = res.data;
          if (res.data) {
            this.isNoEmpty = false;
          }
        })
        .catch((error) => {
          this.$awn.error("La petición ha fallado");
        });
      $("#exampleModal").modal("show");
    },
  },
};
</script>
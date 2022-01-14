<template>
  <div class="manager-wrapper">
    <div class="manager-right">
      <template v-if="Object.keys(detailsProformas).length > 0">
        <div v-for="(dp, index) in detailsProformas" :key="index" class="mb-4">
          <label class="section-label tx-primary">
            {{ formatDateAsString(index) }}</label
          >
          <div class="signup-separator"></div>
          <div class="file-group">
            <div class="file-item" v-for="d in dp" :key="d.idProforma">
              <div class="row no-gutters wd-100p">
                <div class="col-9 col-sm-5 d-flex align-items-center">
                  <i class="fa fa-file-pdf-o"></i>
                  <a
                    :href="'/showProforma/' + d.idPedido + '/' + d.archivo"
                    class="tx-12"
                    target="_blank"
                    >{{ d.archivo }}</a
                  >
                </div>
                <!-- col-6 -->
                <div class="col-3 col-sm-2 tx-right tx-sm-left">
                  {{ d.sizeFile }}
                </div>
                <div class="col-6 col-sm-4 mg-t-5 mg-sm-t-0">
                  {{ formatDateAsString2(d.fRegistro) }}
                </div>
                <div class="col-6 col-sm-1 tx-right mg-t-5 mg-sm-t-0">
                  P. {{ d.idPedido }}
                </div>
              </div>
            </div>
            <!-- row -->
          </div>
        </div>
        <div class="load-more-wrapper mg-t-25">
          <button
            type="button"
            class="btn bg-white tx-primary"
            @click="top = top + 3"
          >
            <Loader v-show="isMoreLoading" class="tx-info" />
            Cargar (3+) más
          </button>
        </div>
      </template>
      <div v-else class="text-center">
        <Loader v-if="isNoEmpty" class="tx-info" />
        <p v-else>Sin resultados!! :)</p>
      </div>
      <!-- file-group -->
    </div>
    <!-- manager-right -->
    <div class="manager-left">
      <a :href="'/compras-proformas'" class="btn btn-contact-new"
        >Registrar proformas</a
      >
      <img
        src="/assets/img/ilustrators/bg-2.png"
        alt="bg"
        class="img-fluid mt-5"
      />
    </div>
    <!-- manager-left -->
  </div>
</template>
<script>
import Loader from "../components/LoaderAction.vue";
import ModalSection from "../components/ModalSection.vue";
import moment from "moment";
import DetailPedido from "../components/DetailsSolicitud.vue";

export default {
  name: "ListaPedidos",
  components: {
    ModalSection,
    DetailPedido,
    Loader,
  },
  data() {
    return {
      detailsProformas: [],
      isLoading: false,
      isNoEmpty: true,
      top: 3,
      isMoreLoading: false,
    };
  },

  filters: {
    money: function (val) {
      return "S/." + Number.parseFloat(val).toFixed(2);
    },
  },

  methods: {
    showDetailsPedido(val) {
      this.$refs.detalle.details = [];
      this.$refs.detalle.fetchData(val);
    },

    formatDateAsString(value) {
      moment.locale("es");
      return moment(value).format("LL");
    },

    formatDateAsString2(value) {
      moment.locale("es");
      return moment(value, "YYYY-MM-DD h:m:s").fromNow();
    },

    async loadAsyncData(top = 3) {
      const res = await axios.get("/proformas?top=" + top);
      this.detailsProformas = res.data;
      if (res.data) {
        this.isNoEmpty = false;
      }
      this.isMoreLoading = false;
    },
  },

  watch: {
    top: function (val) {
      this.isMoreLoading = true;
      this.loadAsyncData(val);
    },
  },

  mounted() {
    this.loadAsyncData();
  },
};
</script>
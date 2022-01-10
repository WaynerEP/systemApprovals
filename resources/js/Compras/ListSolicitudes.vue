<template>
  <div class="section-wrapper">
    <div
      class="
        d-flex
        flex-md-row flex-column
        justify-content-md-between
        align-content-center
        mb-3
      "
    >
      <div class="d-flex align-items-center">
        <label for="paginate" class="section-label-sm mr-2 mb-0">Mostrar</label>
        <select
          v-model="paginate"
          class="form-control form-control-sm rounded-5"
        >
          <option value="8">8</option>
          <option value="12">12</option>
          <option value="20">20</option>
          <option value="30">30</option>
          <option value="50">50</option>
        </select>
        <button class="btn rounded-5 ml-2 btn-sm" @click="reloadData()">
          <i class="icon ion-loop tx-gray-600 tx-16"></i>
        </button>
      </div>
      <div class="d-flex flex-md-row flex-column">
        <div class="d-flex align-items-center ml-md-5 mg-t-10 mg-md-t-0">
          <label for="paginate" class="section-label mr-2 mb-0">Filtrar</label>
          <input
            type="date"
            v-model="date1"
            class="form-control form-control-sm rounded-5"
          />
        </div>
        <div class="d-flex align-items-center ml-md-4 mg-t-10 mg-md-t-0">
          <label for="paginate" class="section-label mr-2 mb-0">Hasta</label>
          <input
            type="date"
            v-model="date2"
            class="form-control form-control-sm rounded-5"
          />
        </div>
      </div>
      <div class="ml-md-2">
        <div class="input-group mg-t-10 mg-md-t-0">
          <input
            type="search"
            v-model.lazy="search"
            placeholder="Search for..."
            class="form-control form-control-sm rounded-5"
          />
          <span class="input-group-btn">
            <button
              type="button"
              class="btn bd bd-l-0 bg-white tx-gray-600 rounded-right"
            >
              <loader-action v-if="isSearch" class="tx-info"></loader-action>
              <i v-else class="fa fa-search tx-primary"></i>
            </button>
          </span>
        </div>
      </div>
    </div>

    <div class="table-responsive tx-13 tx-semibold rounded-5">
      <table class="table table-hover table-bordered mb-3">
        <thead class="thead-colored bg-secondary">
          <tr>
            <th class="text-center">#</th>
            <th>SOLICITANTE</th>
            <th>FECHA DE REGISTRO</th>
            <th>ESTADO</th>
            <th>APROBACIONES/RECHAZOS</th>
            <th>DETALLE</th>
          </tr>
        </thead>
        <tbody>
          <template v-if="solicitudes.total > 0">
            <tr v-for="s in solicitudes.data" :key="s.idSolicitud">
              <td class="text-center">{{ s.idSolicitud }}</td>
              <td>Jefe de áreas de compras</td>
              <td>{{ formatDateAsString(s.fechaSolicitud) }}</td>
              <td>
                <span class="badge bg-info tx-white" v-if="s.estado == 1"
                  >Procesada</span
                >
                <span class="badge bg-warning tx-white" v-else>En proceso</span>
              </td>
              <td>
                <ol>
                  <li
                    class="tx-12"
                    v-for="sa in s.aprobaciones"
                    :key="sa.idAprobacion"
                  >
                    <span
                      class="badge bg-warning tx-white"
                      v-if="sa.estado == 0"
                      >PENDIENTE</span
                    >
                    <span
                      class="badge bg-success tx-white mr-2"
                      v-else-if="sa.estado == 'A'"
                      >APROBADA POR</span
                    >
                    <span class="badge bg-danger tx-white mr-2" v-else>
                      RECHAZADA POR
                    </span>
                    {{ sa.empleado.ciudadano.nombres }} -
                    {{ sa.empleado.cargo.cargo }}
                  </li>
                </ol>
              </td>
              <td class="valign-middle">
                <button
                  type="button"
                  @click="showDetailsSolicitud(s.idSolicitud)"
                  class="btn btn-outline-secondary btn-sm"
                >
                  <i class="icon ion-clipboard"></i> Ver detalle
                </button>
              </td>
            </tr>
          </template>
          <template v-else>
            <tr class="text-center">
              <td colspan="6" v-if="isNoEmpty">
                <loader-action class="tx-info"></loader-action>
              </td>
              <td
                v-else
                class="text-center valign-middle tx-bold tx-12"
                colspan="6"
              >
                Sin resultados!! 😅
              </td>
            </tr>
          </template>
        </tbody>
      </table>
      <div
        class="
          pagination-wrapper
          flex-md-row flex-column
          justify-content-between
          align-items-center
        "
      >
        <span class="section-label-sm mg-t-20 mg-md-t-0"
          >Mostrando {{ solicitudes.current_page }} a {{ solicitudes.to }} de
          {{ solicitudes.total }} entradas</span
        >
        <div class="d-flex justify-content-between">
          <pagination
            :data="solicitudes"
            @pagination-change-page="loadAsyncData"
          ></pagination>
        </div>
      </div>
    </div>
    <!-- table-responsive -->

    <!-- start modal detalles -->
    <modal-section maxWidth="lg" class="wd-100v">
      <template #title>
        Detalle para la Solicitud N°.{{ selected_id }}
      </template>
      <template #body>
        <label class="section-label-sm tx-gray-500"
          >----------------------------------------------Detalle de la
          Solicitudes de
          Compra----------------------------------------------</label
        >
        <div class="signup-separator"></div>
        <details-solicitud ref="detalle"></details-solicitud>
      </template>
      <template #footer>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">
          Cerrar
        </button>
      </template>
    </modal-section>
  </div>
</template>
<script>
import LoaderAction from "../components/LoaderAction.vue";
import ModalSection from "../components/ModalSection.vue";
import moment from "moment";
import DetailPedido from "../components/DetailsSolicitud.vue";
import DetailsSolicitud from "../components/DetailsAprobacion.vue";

export default {
  name: "ListaPedidos",
  components: {
    ModalSection,
    DetailPedido,
    LoaderAction,
    DetailsSolicitud,
  },
  data() {
    return {
      solicitudes: {},
      paginate: "8",
      search: "",
      date1: "",
      date2: "",
      isLoading: false,
      isSearch: false,
      isNoEmpty: true,
      loadingSearch: false,
      selected_id: "",
    };
  },

  filters: {
    money: function (val) {
      return "S/." + Number.parseFloat(val).toFixed(2);
    },
  },

  methods: {
    showDetailsSolicitud(val) {
      this.selected_id = val;
      this.$refs.detalle.details = [];
      this.$refs.detalle.fetchData(val);
    },

    reloadData() {
      this.paginate = "8";
      this.search = "";
      this.date1 = "";
      this.date2 = "";
      this.loadAsyncData();
    },

    formatDateAsString(value) {
      moment.locale("es");
      return moment(value).format("L");
    },

    async loadAsyncData(page = 1) {
      if (this.search) {
        this.isSearch = true;
      }
      const res = await axios.get(
        "/api/solicitud?page=" +
          page +
          "&paginate=" +
          this.paginate +
          "&search=" +
          this.search +
          "&inicio=" +
          this.date1 +
          "&fin=" +
          this.date2 +
          "&search=" +
          this.search
      );
      this.solicitudes = res.data;
      if (res.data) {
        this.isNoEmpty = false;
      }
      this.isSearch = false;
    },
  },

  mounted() {
    this.loadAsyncData();
  },

  watch: {
    paginate: function (val) {
      this.loadAsyncData();
    },

    search: function (value) {
      this.loadAsyncData();
    },

    date1: function (val) {
      if (this.date2) {
        this.loadAsyncData();
      }
    },

    date2: function (val) {
      if (this.date1) {
        this.loadAsyncData();
      }
    },
  },
};
</script>
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
        <thead class="thead-colored bg-info">
          <tr>
            <th class="text-center">#</th>
            <th>MONTO</th>
            <th>FECHA DE REGISTRO</th>
            <th>NRO. ITEMS</th>
            <th>ESTADO</th>
            <th>DETALLES</th>
          </tr>
        </thead>
        <tbody>
          <template v-if="pedidos.total > 0">
            <tr v-for="pedido in pedidos.data" :key="pedido.idPedido">
              <td class="text-center">0000{{ pedido.idPedido }}</td>
              <td>{{ pedido.monto | money }}</td>
              <td>{{ formatDateAsString(pedido.fechaPedido) }}</td>
              <td>{{ pedido.pedido_count }} items</td>
              <td>
                <span
                  class="badge bg-success tx-white"
                  v-if="pedido.estado == 2"
                  >Procesada en solicitud</span
                >
                <span
                  class="badge bg-info tx-white"
                  v-else-if="pedido.estado == 1"
                  >Procesada con proformas</span
                >
                <span
                  class="badge bg-danger tx-white"
                  v-else-if="pedido.estado == 3"
                  >Pedido anulado</span
                >
                <span class="badge bg-warning tx-white" v-else
                  >No procesada</span
                >
              </td>
              <td class="valign-middle">
                <button
                  type="button"
                  v-if="pedido.estado == 0"
                  @click="anularPedido(pedido.idPedido)"
                  class="btn btn-outline-danger btn-sm"
                >
                  <i class="icon ion-compose"></i> Anular
                </button>
                <button
                  type="button"
                  @click="showDetailsPedido(pedido.idPedido)"
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
          >Mostrando {{ pedidos.current_page }} a {{ pedidos.to }} de
          {{ pedidos.total }} entradas</span
        >
        <div class="d-flex justify-content-between">
          <pagination
            :data="pedidos"
            @pagination-change-page="loadAsyncData"
          ></pagination>
        </div>
      </div>
    </div>
    <!-- table-responsive -->

    <!-- start modal detalles -->
    <modal-section maxWidth="lg" id="exampleModal2">
      <template #title> Detalle </template>
      <template #body>
        <label class="section-label-sm tx-gray-500"
          >----------------------------------------------Detalle de su
          Solicitudes de
          Compra----------------------------------------------</label
        >
        <detail-pedido ref="detalle"></detail-pedido>
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

export default {
  name: "ListaPedidos",
  components: {
    ModalSection,
    DetailPedido,
    LoaderAction,
  },
  data() {
    return {
      pedidos: {},
      paginate: "8",
      search: "",
      date1: "",
      date2: "",
      isLoading: false,
      isSearch: false,
      isNoEmpty: true,
      loadingSearch: false,
    };
  },

  filters: {
    money: function (val) {
      return "S/." + Number.parseFloat(val).toFixed(2);
    },
  },

  methods: {
    anularPedido(idPedido) {
      let onOk = () => {
        axios
          .delete("/pedidos/" + idPedido)
          .then((res) => {
            this.$awn.info(res.data);
            this.loadAsyncData();
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      };

      this.$awn.confirm("Estás seguro de anular el pedido?", onOk);
    },

    showDetailsPedido(val) {
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
      return moment(value).format("LLLL");
    },

    async loadAsyncData(page = 1) {
      if (this.search) {
        this.isSearch = true;
      }
      const res = await axios.get(
        "/pedidos?page=" +
          page +
          "&paginate=" +
          this.paginate +
          "&inicio=" +
          this.date1 +
          "&fin=" +
          this.date2 +
          "&search=" +
          this.search
      );
      this.pedidos = res.data;
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
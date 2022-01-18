<template>
  <div class="section-wrapper">
    <label class="section-title">Nueva solicitud de Compra</label>
    <p class="mg-b-20">
      Estimado {{ user_name }},
      <span v-if="orders.length == 0"
        >por el momento no tiene ninguna solicitud de compra.</span
      >
      <span v-else>
        se ha generado las siguientes solicitudes de compra que requiere de su
        revisión:</span
      >
    </p>

    <div class="table-responsive">
      <table class="table table-bordered">
        <thead class="thead-colored bg-danger">
          <tr>
            <td></td>
            <th class="wd-15p">Fecha</th>
            <th class="wd-30p">Solicita</th>
            <th class="wd-30p">Apellidos y Nombres</th>
            <th class="wd-20p">Estado</th>
            <th class="wd-10p">Detalles</th>
          </tr>
        </thead>
        <tbody>
          <template v-if="orders.length > 0">
            <tr v-for="item in orders" :key="item.idSolicitud">
              <td class="valign-middle">
                <input
                  type="checkbox"
                  :value="item.codEmpleado + '|' + item.idSolicitud"
                  @change="onChangeAprobar($event)"
                />
              </td>
              <th scope="row" class="valign-middle">{{ item.fecha }}</th>
              <td class="valign-middle">{{ item.cargo }}</td>
              <td class="valign-middle">{{ item.empleado }}</td>
              <td class="valign-middle">
                <span v-if="item.estado == 0"> Por revisar </span>
                <span v-else-if="item.estado == 'A'"> Aceptado </span>
                <span v-else> Rechazado </span>
              </td>
              <td class="valign-middle">
                <button
                  @click="showDetails(item.idPedido)"
                  class="btn btn-outline-danger btn-sm"
                >
                  Ver detalles
                </button>
              </td>
            </tr>
          </template>
          <template v-else>
            <tr class="text-center">
              <td colspan="6" v-if="isNoEmpty">
                <loader-action></loader-action>
              </td>
              <td
                class="text-center valign-middle tx-bold tx-12"
                colspan="6"
                v-else
              >
                Por el momento no tiene nuevas solicitudes de compra!! 😅
              </td>
            </tr>
          </template>
        </tbody>
      </table>
    </div>
    <div class="d-flex justify-content-center">
      <button
        @click="showModalConfirmation('A')"
        type="button"
        class="btn btn-outline-info btn-sm mg-t-30"
      >
        Aprobar Solicitud
      </button>
      <button
        @click="showModalConfirmation('R')"
        type="button"
        class="btn btn-outline-secondary btn-sm mg-t-30 ml-3"
      >
        Rechazar Solicitud
      </button>
    </div>
    <!-- table-responsive -->
    <!-- modal-formulario de evio   -->
    <modal-section maxWidth="lg" @submitted="store">
      <template #title> Motivo de Desición </template>
      <template #body>
        <div class="form-group">
          <label class="form-control-label mb-2" for="inputAutocomplete"
            >Debe responder este formulario, unicamente si ha revisado la
            solicitud de compra y esté seguro de su respuesta.</label
          >
          <textarea
            rows="3"
            class="form-control"
            placeholder="Ingrese su motivo de desición"
            v-model="order.mensaje"
          ></textarea>
          <div class="invalid-feedback d-block" v-if="errors && errors.mensaje">
            {{ errors.mensaje[0] }}
          </div>
        </div>
      </template>
      <template #footer>
        <button
          type="button"
          @click="resetFields"
          class="btn btn-secondary"
          data-dismiss="modal"
        >
          Cancelar
        </button>
        <button type="submit" class="btn btn-danger">
          Enviar
          <loader-action v-show="isLoading"></loader-action>
        </button>
      </template>
    </modal-section>
    <!-- end formulario de envio -->
    <!-- start modal detalles -->
    <modal-section maxWidth="lg" id="exampleModal2">
      <template #title> Detalle </template>
      <template #body>
        <label class="section-label-sm tx-gray-500"
          >----------------------------------------------Detalle de su
          Solicitudes de
          Compra----------------------------------------------</label
        >
        <details-solicitud ref="detalle"></details-solicitud>
        <details-proforma ref="proforma"></details-proforma>
      </template>
      <template #footer>
        <button
          type="button"
          class="btn btn-secondary"
          @click="resetFields"
          data-dismiss="modal"
        >
          Cerrar
        </button>
      </template>
    </modal-section>
    <!-- <button @click="allRequestsByUser">ver</button> -->
  </div>
</template>
<script>
import ModalSection from "../components/ModalSection.vue";
import Loading from "../components/Loader.vue";
import LoaderAction from "../components/LoaderAction.vue";
import DetailsSolicitud from "../components/DetailsSolicitud.vue";
import DetailsProforma from "../components/DetailsProforma.vue";

export default {
  name: "Orders",

  props: ["user_id", "user_name"],

  components: {
    ModalSection,
    Loading,
    LoaderAction,
    DetailsSolicitud,
    DetailsProforma,
  },

  mounted() {
    this.fetchData(0);
  },

  data() {
    return {
      orders: [],
      detailsOrder: [],
      order: {
        employee: "",
        solicitud: "",
        mensaje: "",
        estado: "",
        option: "not",
      },
      idpedido: "",
      isLoading: false,
      isNoEmpty: true,
      errors: [],
    };
  },

  methods: {
    async fetchData(val) {
      const datos = await axios.get(
        "/api/orders/list/" + this.user_id + "/" + val
      );
      this.orders = datos.data;
      if (datos.data) {
        this.isNoEmpty = false;
      }
    },

    allRequestsByUser() {
      this.isNoEmpty = true;
      this.fetchData("all");
    },

    onChangeAprobar(e) {
      if (e.target.checked == true) {
        const val = e.target.value;
        let dato = val.split("|");
        this.order.employee = dato[0];
        this.order.solicitud = dato[1];
      } else {
        this.order.employee = "";
        this.order.solicitud = "";
      }
    },

    showModalConfirmation(val) {
      if (!this.order.employee || !this.order.solicitud) {
        $.toast({
          content: "Seleccione una fila por favor!!",
        });
        return;
      }
      this.order.estado = val;
      $("#exampleModal").modal("show");
    },

    showDetails(val) {
      this.$refs.detalle.details = [];
      this.$refs.detalle.fetchData(val);
      this.$refs.proforma.idPedido = val;
      this.$refs.proforma.detalleProformas = [];
      this.$refs.proforma.fetchData(val);
    },
    store() {
      if (this.order.mensaje) {
        this.isLoading = true;
        axios
          .post("/response-request", this.order)
          .then((res) => {
            $("#exampleModal").modal("hide");
            this.fetchData(0);
            this.$awn.success(res.data);
            this.isLoading = false;
          })
          .catch((e) => {
            if (e.response.status === 422) {
              this.errors = e.response.data.errors;
            } else {
              this.$awn.alert("La acción ha fallado!.");
            }
            this.isLoading = false;
          });
      } else {
        $.toast({
          content: "Ingrese el motivo de su desición!!",
        });
      }
    },

    resetFields() {
      this.order.employee = "";
      this.order.solicitud = "";
      this.order.mensaje = "";
      this.order.estado = "";
    },
  },
};
</script>
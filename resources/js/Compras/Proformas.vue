<template>
  <div class="section-wrapper">
    <div class="d-lg-flex justify-content-between">
      <div class="">
        <label class="section-title">Registros de Proformas</label>
        <p class="mg-b-20 mg-sm-b-40">
          En ésta sección adjunte proformas por cada proveedor para un pedido
        </p>
      </div>
      <input-date> </input-date>
    </div>

    <div class="form-layout">
      <div class="row mg-b-25">
        <div class="col-lg-4">
          <div class="form-layout form-layout-2">
            <div class="no-gutters">
              <div class="form-group">
                <label class="form-control-label"
                  >Pedido: <span class="tx-danger">*</span></label
                >
                <div class="input-group">
                  <input
                    type="text"
                    readonly
                    v-model="idPedido"
                    class="form-control bg-white"
                    placeholder="Seleccione..."
                  />
                  <span class="input-group-btn">
                    <button
                      type="button"
                      :disabled="details.length > 0"
                      class="btn btn-oblong bd ml-2 btn-outline-primary"
                      data-toggle="modal"
                      data-target="#exampleModal"
                    >
                      <i class="fas fa-plus"></i>
                    </button>
                  </span>
                </div>
              </div>
              <!-- col-4 -->
              <div class="form-group">
                <label class="form-control-label"
                  >Proveedor: <span class="tx-danger">*</span></label
                >
                <select
                  class="form-control"
                  v-model="proveedor"
                  @change="setProveedor"
                >
                  <option value="">Seleccione</option>
                  <option
                    :value="p.keyPro + '|' + p.businessName"
                    v-for="p in providers_data"
                    :key="p.keyPro"
                  >
                    {{ p.businessName }}
                  </option>
                </select>
              </div>
              <!-- col-4 -->
              <div class="form-group">
                <label class="form-control-label"
                  >Adjuntar Proforma: <span class="tx-danger">*</span></label
                >
                <file-pond-demo
                  :maxFiles="1"
                  fileTypes="application/pdf"
                  @changeFile="addFilesToProformas"
                  ref="fileComponente"
                ></file-pond-demo>
              </div>
              <!-- col-4 -->
              <div class="form-group">
                <label class="form-control-label"
                  >Monto de la Proforma: <span class="tx-danger">*</span></label
                >
                <input
                  type="number"
                  v-model="pedido.monto"
                  class="form-control"
                  placeholder="0.00"
                />
              </div>
              <!-- col-8 -->
            </div>
            <!-- row -->
            <div class="form-layout-footer bd pd-20 bd-t-0 mb-3 text-center">
              <button
                class="btn btn-info btn-sm bd-0 valign-middle"
                @click="addProformaToDetails"
              >
                Agregar <i class="icon ion-arrow-down-a ml-1"></i>
              </button>
            </div>
            <!-- form-group -->
          </div>
        </div>

        <div class="col-lg-8">
          <label-section>Detalle de los pedidos seleccionados</label-section>
          <div class="signup-separator"></div>
          <table-invoice>
            <template #thead>
              <th></th>
              <th>Pedido</th>
              <th class="wd-30p">Proveedor</th>
              <th class="wd-30p">Proforma</th>
              <th>Monto</th>
            </template>
            <template #tbody>
              <template v-if="details.length > 0">
                <tr v-for="(d, index) in details" :key="index">
                  <td class="valign-middle">
                    <button type="button" class="btn btn-sm">
                      <i class="fa fa-close text-danger"></i>
                    </button>
                  </td>
                  <td class="valign-middle tx-bold tx-12">
                    {{ details[index].idPedido }}
                  </td>
                  <td class="valign-middle tx-bold tx-12">
                    {{ details[index].proveedor }}
                  </td>
                  <td class="valign-middle tx-bold tx-12">
                    {{ details[index].fileName }}
                  </td>
                  <td class="valign-middle tx-bold tx-12">
                    {{ details[index].monto | money }}
                  </td>
                </tr>
              </template>
              <tr v-else>
                <td class="text-center valign-middle tx-bold tx-12" colspan="5">
                  Seleccione un pedido!!
                </td>
              </tr>
            </template>
            <div
              class="invalid-feedback d-block"
              v-if="errors && errors.detalleProforma"
            >
              {{ errors.detalleProforma[0] }}
            </div>
          </table-invoice>
        </div>
      </div>
      <!-- row -->

      <div class="form-layout-footer text-right">
        <button
          class="btn btn-info btn-sm bd-0 valign-middle"
          :disabled="details.length == 0"
          @click="saveProformas"
        >
          <Loading v-show="isLoading" />
          Guardar
        </button>
        <button class="btn btn-secondary btn-sm bd-0" @click="resetForm()">
          Cancelar
        </button>
      </div>
      <!-- form-layout-footer -->
    </div>
    <!-- form-layout -->

    <!-- modal-section -->
    <modal-section maxWidth="lg">
      <template #title> Pedidos</template>
      <template #body>
        <p class="tx-12 tx-gray-600">
          Solo debe seleccionar un pedido a la vez, tambien puede deshacer el
          cambio con el botón que aparecerá después de seleccionar un pedido.
        </p>
        <label class="section-label-sm tx-gray-500"
          >Detalle de los pedidos</label
        >
        <div class="signup-separator"></div>
        <table-invoice>
          <template #thead>
            <th>Pedido</th>
            <th>Monto</th>
            <th>Fecha</th>
            <th>Nro. Items</th>
            <th>Acción</th>
          </template>
          <template #tbody>
            <template v-if="detallePedidos.length > 0">
              <tr
                v-for="d in detallePedidos"
                :key="d.idPedido"
                @click="addPedidoDetail(d)"
                style="cursor: pointer"
              >
                <td class="valign-middle tx-bold tx-12">000{{ d.idPedido }}</td>
                <td class="valign-middle tx-bold tx-12">
                  {{ d.monto | money }}
                </td>
                <td class="valign-middle tx-bold tx-12 text-capitalize">
                  {{ formatDateAsString(d.fechaPedido) }}
                </td>
                <td class="valign-middle tx-bold tx-12">
                  {{ d.nroProducts }} items
                </td>
                <td class="valign-middle text-center">
                  <button type="button" class="btn btn-teal btn-sm">
                    <i class="icon ion-archive"></i>
                  </button>
                </td>
              </tr>
            </template>
            <tr v-else>
              <td class="text-center valign-middle tx-bold tx-12" colspan="5">
                Seleccione un pedido!!
              </td>
            </tr>
          </template>
          <div
            class="invalid-feedback d-block"
            v-if="errors && errors.detalleProforma"
          >
            {{ errors.detalleProforma[0] }}
          </div>
        </table-invoice>
      </template>
      <template #footer>
        <button type="button" data-dismiss="modal" class="btn btn-primary">
          Cerrar
        </button>
      </template>
    </modal-section>
  </div>
  <!-- section-wrapper -->
</template>
<script>
import InfoCompany from "../components/Empresa.vue";
import InputDate from "../components/InputGroupDate.vue";
import LabelSection from "../components/SectionLabel.vue";
import TableInvoice from "../components/TableInvoice.vue";
import ModalSection from "../components/ModalSection.vue";
import FilePondDemo from "../components/FilePond.vue";
import Loading from "../components/LoaderAction.vue";
import moment from "moment";

export default {
  name: "Proformas",

  components: {
    InfoCompany,
    InputDate,
    LabelSection,
    TableInvoice,
    Loading,
    ModalSection,
    FilePondDemo,
  },

  mounted() {
    this.getAsyncPedidos();
    this.getAsyncProviders();
  },

  data() {
    return {
      idPedido: "",
      pedido: {
        fechaRecepcion: "",
        idProveedor: "",
        proveedor: "",
        urlNameProforma: "",
        monto: "",
      },
      detallePedidos: [],
      providers_data: [],
      proveedor: "",
      fielP: "",
      details: [],
      isLoading: false,
      errors: [],
    };
  },

  filters: {
    money: function (val) {
      return "S/." + Number.parseFloat(val).toFixed(2);
    },
  },

  computed: {
    disabled() {
      if (
        this.idPedido &&
        this.pedido.idProveedor &&
        this.pedido.urlNameProforma &&
        this.pedido.monto
      ) {
        return false;
      }
      return true;
    },
  },
  methods: {
    async getAsyncPedidos() {
      const res = await axios.get("/api/proformas/pedidos");
      this.detallePedidos = res.data;
    },

    async getAsyncProviders() {
      const res = await axios.get("/api/dataProviders");
      this.providers_data = res.data;
    },

    formatDateAsString(value) {
      moment.locale("es");
      return moment(value).format("LLLL");
    },

    addPedidoDetail(values) {
      this.idPedido = "000" + values.idPedido;
      $("#exampleModal").modal("hide");
    },

    setProveedor() {
      var array = this.proveedor.split("|");
      this.pedido.idProveedor = array[0];
      this.pedido.proveedor = array[1];
    },

    addFilesToProformas(values) {
      if (values.length > 0) {
        this.fielP = values[0].file;
        this.pedido.urlNameProforma = this.fielP.name;
      } else {
        this.pedido.urlNameProforma = "";
      }
    },

    addProformaToDetails() {
      let i = this.details.findIndex(
        (el) => el.idProveedor == this.pedido.idProveedor
      );
      if (i != -1) {
        $.toast({
          content: "Seleccione otro proveedor.",
        });
        return;
      }
      if (
        !this.idPedido ||
        !this.pedido.urlNameProforma ||
        !this.pedido.idProveedor ||
        !this.pedido.proveedor ||
        !this.fielP ||
        !this.pedido.monto
      ) {
        $.toast({
          content: "Complete los campos.",
        });
        return;
      }
      const fila = {
        idPedido: this.idPedido,
        idProveedor: this.pedido.idProveedor,
        proveedor: this.pedido.proveedor,
        fileName: this.pedido.urlNameProforma,
        file: this.fielP,
        monto: this.pedido.monto,
      };
      this.details.push(fila);
      this.resetFieldsNewDetails();
      $.toast({
        content: "Proforma agregada al Pedido.",
      });
    },

    saveProformas() {
      if (this.details.length == 0) {
        $.toast({
          content: "Complete los campos.",
        });
        return;
      }

      let onOk = () => {
        this.isLoading = true;
        let fields = new FormData();
        for (let i = 0; i < this.details.length; i++) {
          const element = this.details[i];
          fields.append("detalleProforma[" + i + "]", element.file);
          fields.append("idProveedor[" + i + "]", element.idProveedor);
          fields.append("montos[" + i + "]", element.monto);
        }
        fields.append("idPedido", this.details[0].idPedido);

        const config = {
          headers: { "content-type": "multipart/form-data" },
        };
        axios
          .post("/pedidos/proformas", fields, config)
          .then((res) => {
            this.isLoading = false;
            this.$awn.success(res.data);
          })
          .catch((err) => {
            this.existsErrors(e);
          });
      };

      this.$awn.confirm("Estás seguro de guardar el registro?", onOk);
    },

    resetForm() {
      this.details = [];
      this.idPedido = "";
      this.resetFieldsNewDetails();
    },
    resetFieldsNewDetails() {
      this.pedido.idProveedor = "";
      this.pedido.proveedor = "";
      this.pedido.urlNameProforma = "";
      this.pedido.monto = "";
      this.fielP = "";
      this.$refs.fileComponente.removeFiles();
      this.proveedor = "";
    },

    existsErrors(e) {
      if (e.response.status == 422) {
        this.errors = e.response.data.errors;
      } else {
        this.$awn.alert("La acción ha fallado!.");
      }
      this.isLoading = false;
    },
  },
};
</script>
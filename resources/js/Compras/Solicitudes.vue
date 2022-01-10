<template>
  <div class="card-body">
    <div class="invoice-header">
      <header-invoice>
        <template #title> Solicitud </template>
        <template #input>
          <input
            type="text"
            v-model="nroSolicitud"
            placeholder="ejm. 110023"
            class="form-control"
          />
        </template>
      </header-invoice>
      <info-company></info-company>
      <!-- company-from -->
    </div>

    <div class="row mg-t-20">
      <div class="col-md mg-t-10 mg-md-t-0">
        <label-section>Datos del Solicitante</label-section>
        <div class="signup-separator"></div>
        <div class="billed-to mt-3">
          <div class="mg-t-8 row">
            <label for="" class="col-sm-3 form-control-label"
              >Solicitante</label
            >
            <div class="col-sm-9">
              <div class="d-flex">
                <select readonly class="form-control form-control-sm mr-2">
                  <option>Usuario</option>
                </select>
                <input
                  type="text"
                  readonly
                  :value="empleado[0].cargo"
                  class="form-control form-control-sm"
                />
              </div>
            </div>
          </div>
          <div class="mg-t-8 row">
            <label for="" class="col-sm-3 form-control-label">Nombre</label>
            <div class="col-sm-9">
              <input
                type="text"
                :value="empleado[0].name"
                readonly
                class="form-control form-control-sm"
                id=""
              />
            </div>
          </div>
          <div class="mg-t-8 row">
            <label for="" class="col-sm-3 form-control-label">Sucursal</label>
            <div class="col-sm-9">
              <select readonly class="form-control form-control-sm">
                <option>Principal</option>
              </select>
            </div>
          </div>
          <div class="mg-t-8 row">
            <label for="" class="col-sm-3 form-control-label">Area</label>
            <div class="col-sm-9">
              <select class="form-control form-control-sm">
                <option :value="empleado[0].area">
                  {{ empleado[0].area }}
                </option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <!-- col -->
      <div class="col-md mg-t-30 mg-md-t-0">
        <label-section>Información</label-section>
        <div class="signup-separator"></div>
        <div class="billed-to mt-3">
          <div class="mg-t-8 row">
            <label for="inputStart" class="col-sm-3 form-control-label"
              >Emisión</label
            >
            <div class="col-sm-9">
              <input-date size="form-control-sm"></input-date>
            </div>
          </div>
        </div>
      </div>
      <!-- col -->
    </div>

    <div class="wizard wizard-style-2 clearfixx mt-5">
      <div class="steps clearfix">
        <ul role="tablist">
          <li :class="classes.first[step]">
            <a id="wizard5-t-0" href="#wizard5-h-0" aria-controls="wizard5-p-0"
              ><span class="current-info audible">current step: </span
              ><span class="number">1</span>
              <span class="title">Detalle del Pedido</span></a
            >
          </li>
          <li :class="classes.second[step]">
            <a id="wizard1-t-1" href="#wizard1-h-1">
              <span class="number">2</span>
              <span class="title">Proformas</span>
            </a>
          </li>
          <li :class="classes.third[step]">
            <a id="wizard1-t-2" href="#wizard1-h-2">
              <span class="number">3</span>
              <span class="title">Resumen</span>
            </a>
          </li>
        </ul>
      </div>
      <div class="content clearfix">
        <section class="body current">
          <!-- agregar nuevo producto -->
          <button-invoice v-show="step == 0">Agregar Pedido</button-invoice>
          <!-- table responsivo detalle -->
          <table-invoice v-show="step == 0">
            <template #thead>
              <th></th>
              <th class="wd-30p">Concepto</th>
              <th>Cantidad</th>
              <th>Medida</th>
              <th>Precio</th>
              <th class="wd-15p">Precio Total</th>
            </template>
            <template #tbody>
              <template v-if="details.length > 0">
                <tr v-for="d in details" :key="d.idProducto">
                  <td>
                    <img
                      src="http://via.placeholder.com/800x533"
                      class="wd-55"
                      :alt="d.descripcionProducto"
                    />
                  </td>
                  <td class="valign-middle tx-bold tx-12">
                    {{ d.descripcionProducto }}
                  </td>
                  <td class="valign-middle tx-bold">
                    {{ d.cantidad }}
                  </td>
                  <td class="valign-middle tx-bold">
                    {{ d.medida }}
                  </td>
                  <td class="valign-middle tx-bold tx-12">
                    {{ d.costoUnitario | money }}
                  </td>
                  <td class="tx-right valign-middle">
                    {{ (d.cantidad * d.costoUnitario) | money }}
                  </td>
                </tr>
              </template>
              <tr v-else>
                <td class="text-center valign-middle tx-bold tx-12" colspan="6">
                  Seleccione un pedido!!
                </td>
              </tr>
              <tr>
                <td colspan="3" rowspan="4" class="valign-middle"></td>
                <td class="tx-right tx-12">Sub-Total</td>
                <td colspan="2" class="tx-right">{{ subTotal | money }}</td>
              </tr>
              <tr>
                <td class="tx-right tx-12">Igv (18%)</td>
                <td colspan="2" class="tx-right">{{ igvTotal | money }}</td>
              </tr>
              <tr>
                <td class="tx-right tx-12">Descuento</td>
                <td colspan="2" class="tx-right">{{ descuento | money }}</td>
              </tr>
              <tr>
                <td class="tx-right tx-uppercase tx-bold tx-inverse tx-12">
                  Total
                </td>
                <td colspan="2" class="tx-right">
                  <h4 class="tx-primary tx-bold tx-lato">
                    {{ total | money }}
                  </h4>
                </td>
              </tr>
            </template>
          </table-invoice>

          <div v-show="step == 1">
            <label class="slim-card-title"
              >Proformas para el pedido N°. 000{{ solicitud.idPedido }}</label
            >
            <div class="signup-separator"></div>
            <div
              class="post-group"
              v-for="item in detalleProformas"
              :key="item.idProforma"
            >
              <div class="post-item">
                <span class="post-date text-capitalize">{{
                  formatDateProforma(item.fRegistro)
                }}</span>
                <p class="post-title">
                  <span>{{ item.razonSocial }}</span>
                </p>
                <p class="tx-12 mg-b-10">
                  <a
                    class="tx-bold"
                    :href="
                      '/showProforma/' + solicitud.idPedido + '/' + item.archivo
                    "
                    target="_blank"
                    ><i class="fa fa-file-pdf-o"></i> {{ item.archivo }}</a
                  >
                </p>
                <p class="tx-12 mg-b-0">
                  Monto: {{ item.montoProforma | money }} <br />
                </p>
              </div>
              <!-- post-item -->
            </div>
          </div>

          <div v-show="step == 2">
            <label class="section-label-sm tx-gray-800 tx-14"
              >Resumen de la Solicitud</label
            >
            <div class="signup-separator"></div>

            <div>
              <p class="mg-b-20">
                La Solicitud de Compra se enviará por
                <i class="fa fa-envelope ml-1"></i> correo electrónico a los
                responsables encargados de la aprobación o rechazo, si usted es
                uno de ellos le llegará un correo y se le recomienda revisar su
                bandeja de entrada.
              </p>
              <p class="mg-b-20">
                Antes de finalizar, debe escribir una nota en el recuadro
                inferior referente a la solicitud de Compra.
              </p>
              <p class="mg-b-20">
                Cuando se haya aceptado o rechazado la solicitud, le llegará un
                correo de respuesta.
              </p>
              <p class="mg-b-20">Gracias.</p>
            </div>
          </div>
        </section>
      </div>

      <div class="actions clearfix">
        <ul>
          <li :class="classes.button_left[step]">
            <a href="#previous" @click="previous_step">Anterior</a>
          </li>
          <li :class="{ disabled: details.length == 0 }">
            <a href="#next" @click="next_step" v-show="step < 2">Siguiente</a>
          </li>
          <li v-show="step == 2">
            <a href="#finish" @click="sendSolicitudCompra()">Finalizar</a>
          </li>
        </ul>
      </div>
    </div>

    <div class="form-group mt-5">
      <label
        >Notas <i class="far fa-question-circle text-success"></i> :
      </label>
      <textarea v-model="solicitud.notas" class="form-control"></textarea>
      <small>Utiliza las notas para agregar información importante.</small>
    </div>

    <!-- Modal pedidos -->
    <modal-section maxWidth="lg">
      <template #title> Pedidos</template>
      <template #body>
        <p class="tx-12 tx-gray-600">
          Solo debe seleccionar un pedido a la vez, tambien puede volver a
          cambiar de pedido para armar la solicitude de compra.
        </p>
        <label-section>Detalle de los pedidos</label-section>
        <div class="signup-separator"></div>
        <table-invoice>
          <template #thead>
            <th>Pedido</th>
            <th>Monto</th>
            <th>Fecha</th>
            <th>Nro. Productos</th>
            <th>Seleccionar</th>
          </template>
          <template #tbody>
            <template v-if="detallePedidos.length > 0">
              <tr
                v-for="d in detallePedidos"
                :key="d.idPedido"
                @click="selectedFila(d)"
                style="cursor: pointer"
              >
                <td class="valign-middle tx-bold tx-12">000{{ d.idPedido }}</td>
                <td class="valign-middle tx-bold tx-12">
                  {{ d.monto | money }}
                </td>
                <td class="valign-middle tx-bold tx-12 text-capitalize">
                  {{ formatDatePedido(d.fechaPedido) }}
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
                No se encontraròn resultados!!
              </td>
            </tr>
          </template>
        </table-invoice>
      </template>
      <template #footer>
        <button
          type="button"
          data-dismiss="modal"
          class="btn btn-primary btn-sm"
        >
          Cerrar
        </button>
      </template>
    </modal-section>
  </div>
</template>
<script>
import InfoCompany from "../components/Empresa.vue";
import ModalSection from "../components/ModalSection.vue";
import HeaderInvoice from "../components/HeaderInvoice.vue";
import InputDate from "../components/InputGroupDate.vue";
import TableInvoice from "../components/TableInvoice.vue";
import ButtonInvoice from "../components/ButtonInvoice.vue";
import LabelSection from "../components/SectionLabel.vue";
import moment from "moment";

export default {
  props: ["empleado"],
  components: {
    InfoCompany,
    ModalSection,
    TableInvoice,
    ButtonInvoice,
    HeaderInvoice,
    LabelSection,
    InputDate,
  },
  mounted() {
    this.fetchOptions();
    this.getPedidos();
  },

  data() {
    return {
      step: 0,
      solicitud: {
        idPedido: "",
        pedido: "",
        detalleProformas: [],
        detallePedido: [],
        monto: [],
        notas: "",
        empleado: "",
      },
      detallePedidos: [],
      details: [],
      igv: 0.18,
      descuento: 0,
      nroSolicitud: "",
      detalleProformas: [],
      classes: {
        first: ["first current", "first done", "first done"],
        second: ["disabled", "current", "done"],
        third: ["disabled last", "disabled last", "last current"],
        button_left: ["disabled", "", ""],
      },
      products: [],
    };
  },

  filters: {
    money: function (val) {
      return "S/." + Number.parseFloat(val).toFixed(2);
    },
  },

  computed: {
    subTotal() {
      let suma = 0;
      if (this.details.length > 0) {
        for (let i in this.details) {
          suma += this.details[i].costoUnitario * this.details[i].cantidad;
        }
      }
      return suma;
    },

    igvTotal() {
      return this.subTotal * this.igv;
    },

    total() {
      return this.subTotal + this.igvTotal;
    },
  },

  methods: {
    formatDatePedido(value) {
      moment.locale("es");
      return moment(value).format("LLLL");
    },

    formatDateProforma(value) {
      moment.locale("es");
      return moment(value).calendar();
    },

    next_step() {
      if (this.details.length > 0) {
        this.step += 1;
      }
    },

    previous_step() {
      if (this.step > 0) {
        this.step -= 1;
      }
    },

    fetchOptions() {
      var el = this;
      // AJAX request
      axios.get("/api/solicitudes/number").then((res) => {
        // Update options
        el.nroSolicitud = "000" + res.data.max;
      });
    },

    async getPedidos() {
      const res = await axios.get("/api/solicitudes/pedidos");
      this.detallePedidos = res.data;
    },

    selectedFila(value) {
      $("#exampleModal").modal("hide");
      this.$awn.asyncBlock(
        axios.get("/api/pedidos/detalle/" + value.idPedido),
        (resp) => {
          this.details = resp.data;
          this.$awn.success(`Se han cargado ${resp.data.length} registros`);
        }
      );
      this.solicitud.idPedido = value.idPedido;
      this.solicitud.pedido = value;
      axios.get("/api/pedidos/" + value.idPedido + "/proformas").then((res) => {
        this.detalleProformas = res.data;
      });
    },

    sendSolicitudCompra() {
      if (!this.solicitud.notas) {
        $.toast({
          content: "Por favor ingrese una nota!",
        });
        return;
      }
      let onOk = () => {
        this.solicitud.detalleProformas = this.detalleProformas;
        this.solicitud.detallePedido = this.details;
        this.solicitud.monto = this.total;
        this.solicitud.empleado = this.empleado[0].code_empleado;
        this.$awn.async(axios.post("/api/solicitud", this.solicitud), (res) => {
          console.log(res.data);
          this.$awn.success(res.data);
        });
      };
      this.$awn.confirm("Estás seguro de guardar el pedido?", onOk);
    },
  },
};
</script>
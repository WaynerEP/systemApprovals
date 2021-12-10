<template>
  <div>
    <!-- <p class="mg-b-20 mg-sm-b-35">
      Below is an example of a basic horizontal form wizard.
    </p> -->
    <div class="wizard clearfix">
      <div class="steps clearfix">
        <ul role="tablist">
          <li :class="classes.first[step]">
            <a href="#wizard1-h-0">
              <span class="current-info audible"> current step: </span>
              <span class="number">1</span>
              <span class="title">Registrar proformas</span></a
            >
          </li>
          <li :class="classes.second[step]">
            <a id="wizard1-t-1" href="#wizard1-h-1">
              <span class="number">2</span>
              <span class="title">Solicitudes</span>
            </a>
          </li>
          <li :class="classes.third[step]">
            <a id="wizard1-t-2" href="#wizard1-h-2">
              <span class="number">3</span>
              <span class="title">Enviar Solicitudes</span>
            </a>
          </li>
        </ul>
      </div>
      <div class="content clearfix">
        <h3 id="wizard1-h-0" tabindex="-1" class="title current">
          Personal Information
        </h3>
        <section id="wizard1-p-0" class="body current">
          <div class="invoice-header mb-4">
            <div class="justify-content-end">
              <h1 class="invoice-title">Proforma</h1>
              <div class="form-layout form-layout-6">
                <div class="row no-gutter mt-1">
                  <div class="col-5 col-sm-4">Nro.</div>
                  <!-- col-4 -->
                  <div class="col-7 col-sm-8">
                    <input
                      class="form-control"
                      type="text"
                      name="nro"
                      placeholder="ejm. 110023"
                    />
                  </div>
                  <!-- col-8 -->
                </div>
              </div>
            </div>
            <!-- <info-company></info-company> -->
            <!-- billed-from -->
          </div>

          <div class="row mb-5">
            <div class="col-sm-6">
              <div class="row">
                <label for="inputEmail3" class="col-sm-3 form-control-label"
                  >Proveeedor</label
                >
                <div class="col-sm-9 mg-t-10 mg-sm-t-0">
                  <v-select
                    v-model="proveedor"
                    placeholder="Buscar..."
                    label="names"
                    :reduce="
                      (n) => n.keyPro + '_' + n.dni + '_' + n.businessName
                    "
                    :options="providers_data"
                    @search="fetchOptions"
                    @input="selectedOption"
                  >
                  </v-select>
                </div>
              </div>
              <div class="mg-t-20 row">
                <label for="inputEmail3" class="col-sm-3 form-control-label"
                  >Identificación</label
                >
                <div class="col-sm-9 mg-t-10 mg-sm-t-0">
                  <input
                    type="text"
                    v-model="proforma.identificacion"
                    class="form-control form-control-sm"
                    id=""
                  />
                </div>
              </div>
              <div class="mg-t-20 row">
                <label for="inputEmail3" class="col-sm-3 form-control-label"
                  >Telefono</label
                >
                <div class="col-sm-9 mg-t-10 mg-sm-t-0">
                  <input
                    type="text"
                    v-model="proforma.razonSocial"
                    class="form-control form-control-sm"
                  />
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="row">
                <label for="inputStart" class="col-sm-3 form-control-label"
                  >Fecha</label
                >
                <div class="col-sm-9 mg-t-10 mg-sm-t-0">
                  <input
                    type="date"
                    v-model="proforma.fInicio"
                    class="form-control form-control-sm"
                    id="inputStart"
                    placeholder="Email"
                  />
                </div>
              </div>
              <div class="mg-t-20 row">
                <label for="inputEnd" class="col-sm-3 form-control-label"
                  >Plazo</label
                >
                <div class="col-sm-9 mg-t-10 mg-sm-t-0">
                  <input
                    type="date"
                    v-model="proforma.fFinal"
                    class="form-control form-control-sm"
                    id="inputEnd"
                    placeholder="Email"
                  />
                </div>
              </div>
            </div>
          </div>
          <div class="table-responsive mg-t-40">
            <table class="table table-invoice">
              <thead>
                <tr>
                  <th class="wd-30p">Concepto</th>
                  <th>Precio</th>
                  <th>Cantidad</th>
                  <th>Descuento</th>
                  <th class="wd-10p">Total</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(d, index) in details" :key="index">
                  <td>
                    <v-select
                      placeholder="Buscar..."
                      v-model="details[index].idProducto"
                      label="names"
                      :reduce="
                        (n) => n.keyPro + '_' + n.dni + '_' + n.businessName
                      "
                      :options="providers_data"
                      @search="fetchOptions"
                      @input="selectedProduct(index)"
                    >
                    </v-select>
                  </td>
                  <td>
                    <input
                      type="number"
                      v-model="details[index].precio"
                      class="form-control form-control-sm"
                      placeholder="0"
                    />
                  </td>
                  <td class="tx-center">
                    <input
                      type="number"
                      v-model="details[index].cantidad"
                      class="form-control form-control-sm"
                      placeholder="0"
                    />
                  </td>
                  <td class="tx-right">
                    <input
                      type="text"
                      v-model="details[index].descuento"
                      class="form-control form-control-sm"
                      placeholder="0"
                    />
                  </td>
                  <td class="tx-right">$300.00</td>
                </tr>
                <tr class="mb-5">
                  <td colspan="5">
                    <button
                      @click="addNewRow"
                      type="button"
                      class="btn btn-outline-primary btn-sm"
                    >
                      <i class="fas fa-plus"></i> Agregar nuevo fila
                    </button>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" rowspan="4" class="valign-middle">
                    <div class="invoice-notes">
                      <label class="section-label-sm tx-gray-500">Notes:</label>
                      <p>
                        Factura Proforma válida hasta: {{ notaVencimiento }}
                      </p>
                    </div>
                    <!-- invoice-notes -->
                  </td>
                  <td class="tx-right tx-12">Sub-Total</td>
                  <td colspan="2" class="tx-right">$5,750.00</td>
                </tr>
                <tr>
                  <td class="tx-right tx-12">Tax (5%)</td>
                  <td colspan="2" class="tx-right">$287.50</td>
                </tr>
                <tr>
                  <td class="tx-right tx-12">Discount</td>
                  <td colspan="2" class="tx-right">-$50.00</td>
                </tr>
                <tr>
                  <td class="tx-right tx-uppercase tx-bold tx-inverse tx-12">
                    Total Due
                  </td>
                  <td colspan="2" class="tx-right">
                    <h4 class="tx-primary tx-bold tx-lato">$5,987.50</h4>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="row mt-4">
            <div class="col-lg-8"></div>
            <div class="col-lg-4 text-right">
              <div class="invoice-detail-item">
                <div class="invoice-detail-name">Subtotal</div>
                <div class="invoice-detail-value">$670.99</div>
              </div>
              <div class="invoice-detail-item">
                <div class="invoice-detail-name">Shipping</div>
                <div class="invoice-detail-value">$15</div>
              </div>
              <hr class="mt-2 mb-2" />
              <div class="invoice-detail-item">
                <div class="invoice-detail-name">Total</div>
                <div class="invoice-detail-value invoice-detail-value-lg">
                  $685.99
                </div>
              </div>
            </div>
          </div>
          <div class="form-group mt-5">
            <label
              >Notas <i class="far fa-question-circle text-success"></i> :
            </label>
            <textarea class="form-control"></textarea>
            <small
              >Utiliza las notas para agregar información importante. No son
              visibles en la impresión.</small
            >
          </div>
        </section>
      </div>
      <div class="actions clearfix">
        <ul>
          <li :class="classes.button_left[step]">
            <a href="#previous" @click="previous_step">Anterior</a>
          </li>
          <li>
            <a href="#next" @click="next_step" v-show="step < 2">Siguiente</a>
          </li>
          <li v-show="step == 2">
            <a href="#finish">Finalizar</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import vSelect from "vue-select";
import InfoCompany from "../components/Empresa.vue";
import moment from "moment";

export default {
  components: {
    vSelect,
    InfoCompany,
  },

  mounted() {
    this.fetchOptions();
  },

  data() {
    return {
      step: 0,
      proveedor: "",
      proforma: {
        idProveedor: "",
        identificacion: "",
        razonSocial: "",
        fInicial: "",
        fFinal: "",
        detalle: [],
      },
      details: [
        {
          idProducto: "",
          producto: "",
          precio: "",
          cantidad: "",
          descuento: "",
          total: "",
        },
      ],
      subTotal: "",
      igvTotal: "",
      discountTotal: "",
      classes: {
        first: ["first current", "first done", "first done"],
        second: ["disabled", "current", "done"],
        third: ["disabled last", "disabled last", "last current"],
        button_left: ["disabled", "", ""],
      },
      providers_data: [],
    };
  },

  methods: {
    next_step() {
      this.step += 1;
    },
    previous_step() {
      if (this.step > 0) {
        this.step -= 1;
      }
    },

    fetchOptions() {
      var el = this;
      // AJAX request
      axios.get("/api/dataProviders").then(function (response) {
        // Update options
        el.providers_data = response.data;
      });
    },
    selectedOption(value) {
      let el = this;
      let datos = value.split("_");
      console.log(datos);
      el.proforma.idProveedor = datos[0];
      el.proforma.identificacion = datos[1];
      el.proforma.razonSocial = datos[2];
    },

    addNewRow() {
      var fila = {
        idProducto: "",
        producto: "",
        precio: "",
        cantidad: "",
        descuento: "",
        total: "",
      };
      this.details.push(fila);
    },

    selectedProduct(val) {
      console.log(val);
      this.details[val].precio = "2506";
    },
  },

  computed: {
    notaVencimiento: function () {
      moment.locale("es");
      if (this.proforma.fFinal) {
        return moment(this.proforma.fFinal).format("LLLL");
      }
    },
  },
};
</script>
<style>
.v-select ul {
  padding: 5px !important;
}
</style>

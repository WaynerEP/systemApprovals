<template>
  <div>
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
        <section id="wizard1-p-0" class="body current">
          <div class="invoice-header mb-4">
            <div class="justify-content-end">
              <h1 class="invoice-title">Proforma</h1>
              <div class="form-layout form-layout-6">
                <div class="row no-gutter mt-1">
                  <div class="col-5 col-sm-4">Nro.</div>
                  <div class="col-7 col-sm-8">
                    <input
                      class="form-control"
                      type="text"
                      name="nro"
                      placeholder="ejm. 110023"
                    />
                  </div>
                </div>
              </div>
            </div>
            <info-company></info-company>
            <!-- billed-from -->
          </div>

          <div class="row mb-4">
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
                    v-model="proforma.fInicial"
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
          <!-- agregar nuevo producto -->
          <button
            type="button"
            @click="newDialog(0)"
            class="btn btn-outline-primary btn-sm"
          >
            <i class="fas fa-plus"></i> Agregar nuevo producto
          </button>
          <!-- table responsivo detalle -->
          <div class="table-responsive mg-t-20">
            <table class="table table-invoice">
              <thead class="thead-colored bg-primary">
                <tr>
                  <th></th>
                  <th></th>
                  <th class="wd-30p">Concepto</th>
                  <th>Cantidad</th>
                  <th>Precio Unit.</th>
                  <th>Medida</th>
                  <th class="wd-15p">Precio Total</th>
                </tr>
              </thead>
              <tbody>
                <template v-if="details.length > 0">
                  <tr v-for="(d, index) in details" :key="index">
                    <td class="valign-middle">
                      <button
                        type="button"
                        class="btn btn-sm"
                        @click="removeItem(d.idProducto)"
                      >
                        <i class="fa fa-close text-danger"></i>
                      </button>
                    </td>
                    <td>
                      <img
                        src="http://via.placeholder.com/800x533"
                        class="wd-55"
                        :alt="details[index].producto"
                      />
                    </td>
                    <td class="valign-middle tx-bold tx-12">
                      {{ details[index].producto }}
                    </td>
                    <td class="tx-center valign-middle">
                      <input
                        type="number"
                        v-model="details[index].cantidad"
                        class="form-control form-control-sm"
                        placeholder="0"
                      />
                    </td>
                    <td class="valign-middle">
                      <input
                        type="number"
                        v-model="details[index].precio"
                        class="form-control form-control-sm"
                        placeholder="0"
                      />
                    </td>
                    <td class="valign-middle tx-bold tx-12">
                      {{ details[index].medida }}
                    </td>
                    <td class="tx-right valign-middle">
                      {{
                        (details[index].precio * details[index].cantidad)
                          | money
                      }}
                    </td>
                  </tr>
                </template>
                <tr v-else>
                  <td
                    class="text-center valign-middle tx-bold tx-12"
                    colspan="7"
                  >
                    Seleccione un producto!!
                  </td>
                </tr>

                <tr>
                  <td colspan="4" rowspan="4" class="valign-middle">
                    <div class="invoice-notes">
                      <label class="section-label-sm tx-gray-500">Notas:</label>
                      <p class="tx-12 tx-bold">
                        Factura Proforma válida hasta: {{ notaVencimiento }}
                      </p>
                    </div>
                    <!-- invoice-notes -->
                  </td>
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
              </tbody>
            </table>
          </div>

          <div class="form-group mt-5">
            <label
              >Notas <i class="far fa-question-circle text-success"></i> :
            </label>
            <textarea v-model="proforma.notas" class="form-control"></textarea>
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

    <!-- dialog -->
    <dialog-drag
      v-for="dialog in dialogs"
      :key="dialog.id"
      :id="dialog.id"
      :title="dialog.name"
      :ref="'dialog-' + dialog.id"
      @close="removeDialog"
      :options="dialog.options"
    >
      <DataTable
        title="Seleccione Productos"
        :columns="columns"
        :rows="products"
        :perPage="[7, 15, 20, 50]"
        :defaultPerPage="7"
        locale="es"
        :exportable="false"
        :printable="false"
        :clickable="false"
      >
        <th slot="thead-tr">
          <label class="ckbox"> <input type="checkbox" /><span></span> </label>
        </th>
        <template slot="tbody-tr" slot-scope="props">
          <td>
            <label class="ckbox" :for="'gridCheck' + props.row.id">
              <input
                type="checkbox"
                :value="props.row.id"
                :id="'gridCheck' + props.row.id"
                v-model="productsDetails"
                @change="(e) => addProductToDetails(props.row, e)"
                checked="false"
              /><span></span>
            </label>
          </td>
        </template>
      </DataTable>
    </dialog-drag>
    <!-- end Dialog -->
  </div>
</template>
<script>
import vSelect from "vue-select";
import InfoCompany from "../components/Empresa.vue";
import moment from "moment";
import DialogDrag from "vue-dialog-drag";
import DataTable from "vue-materialize-datatable";

export default {
  components: {
    vSelect,
    DialogDrag,
    InfoCompany,
    DataTable,
  },

  mounted() {
    this.fetchOptions();
    if (localStorage.proveedor) {
      this.proveedor = localStorage.proveedor;
    }
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
        notas: "",
      },
      details: [],
      igv: 0.18,
      descuento: "0",
      classes: {
        first: ["first current", "first done", "first done"],
        second: ["disabled", "current", "done"],
        third: ["disabled last", "disabled last", "last current"],
        button_left: ["disabled", "", ""],
      },
      providers_data: [],
      dialogs: [],
      dialogId: 1,
      styles: [
        {
          name: "SELECCIONAR PRODUCTOS",
          options: {
            width: 800,
            left: 260,
            top: 250,
            centered: parent,
          },
        },
      ],
      style: null,
      products: [],
      columns: [
        {
          label: "Producto",
          field: "product",
          numeric: false,
          html: false,
        },
        {
          label: "Categoria",
          field: "category",
          numeric: false,
          html: false,
        },
        {
          label: "Stock",
          field: "stock",
        },
        {
          label: "Medida",
          field: "measure",
          numeric: false,
          html: false,
        },
      ],
      productsDetails: [],
      // subTotal: "0",
    };
  },

  filters: {
    money: function (val) {
      return "S/." + Number.parseFloat(val).toFixed(2);
    },
  },

  computed: {
    notaVencimiento() {
      moment.locale("es");
      if (this.proforma.fFinal) {
        return moment(this.proforma.fFinal).format("LLLL");
      }
    },

    subTotal() {
      let suma = 0;
      if (this.details.length > 0) {
        for (let i in this.details) {
          suma += this.details[i].precio * this.details[i].cantidad;
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

    async getProducts() {
      this.loadingTable = true;
      const res = await axios.get("/api/products/proforma");
      this.loadingTable = false;
      this.products = res.data;
    },

    newDialog(sId) {
      if (sId === null) sId = Math.floor(Math.random() * this.styles.length);
      this.dialogs.push(this.dialog(this.styles[sId]));
      this.getProducts();
    },

    removeDialog(dialog) {
      let id = dialog.id;
      let index = this.findDialog(id);
      this.dialogs.splice(index, 1);
    },

    findDialog(id, dialogs) {
      if (!dialogs) dialogs = this.dialogs;
      let index = dialogs.findIndex((val) => {
        return val.id === id;
      });
      return index > -1 ? index : null;
    },

    dialog(style) {
      let id = String(this.dialogId);
      let name = style.name;
      let options = {};
      if (style.options) options = Object.assign({}, style.options);
      // if (!options.left) options.left = 30 * id;
      // if (!options.top) options.top = 30 * id;
      // if (!options.centered) options.centered = 30 * id;
      return { id, name, options };
    },

    addProductToDetails(row, e) {
      if (e.target.checked == true) {
        let fila = {
          idProducto: row.id,
          image: "",
          producto: row.product,
          precio: 0,
          cantidad: 0,
          medida: row.measure,
          total: "",
        };
        this.details.push(fila);
      } else {
        this.removeItem(row.id);
      }
    },

    removeItem(key) {
      const index = this.details.findIndex(
        (element) => element.idProducto === key
      );
      this.details.splice(index, 1);
    },
  },

  watch: {
    proveedor(value) {
      if (value) {
        localStorage.proveedor = value;
        let datos = value.split("_");
        this.proforma.idProveedor = datos[0];
        this.proforma.identificacion = datos[1];
        this.proforma.razonSocial = datos[2];
      } else {
        localStorage.removeItem("proveedor");
        this.proveedor = "";
        this.proforma.idProveedor = "";
        this.proforma.identificacion = "";
        this.proforma.razonSocial = "";
      }
    },
    // fInicial(value) {
    //   localStorage.fInicial = value;
    //   console.log(value);
    // },

    // fFinal(value) {
    //   localStorage.fFinal = value;
    //   console.log(value);
    // },
  },
};
</script>
<template>
  <div class="card-body">
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
    <div class="invoice-header">
      <div class="justify-content-end">
        <h1 class="invoice-title">Orden de Compra</h1>
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
      <!-- company-from -->
    </div>

    <div class="row mg-t-20">
      <div class="col-md mg-t-10 mg-md-t-0">
        <label class="section-label-sm tx-gray-500"
          >Datos del Solicitante</label
        >
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
        <label class="section-label-sm tx-gray-500">Información</label>
        <div class="signup-separator"></div>
        <div class="billed-to mt-3">
          <div class="mg-t-8 row">
            <label for="inputStart" class="col-sm-3 form-control-label"
              >Emisión</label
            >
            <div class="col-sm-9">
              <input
                type="date"
                v-model="solicitud.fInicial"
                class="form-control form-control-sm"
                id="inputStart"
                placeholder="Email"
              />
            </div>
          </div>
          <div class="mg-t-8 row">
            <label for="inputEnd" class="col-sm-3 form-control-label"
              >Válido hasta</label
            >
            <div class="col-sm-9">
              <input
                type="date"
                v-model="solicitud.fFinal"
                class="form-control form-control-sm"
                id="inputEnd"
                placeholder="Email"
              />
            </div>
          </div>
        </div>
      </div>
      <!-- col -->
    </div>

    <div class="wizard wizard-style-1 clearfixx mt-5">
      <div class="steps clearfix">
        <ul role="tablist">
          <li :class="classes.first[step]">
            <a id="wizard5-t-0" href="#wizard5-h-0" aria-controls="wizard5-p-0"
              ><span class="current-info audible">current step: </span
              ><span class="number">1</span>
              <span class="title">Contenido</span></a
            >
          </li>
          <li :class="classes.second[step]">
            <a id="wizard1-t-1" href="#wizard1-h-1">
              <span class="number">2</span>
              <span class="title">Proveedores</span>
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
          <button
            type="button"
            v-show="step == 0"
            @click="newDialog(0)"
            class="btn btn-outline-primary btn-sm mb-4"
          >
            <i class="fas fa-plus"></i> Agregar nuevo producto
          </button>
          <!-- table responsivo detalle -->
          <div class="table-responsive" v-show="step == 0">
            <table class="table table-invoice table-sm">
              <thead class="thead-colored bg-primary">
                <tr>
                  <th></th>
                  <th></th>
                  <th class="wd-30p">Concepto</th>
                  <th>Cantidad</th>
                  <th>Precio Compra.</th>
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
                        min="0"
                        v-model="details[index].cantidad"
                        class="form-control form-control-sm"
                        placeholder="0"
                      />
                    </td>
                    <td class="valign-middle">
                      <input
                        type="number"
                        min="0"
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
                        Solicitud de Compra válida hasta: {{ notaVencimiento }}
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

          <div class="" v-show="step == 1">
            <div class="row" v-show="total < 100 && total > 0">
              <div class="col-lg-6">
                <label class="section-label-sm tx-gray-800 tx-14"
                  >Información del Proveedor</label
                >
                <div class="signup-separator"></div>
                <div class="row mt-2">
                  <div class="col-lg-12">
                    <select
                      class="form-control"
                      v-model="keyProveedor"
                      @change="fetchInfoProvider()"
                    >
                      <option value="" disabled>Seleccione</option>
                      <option
                        :value="p.keyPro"
                        v-for="p in providers_data"
                        :key="p.keyPro"
                      >
                        {{ p.businessName }}
                      </option>
                    </select>
                  </div>
                </div>
                <!-- row -->
                <div class="media-list mg-t-25 ml-4">
                  <div class="media">
                    <div><i class="icon ion-link tx-24 lh-0"></i></div>
                    <div class="media-body mg-l-15 mg-t-4">
                      <h6 class="tx-14 tx-gray-700">Razón Social</h6>
                      <span class="d-block">{{
                        infoProveedor.razonSocial
                      }}</span>
                    </div>
                    <!-- media-body -->
                  </div>
                  <!-- media -->
                  <div class="media mg-t-25">
                    <div>
                      <i class="icon ion-ios-telephone-outline tx-24 lh-0"></i>
                    </div>
                    <div class="media-body mg-l-15 mg-t-4">
                      <h6 class="tx-14 tx-gray-700">Teléfono</h6>
                      <span class="d-block"
                        >+51 {{ infoProveedor.telefono }}</span
                      >
                    </div>
                    <!-- media-body -->
                  </div>
                  <!-- media -->
                  <div class="media mg-t-25">
                    <div>
                      <i class="icon ion-ios-email-outline tx-24 lh-0"></i>
                    </div>
                    <div class="media-body mg-l-15 mg-t-4">
                      <h6 class="tx-14 tx-gray-700">Email</h6>
                      <span class="d-block">{{ infoProveedor.email }}</span>
                    </div>
                    <!-- media-body -->
                  </div>
                  <!-- media -->
                  <div class="media mg-t-25">
                    <div>
                      <i class="icon ion-location tx-18 lh-0"></i>
                    </div>
                    <div class="media-body mg-l-15 mg-t-2">
                      <h6 class="tx-14 tx-gray-700">
                        Distrito/Provincia/Departamento - CP
                      </h6>
                      <span class="d-block"
                        >{{ infoProveedor.ciudad }} -
                        {{ infoProveedor.codPostal }}</span
                      >
                    </div>
                    <!-- media-body -->
                  </div>
                  <!-- media -->
                </div>
              </div>
              <!-- col -->
            </div>

            <div class="row" v-show="total >= 100">
              <div class="col-md-12">
                <label class="section-label-sm tx-gray-800 tx-14"
                  >Adjuntar Proformas (Solo para montos mayores a S/.100)</label
                ><br />
                <div class="signup-separator"></div>

                <button
                  type="button"
                  @click="openModalUpload()"
                  class="btn btn-outline-primary btn-sm mb-4"
                >
                  <i class="fas fa-plus"></i> Adjuntar proformas(3)
                </button>

                <div
                  id="accordion"
                  class="accordion-one"
                  role="tablist"
                  aria-multiselectable="true"
                >
                  <Acordion
                    :id="index"
                    v-for="(file, index) in files_details"
                    :key="index"
                    :src="file"
                  >
                    {{ file }}
                  </Acordion>
                </div>
              </div>
              <!-- col -->
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
            <a
              href="#next"
              @click="next_step"
              v-show="step < 2"
              >Siguiente</a
            >
          </li>
          <li v-show="step == 2">
            <a href="#finish">Finalizar</a>
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

    <modal-section maxWidth="lg" @submitted="savePdfsProformas">
      <template #title> Adjuntar Archivos </template>
      <template #body>
        <p class="mg-b-5">
          Debe seleccionar mínimo 3 proformas y adjuntarlas a la solicitud del
          Pedido, se aceptan solo archivos pdfs.
        </p>
        <file-pond-demo @changeFile="addFilesToProformas"></file-pond-demo>
      </template>
      <template #footer>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">
          Cancelar
        </button>
        <button
          type="submit"
          class="btn btn-primary"
          :disabled="files_proformas.length == 0"
          @click="savePdfsProformas"
        >
          <loader-up v-show="isUpLoading"></loader-up>
          Adjuntar
        </button>
      </template>
    </modal-section>
  </div>
</template>
<script>
import vSelect from "vue-select";
import InfoCompany from "../components/Empresa.vue";
import ModalSection from "../components/ModalSection.vue";
import Acordion from "../components/Acordion.vue";
import FilePondDemo from "../components/FilePond.vue";
import LoaderUp from "../components/LoaderAction.vue";
import moment from "moment";
import DialogDrag from "vue-dialog-drag";
import DataTable from "vue-materialize-datatable";

export default {
  props: ["empleado"],
  components: {
    vSelect,
    DialogDrag,
    InfoCompany,
    Acordion,
    FilePondDemo,
    LoaderUp,
    ModalSection,
    DataTable,
  },
  mounted() {
    this.fetchOptions();
  },

  data() {
    return {
      step: 0,
      proveedor: "",
      solicitud: {
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
      keyProveedor: "",
      infoProveedor: {},
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
      files_proformas: [],
      files_details: [],
      isUpLoading: false,
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
      if (this.solicitud.fFinal) {
        return moment(this.solicitud.fFinal).format("LLLL");
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
    addFilesToProformas(values) {
      this.files_proformas = values;
    },

    savePdfsProformas() {
      this.isUpLoading = true;
      let fields = new FormData();
      for (let i = 0; i < this.files_proformas.length; i++) {
        let file = this.files_proformas[i].file;
        fields.append("files[" + i + "]", file);
      }
      const config = {
        headers: { "content-type": "multipart/form-data" },
      };
      axios
        .post("/api/savesPdfsProforma", fields, config)
        .then((res) => {
          this.files_details = res.data;
          this.isUpLoading = false;
          $("#exampleModal").modal("hide");
        })
        .catch((err) => {
          console.log(err);
        });
    },

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
      axios.get("/api/dataProviders").then((res) => {
        // Update options
        el.providers_data = res.data;
      });
    },

    fetchInfoProvider() {
      var el = this;

      axios.get("/api/provider/" + this.keyProveedor).then((res) => {
        // Update options
        el.infoProveedor = res.data;
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
      console.log(row);
      if (e.target.checked == true) {
        let fila = {
          idProducto: row.id,
          image: "",
          producto: row.product,
          precio: row.precioC,
          cantidad: 1,
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

    openModalUpload() {
      $("#exampleModal").modal("show");
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
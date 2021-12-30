<template>
  <div class="section-wrapper">
    <div class="form-layout">
      <div class="invoice-header mg-b-25">
        <div class="justify-content-end">
          <h1 class="invoice-title">Pedido</h1>
          <div class="form-layout form-layout-6">
            <div class="row no-gutter mt-1">
              <div class="col-5 col-sm-4">Nro.</div>
              <div class="col-7 col-sm-8">
                <input
                  type="text"
                  v-model="nroPedido"
                  placeholder="ejm. 110023"
                  class="form-control"
                />
              </div>
            </div>
          </div>
        </div>
        <div class="billed-from">
          <h6>COMERCIAL EL VALLE S.A.C.</h6>
          <p>
            Jr. La Victoria NRO. 704 <br />
            930154994 <br />
            Email: cvalleg@gmail.com
          </p>
        </div>
      </div>

      <div class="row mg-b-25">
        <div class="col-lg-5">
          <label class="section-label-sm tx-gray-500"
            >Seleccione productos y/o Servicios</label
          >
          <div class="signup-separator"></div>
          <!-- agregar nuevo producto -->
          <button-detail> Agregar nuevo item </button-detail>
        </div>

        <div class="col-lg-3"></div>
        <div class="col-lg-4">
          <input-date></input-date>
        </div>
        <!-- col-4 -->
      </div>
      <!-- row -->

      <!-- table responsivo detalle -->
      <label class="section-label-sm tx-gray-500"
        >Detalle de los productos seleccionados</label
      >
      <div class="signup-separator"></div>
      <div class="table-responsive">
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
                    (details[index].precio * details[index].cantidad) | money
                  }}
                </td>
              </tr>
            </template>
            <tr v-else>
              <td class="text-center valign-middle tx-bold tx-12" colspan="7">
                Seleccione un producto!!
              </td>
            </tr>

            <tr>
              <td colspan="4" rowspan="4" class="valign-middle">
                <div class="invoice-notes">
                  <label class="section-label-sm tx-gray-500"
                    >Notas <i class="far fa-question-circle text-success"></i
                  ></label>
                  <textarea
                    v-model="pedido.notas"
                    class="form-control"
                  ></textarea>
                  <small
                    >Utiliza las notas para agregar información
                    importante.</small
                  >
                </div>
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
        <div class="invalid-feedback" v-if="errors && errors.detalle">
          {{ errors.detalle[0] }}
        </div>
      </div>

      <div class="form-layout-footer">
        <button
          class="btn btn-primary bd-0"
          :disabled="details.length == 0"
          @click="savePedidos"
        >
          <Loading v-show="isLoading" />
          Guardar Pedido
        </button>
        <button class="btn btn-secondary bd-0">Cancelar</button>
      </div>
      <!-- form-layout-footer -->
    </div>
    <!-- form-layout -->

    <modal-section maxWidth="lg">
      <template #title> Adjuntar Archivos </template>
      <template #body>
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
          <th slot="thead-tr"></th>
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
      </template>
      <template #footer>
        <button type="button" data-dismiss="modal" class="btn btn-primary">
          Aceptar
        </button>
      </template>
    </modal-section>
  </div>
  <!-- section-wrapper -->
</template>
<script>
import InfoCompany from "../components/Empresa.vue";
import ModalSection from "../components/ModalSection.vue";
import ButtonDetail from "../components/ButtonDetail.vue";
import Loading from "../components/LoaderAction.vue";
import DataTable from "vue-materialize-datatable";
import InputDate from "../components/InputGroupDate.vue";

export default {
  name: "Pedidos",

  components: {
    InfoCompany,
    Loading,
    ModalSection,
    ButtonDetail,
    DataTable,
    InputDate,
  },

  mounted() {
    this.loadData();
  },

  data() {
    return {
      nroPedido: "",
      details: [],
      igv: 0.18,
      descuento: "0",
      pedido: {
        detalle: [],
        total: 0,
        notas: "",
      },
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
    async loadData() {
      console.time("loop-timer");
      const content = await Promise.all([
        this.getProducts(),
        this.getNroPedido(),
      ]);
      console.timeEnd("loop-timer");
      return ([this.products, this.nroPedido] = content);
    },

    getProducts() {
      return axios
        .get("/api/products/proforma")
        .then((response) => response.data);
      // this.products = res.data;
    },

    getNroPedido() {
      return axios
        .get("/api/pedidos/number")
        .then((response) => "0000" + response.data.max);
      // this.nroPedido = "0000" + res.data.max;
    },

    addProductToDetails(row, e) {
      if (e.target.checked == true) {
        let fila = {
          idProducto: row.id,
          image: "",
          producto: row.product,
          precio: row.precioC,
          cantidad: 1,
          descuento: 0,
          medida: row.measure,
          total: 0,
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

      var i = this.productsDetails.indexOf(key);
      i !== -1 && this.productsDetails.splice(i, 1);
    },

    savePedidos() {
      this.isLoading = true;
      this.pedido.detalle = this.details;
      this.pedido.total = this.total;
      axios
        .post("/pedidos", this.pedido)
        .then((res) => {
          this.$awn.success(res.data);
          this.isLoading = false;
          this.resetFields();
          this.loadData();
        })
        .catch((e) => {
          this.existsErrors(e);
        });
    },

    resetFields() {
      this.details = [];
      this.pedido.detalle = [];
      this.pedido.total = 0;
      this.pedido.notas = "";
      this.productsDetails = [];
    },

    existsErrors(e) {
      if (e.response.status == 422) {
        this.errors = e.response.data.errors;
      } else {
        this.$awn.alert("Ha ocurrido un error!.");
      }
      this.isLoading = false;
    },
  },
};
</script>
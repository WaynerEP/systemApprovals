<template>
  <div class="section-wrapper">
    <div class="form-layout">
      <div class="invoice-header mg-b-25">
        <header-invoice>
          <template #title> PEDIDO </template>
          <template #input>
            <input
              type="text"
              v-model="nroPedido"
              placeholder="ejm. 110023"
              class="form-control"
            />
          </template>
        </header-invoice>
        <info-company></info-company>
      </div>

      <div class="row mg-b-25">
        <div class="col-lg-5">
          <section-label>Seleccione productos y/o Servicios</section-label>
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
      <section-label>Detalle de los productos seleccionados</section-label>
      <div class="signup-separator"></div>
      <table-invoice>
        <template #thead>
          <th></th>
          <th></th>
          <th class="wd-30p">Concepto</th>
          <th>Cantidad</th>
          <th>Precio Compra.</th>
          <th>Medida</th>
          <th class="wd-15p">Precio Total</th>
        </template>
        <template #tbody>
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
                {{ (details[index].precio * details[index].cantidad) | money }}
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
                  >Utiliza las notas para agregar información importante.</small
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
        </template>
        <div class="invalid-feedback d-block" v-if="errors && errors.detalle">
          {{ errors.detalle[0] }}
        </div>
      </table-invoice>

      <div class="form-layout-footer">
        <button
          class="btn btn-info bd-0"
          :disabled="details.length == 0"
          @click="savePedidos"
        >
          <Loading v-show="isLoading" />
          Guardar Pedido
        </button>
        <button class="btn btn-secondary bd-0" @click="resetFields">Cancelar</button>
      </div>
      <!-- form-layout-footer -->
    </div>
    <!-- form-layout -->

    <modal-section maxWidth="lg">
      <template #title> Seleccionar Productos </template>
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
        <button type="button" data-dismiss="modal" class="btn btn-info">
          Aceptar
        </button>
      </template>
    </modal-section>
    <!-- Modal section  -->
  </div>
  <!-- section-wrapper -->
</template>
<script>
import InfoCompany from "../components/Empresa.vue";
import ModalSection from "../components/ModalSection.vue";
import ButtonDetail from "../components/ButtonInvoice.vue";
import DataTable from "vue-materialize-datatable";
import InputDate from "../components/InputGroupDate.vue";
import HeaderInvoice from "../components/HeaderInvoice.vue";
import SectionLabel from "../components/SectionLabel.vue";
import TableInvoice from "../components/TableInvoice.vue";
import Loading from "../components/LoaderAction.vue";

export default {
  name: "Pedidos",

  components: {
    InfoCompany,
    ModalSection,
    ButtonDetail,
    DataTable,
    InputDate,
    HeaderInvoice,
    SectionLabel,
    TableInvoice,
    Loading,
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
      const content = await Promise.all([
        this.getProducts(),
        this.getNroPedido(),
      ]);
      return ([this.products, this.nroPedido] = content);
    },

    getProducts() {
      return axios
        .get("/api/products/proforma")
        .then((response) => response.data);
    },

    getNroPedido() {
      return axios
        .get("/api/pedidos/number")
        .then((response) => "0000" + response.data.max);
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
        (element) => element.idProducto == key
      );
      this.details.splice(index, 1);
      var i = this.productsDetails.indexOf(key);
      i !== -1 && this.productsDetails.splice(i, 1);
    },

    savePedidos() {
      if (this.details.length == 0) {
        $.toast({
          content: "Agregue un productos o servicio.",
        });
        return;
      }
      
      let onOk = () => {
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
      };

      this.$awn.confirm("Estás seguro de guardar el pedido?", onOk);
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
        this.$awn.alert("La acción ha fallado!.");
      }
      this.isLoading = false;
    },
  },
};
</script>
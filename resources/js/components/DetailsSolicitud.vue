<template>
  <div class="table-responsive">
    <table class="table table-invoice table-sm rounded-5">
      <thead class="thead-colored bg-info">
        <tr>
          <th></th>
          <th class="wd-30p">Concepto</th>
          <th>Cantidad</th>
          <th>Medida</th>
          <th>Precio</th>
          <th class="wd-15p">Precio Total</th>
        </tr>
      </thead>
      <tbody>
        <template v-if="details.length > 0">
          <tr v-for="d in details" :key="d.idProducto">
            <td>
              <img
                :src="
                  d.image ? '/' + d.image : 'http://via.placeholder.com/800x533'
                "
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
            <Loader class="tx-info" />
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
          <td class="tx-right tx-uppercase tx-bold tx-inverse tx-12">Total</td>
          <td colspan="2" class="tx-right">
            <h4 class="tx-primary tx-bold tx-lato">
              {{ total | money }}
            </h4>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import Loader from "../components/LoaderAction.vue";

export default {
  components: {
    Loader,
  },

  data() {
    return {
      details: [],
      igv: 0.18,
      descuento: 0,
      isLoading: true,
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
    fetchData(val) {
      this.$awn.async(axios.get("/api/pedidos/detalle/" + val), (resp) => {
        this.details = resp.data;
        this.$awn.success(`Se han cargado ${resp.data.length} registros`);
      });
      $("#exampleModal2").modal("show");
    },
  },
};
</script>
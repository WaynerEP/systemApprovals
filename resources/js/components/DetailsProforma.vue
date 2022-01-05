<template>
  <div>
    <label class="slim-card-title"
      >Proformas para el pedido N°. 000{{ idPedido }}</label
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
            :href="'/showProforma/' + idPedido + '/' + item.archivo"
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
</template>
<script>
import moment from "moment";

export default {
  name: "proformas",

  data() {
    return {
      idPedido: "0",
      detalleProformas: [],
    };
  },
    
  filters: {
    money: function (val) {
      return "S/." + Number.parseFloat(val).toFixed(2);
    },
  },

  methods: {
    formatDateProforma(value) {
      moment.locale("es");
      return moment(value).calendar();
    },
    fetchData(val) {
      axios.get("/api/pedidos/" + val + "/proformas").then((res) => {
        this.detalleProformas = res.data;
      });
    },
  },
};
</script>
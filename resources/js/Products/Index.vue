<template>
  <div class="manager-wrapper">
    <div class="manager-right">
      <div class="row row-sm">
        <div class="col-12" v-if="products.length > 15">
          <p>Current page: {{ currentPage }}</p>
          <v-pagination
            v-model="currentPage"
            :page-count="totalPages"
            :classes="bootstrapPaginationClasses"
          ></v-pagination>
        </div>
        <Loading v-show="this.products.length == 0"></Loading>
        <div
          class="col-sm-6 col-lg-4 my-2"
          v-for="pro in dataPaginate"
          :key="pro.idProducto"
        >
          <div class="card-contact">
            <div class="tx-center">
              <a href=""
                ><img
                  src="http://via.placeholder.com/500x500"
                  class="card-img"
                  alt=""
              /></a>
              <h5 class="mg-t-10 mg-b-5">
                <a href="" class="contact-name">{{
                  pro.descripcionProducto
                }}</a>
              </h5>
              <p>{{ pro.medida }}</p>
              <p class="contact-social">
                <a href=""><i class="fa fa-facebook"></i></a>
                <a href=""><i class="fa fa-twitter"></i></a>
                <a href=""><i class="fa fa-google"></i></a>
              </p>
            </div>
            <!-- tx-center -->

            <p class="contact-item">
              <span
                ><div class="card-pricing">
                  <span>P. Compra</span>
                  <h5>S/ {{ pro.precioC }}</h5>
                </div>
                <!-- card-pricing --></span
              >
              <span
                ><div class="card-pricing">
                  <span>P. Venta</span>
                  <h5>S/ {{ pro.precioV }}</h5>
                </div>
                <!-- card-pricing --></span
              >
            </p>
            <!-- contact-item -->
            <p class="contact-item">
              <span>Stock</span>
              <span>{{ pro.stock }}</span>
            </p>
            <!-- contact-item -->
            <p class="contact-item">
              <a href="">Editar</a>
              <a href="" class="text-danger">Eliminar</a>
            </p>
            <!-- contact-item -->
          </div>
          <!-- card -->
        </div>
        <!-- col -->
        <!-- <div class="col-12" v-if="products.length > 15">
          <p>Current page: {{ currentPage }}</p>
          <v-pagination
            v-model="currentPage"
            :page-count="totalPages"
            :classes="bootstrapPaginationClasses"
            v-on:click="getDataPage()"
          ></v-pagination>
        </div> -->
      </div>
      <!-- row -->
    </div>
    <!-- manager-right -->
    <div class="manager-left">
      <a href="" class="btn btn-contact-new">Add New</a>
      <nav class="nav">
        <a
          class="nav-link"
          :class="isActive == cat.id ? 'active' : ''"
          v-for="cat in categories"
          :key="cat.id"
          @click="getProducts(cat.id)"
        >
          <span>{{ cat.description }}</span>
          <span>{{ cat.amountProduct }}</span>
        </a>
      </nav>
    </div>
    <!-- manager-left -->
  </div>
</template>
<script>
import ModalSection from "../components/ModalSection.vue";
import Loading from "../components/Loader.vue";
import LoaderAction from "../components/LoaderAction.vue";
import vPagination from "vue-plain-pagination";

export default {
  name: "Providers",

  components: {
    ModalSection,
    Loading,
    LoaderAction,
    vPagination,
  },

  mounted() {
    this.getCategories();
    this.getProducts(0);
  },

  data() {
    return {
      categories: [],
      products: [],

      errors: [],
      selected_id: "",

      isLoading: false,

      isNoEmpty: true,
      isActionNew: true,

      isActive: 0,

      //  Para la pagination
      dataPaginate: [],
      itemsPage: 9,
      currentPage: 1,
      bootstrapPaginationClasses: {
        ul: "pagination",
        li: "page-item",
        liActive: "active",
        liDisable: "disabled",
        button: "page-link",
      },
      // paginationAnchorTexts: {
      //   first: "First",
      //   prev: "Previous",
      //   next: "Next",
      //   last: "Last",
      // },
    };
  },

  computed: {
    totalPages() {
      return Math.ceil(this.products.length / this.itemsPage);
    },
  },

  watch: {
    currentPage: function () {
      this.getDataPage();
    },
  },

  methods: {
    async getCategories() {
      const res = await axios.get("/api/dataCategories");
      this.categories = res.data;
      // console.log(this.providers);
      if (res) {
        this.isNoEmpty = false;
      }
    },

    async getProducts(id) {
      this.products = [];
      this.isActive = id;
      const res = await axios.get("/api/dataProducts/" + id);
      this.products = res.data;
      this.getDataPage();
    },

    getDataPage() {
      // this.currentPage = nPage;
      this.dataPaginate = [];
      let begin = this.currentPage * this.itemsPage - this.itemsPage;
      let end = this.currentPage * this.itemsPage;
      this.dataPaginate = this.products.slice(begin, end);
    },

    getPreviousPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
      this.getDataPage(this.currentPage);
    },

    getNextPage() {
      if (this.currentPage < this.totalPages()) {
        this.currentPage++;
      }
      this.getDataPage(this.currentPage);
    },
  },
};
</script>
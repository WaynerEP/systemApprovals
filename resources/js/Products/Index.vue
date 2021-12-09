<template>
  <div class="manager-wrapper">
    <div class="manager-right">
      <div class="row row-sm">
        <Loading v-show="this.isLoading"></Loading>
        <div
          class="col-sm-6 col-lg-4 my-2"
          v-for="pro in products"
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
              <span>Precio Compra</span>
              <span>{{ pro.precioC }}</span>
            </p>
            <!-- contact-item -->
            <p class="contact-item">
              <span>Precio Venta</span>
              <span>{{ pro.precioV }}</span>
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
  <!-- manager-wrapper -->
</template>
<script>
import ModalSection from "../components/ModalSection.vue";
import Loading from "../components/Loader.vue";
import LoaderAction from "../components/LoaderAction.vue";

export default {
  name: "Providers",

  components: {
    ModalSection,
    Loading,
    LoaderAction,
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
    };
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
      this.isLoading = true;
      this.isActive = id;
      const res = await axios.get("/api/dataProducts/" + id);
      this.products = res.data;
      this.isLoading = false;
    },
  },
};
</script>
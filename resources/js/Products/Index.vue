<template>
  <div class="manager-wrapper">
    <div class="manager-right">
      <div class="row" v-show="idCategorie > 0">
        <div class="col-12 d-flex justify-content-end">
          <a
            href="#!"
            @click="editCategorie(categorie)"
            class="btn btn-teal btn-lg mr-2"
            style="
              font-size: 15px;
              padding: 10px;
              margin-bottom: 21px;
              color: #fff;
            "
            >Editar Categoria</a
          >
          <a
            href="#!"
            @click="dropCategorie(idCategorie)"
            class="btn btn-danger btn-lg"
            style="font-size: 15px; padding: 10px; margin-bottom: 21px"
            >Eliminar Categoria</a
          >
        </div>
      </div>
      <div class="row row-sm">
        <Loading v-show="this.dataPaginate.length == 0"></Loading>
        <div
          class="col-sm-6 col-lg-4 mb-3"
          v-for="pro in dataPaginate"
          :key="pro.idProducto"
        >
          <div class="card-contact border-white">
            <div class="tx-center">
              <a href="#!">
                <img
                  :src="
                    pro.image ? pro.image : 'http://via.placeholder.com/200x200'
                  "
                  class="card-img wd-120 ht-120"
                  alt="product"
                />
              </a>
              <h5 class="mg-t-10 mg-b-5">
                <p class="contact-name">{{ pro.descripcionProducto }}</p>
              </h5>
              <!-- <p>{{ pro.medida }}</p> -->
              <i class="fa fa-star text-warning"></i>
              <i class="fa fa-star text-warning"></i>
              <i class="fa fa-star text-warning"></i>
              <i class="fa fa-star text-warning"></i>
            </div>
            <br />
            <!-- tx-center -->

            <p class="contact-item">
              <span
                ><div class="card-pricing">
                  <span>Precio</span>
                  <h5>S/ {{ pro.precioC }}</h5>
                </div>
                <!-- card-pricing --></span
              >
              <span
                ><div class="card-pricing">
                  <span>Stock</span>
                  <h5>{{ pro.stock }}</h5>
                </div>
                <!-- card-pricing --></span
              >
            </p>
            <!-- contact-item -->
            <p class="contact-item">
              <a href="#!" @click="editProduct(pro)">Editar</a>
              <a
                href="#!"
                @click="deleteProduct(pro.idProducto)"
                class="text-danger"
                >Eliminar</a
              >
            </p>
            <!-- contact-item -->
          </div>
          <!-- card -->
        </div>
        <div
          class="col-12 d-flex justify-content-center mt-3"
          v-if="products.length > 15"
        >
          <v-pagination
            v-model="currentPage"
            :page-count="totalPages"
            :classes="bootstrapPaginationClasses"
          ></v-pagination>
        </div>
      </div>
      <!-- row -->
    </div>
    <!-- manager-right -->
    <div class="manager-left">
      <a
        @click="openModal()"
        href=""
        class="btn btn-contact-new"
        data-toggle="modal"
        data-target="#exampleModal"
        >Agregar Producto</a
      >

      <nav class="nav">
        <a
          class="nav-link"
          :class="isActive == cat.id ? 'active' : ''"
          v-for="cat in categories"
          :key="cat.id"
          @click="getProducts(cat.id)"
          v-show="cat.amountProduct > 0"
        >
          <span>{{ cat.description }}</span>
          <span>{{ cat.amountProduct }}</span>
        </a>
      </nav>

      <a
        href=""
        @click="openModalCategorie()"
        class="btn btn-purple btn-block mt-3"
        style="font-size: 15px; padding: 10px"
        data-toggle="modal"
        data-target="#exampleModal1"
        >Agregar Categoria</a
      >
    </div>
    <!-- manager-left -->
    <!-- Aquí está el formulario para productos-->
    <modal-section maxWidth="lg" @submitted="store" @close="resetForm()">
      <template #title>
        {{ isActionNew ? "Nuevo Producto" : "Actualizar Producto" }}
      </template>
      <template #body>
        <div class="form-layout">
          <div class="row">
            <div class="col-3 a-10">
              <file-pond
                styleLayout="compact circle"
                fileTypes="image/png, image/jpeg, image/gif"
                :myFiles="myFiles"
                @changeFile="changeImageProduct"
                classes="wd-150 ht-150"
                ref="filePondComponente"
              ></file-pond>
            </div>
            <div class="col-9">
              <div class="row">
                <div class="col-8 form-group">
                  <label
                    class="form-control-label"
                    for="inputDescriptionProduct"
                    >Nombre del producto <span class="tx-danger">*</span></label
                  >
                  <input
                    type="text"
                    v-model="product.descriptionProduct"
                    class="form-control"
                    maxlength="100"
                    id="inputDescriptionProduct"
                    placeholder="Ingrese nombre de producto"
                    :class="{
                      'is-invalid': errors && errors.descriptionProduct,
                    }"
                  />
                  <div
                    class="invalid-feedback"
                    role="alert"
                    v-if="errors && errors.descriptionProduct"
                  >
                    {{ errors.descriptionProduct[0] }}
                  </div>
                </div>
                <div class="col-4">
                  <label class="form-control-label" for="inputMeasure"
                    >Medida <span class="tx-danger">*</span>
                  </label>
                  <input
                    type="text"
                    v-model="product.measure"
                    class="form-control"
                    maxlength="20"
                    id="inputMeasure"
                    placeholder="Ingrese medida"
                    :class="{
                      'is-invalid': errors && errors.measure,
                    }"
                  />
                  <div
                    class="invalid-feedback"
                    role="alert"
                    v-if="errors && errors.measure"
                  >
                    {{ errors.measure[0] }}
                  </div>
                </div>
                <div class="col-5">
                  <label class="form-control-label" for="inputCategorie"
                    >Categoria <span class="tx-danger">*</span>
                  </label>
                  <select
                    id="inputCategorie"
                    v-model="product.type"
                    class="form-control"
                    :class="{ 'is-invalid': errors && errors.type }"
                  >
                    <option value="">Seleccione...</option>
                    <option
                      :value="cat.id"
                      v-for="cat in newCategories"
                      :key="cat.id"
                    >
                      {{ cat.description }}
                    </option>
                  </select>
                  <div
                    class="invalid-feedback"
                    role="alert"
                    v-if="errors && errors.type"
                  >
                    {{ errors.type[0] }}
                  </div>
                </div>
                <div class="col-4">
                  <label class="form-control-label" for="inputPriceC"
                    >Precio de compra <span class="tx-danger">*</span>
                  </label>
                  <input
                    type="number"
                    v-model="product.price"
                    class="form-control"
                    step="0.01"
                    id="inputPriceC"
                    pattern="/^-?\d+\.?\d*$/"
                    onKeyPress="if(this.value.length==6) return false;"
                    placeholder="0.00"
                    min="0"
                    :class="{
                      'is-invalid': errors && errors.price,
                    }"
                  />
                  <div
                    class="invalid-feedback"
                    role="alert"
                    v-if="errors && errors.price"
                  >
                    {{ errors.price[0] }}
                  </div>
                </div>
                <div class="col-3">
                  <label class="form-control-label" for="inputStock"
                    >Cantidad <span class="tx-danger">*</span>
                  </label>
                  <input
                    type="number"
                    v-model="product.stock"
                    class="form-control"
                    maxlength="20"
                    id="inputStock"
                    placeholder="1"
                    :class="{
                      'is-invalid': errors && errors.stock,
                    }"
                  />
                  <div
                    class="invalid-feedback"
                    role="alert"
                    v-if="errors && errors.stock"
                  >
                    {{ errors.stock[0] }}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </template>
      <template #footer>
        <button
          type="button"
          class="btn btn-pink btn-oblong"
          data-dismiss="modal"
          @click="resetForm()"
        >
          Cancelar
        </button>
        <button
          type="submit"
          class="btn btn-oblong"
          :class="{ 'btn-teal': isActionNew, 'btn-info': !isActionNew }"
        >
          <loader-action v-show="isLoading"></loader-action>
          Guardar
        </button>
      </template>
    </modal-section>
    <!-- Cierre de formulario -->

    <!-- Aquí está el formulario para categorias -->
    <modal-section
      id="exampleModal1"
      @submitted="storeCategorie"
      @close="resetFormCategorie()"
    >
      <template #title>
        {{ isActionNew ? "Nueva Categoria" : "Actualizar Categoria" }}
      </template>
      <template #body>
        <div class="form-layout">
          <div class="row">
            <div class="col-12">
              <label class="form-control-label" for="inputCategorie"
                >Categoria <span class="tx-danger">*</span>
              </label>
              <input
                type="text"
                v-model="categorie.descriptionCategorie"
                class="form-control"
                maxlength="100"
                id="inputCategorie"
                placeholder="Ingrese categoria"
                :class="{
                  'is-invalid': errors && errors.descriptionCategorie,
                }"
              />
              <div
                class="invalid-feedback"
                role="alert"
                v-if="errors && errors.descriptionCategorie"
              >
                {{ errors.descriptionCategorie[0] }}
              </div>
            </div>
          </div>
        </div>
      </template>
      <template #footer>
        <button
          type="button"
          class="btn btn-pink btn-oblong"
          data-dismiss="modal"
          @click="resetFormCategorie()"
        >
          Cancelar
        </button>
        <button
          type="submit"
          class="btn btn-oblong"
          :class="{ 'btn-teal': isActionNew, 'btn-info': !isActionNew }"
        >
          <loader-action v-show="isLoading"></loader-action>
          Guardar
        </button>
      </template>
    </modal-section>
    <!-- Cierre de formulario -->
  </div>
</template>
<script>
import FilePond from "../components/FilePond.vue";
import ModalSection from "../components/ModalSection.vue";
import Loading from "../components/Loader.vue";
import LoaderAction from "../components/LoaderAction.vue";
import vPagination from "vue-plain-pagination";

export default {
  name: "Products",

  components: {
    ModalSection,
    Loading,
    LoaderAction,
    vPagination,
    FilePond,
  },

  mounted() {
    this.getCategories();
    this.getProducts(0);
  },

  data() {
    return {
      myFiles: [],
      categories: [],
      newCategories: [],
      products: [],

      product: {
        descriptionProduct: "",
        type: "",
        measure: "",
        price: "",
        stock: "",
        status: "1",
        image: "",
      },

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

      // Para categorias
      idCategorie: "",
      categorie: {
        descriptionCategorie: "",
      },
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
      this.newCategories = this.categories.slice(1);
      if (res) {
        this.isNoEmpty = false;
      }
    },

    async getProducts(id) {
      this.dataPaginate = [];
      this.isActive = id;
      const res = await axios.get("/api/dataProducts/" + id);
      this.products = res.data;
      this.currentPage = 1;
      this.idCategorie = id;
      if (id > 0) {
        this.categorie.descriptionCategorie = this.categories[id].description;
      }
      this.getDataPage();
    },

    getDataPage() {
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
    // Para el modal productos
    openModal() {
      this.resetForm();
      this.getCategories();
    },

    store() {
      // Save Element
      if (this.isActionNew) {
        if (!this.product.image) {
          $.toast({
            content: "Complete los campos.",
          });
          return;
        }
        let fields = new FormData();
        fields.append("fileImage", this.product.image);
        fields.append("descriptionProduct", this.product.descriptionProduct);
        fields.append("type", this.product.type);
        fields.append("measure", this.product.measure);
        fields.append("price", this.product.price);
        fields.append("stock", this.product.stock);
        fields.append("status", this.product.status);

        // Una vez agregado lo enviamos al backend
        axios
          .post("/products/", fields)
          .then((res) => {
            $("#exampleModal").modal("hide");
            this.getCategories();
            this.getProducts(0);
            this.$awn.success(res.data);
            this.isLoading = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      } else {
        this.isLoading = true;
        // console.log(this.product);
        if (!this.product.image) {
          $.toast({
            content: "Complete los campos.",
          });
          return;
        }

        let data = new FormData();
        data.append("fileImage", this.product.image);
        data.append("descriptionProduct", this.product.descriptionProduct);
        data.append("type", this.product.type);
        data.append("measure", this.product.measure);
        data.append("price", this.product.price);
        data.append("stock", this.product.stock);
        data.append("status", this.product.status);
        data.append("_method", "put");

        const config = {
          headers: { "content-type": "multipart/form-data" },
        };

        axios
          .post("/products/" + this.selected_id, data, config)
          .then((res) => {
            this.getCategories();
            this.getProducts(0);
            $("#exampleModal").modal("hide");
            this.$awn.success(res.data);
            console.log(res.data);
            this.isLoading = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      }
    },

    editProduct(data) {
      $("#exampleModal").modal("show");

      this.errors = [];
      this.isActionNew = false; //Aquí
      this.isLoading = false;
      this.product.descriptionProduct = data.descripcionProducto;
      this.product.measure = data.medida;
      this.product.price = data.precioC;
      this.product.stock = data.stock;
      this.product.type = data.idTipo;
      if (data.image) {
        this.myFiles.push(data.image);
        console.log(this.myFiles);
      }

      this.selected_id = data.idProducto;
    },

    deleteProduct(id) {
      let onOk = () => {
        axios
          .delete("/products/" + id)
          .then((res) => {
            this.getCategories();
            this.getProducts(0);
            this.$awn.info(res.data);
          })
          .catch((e) => {
            this.$awn.alert("Algo salió mal!.");
            console.log(e);
          });
      };

      this.$awn.confirm("Estás seguro de eliminar?", onOk);
    },

    existsErrors(e) {
      if (e.response.status === 422) {
        this.errors = e.response.data.errors;
      } else {
        this.$awn.alert("La acción ha fallado!.");
      }
      this.isLoading = false;
    },

    resetForm() {
      this.isLoading = false;
      this.isActionNew = true;
      this.errors = [];
      this.myfiles = [];
      this.product.descriptionProduct = "";
      this.product.measure = "";
      this.product.image = "";
      this.product.price = "";
      this.product.stock = "";
      this.product.type = "";
      this.product.status = "1";
      this.product.image = "";
      this.$refs.filePondComponente.removeFiles();
      this.myFiles = [];
      this.selected_id = "";
    },

    // Aquí vamos a agregar las imagénes
    changeImageProduct(val) {
      console.log(val);
      if (val.length > 0) {
        this.product.image = val[0].file;
      } else {
        this.product.image = "";
      }
    },

    // Aquí están todos los métodos de las categorias
    openModalCategorie() {
      this.resetFormCategorie();
    },
    resetFormCategorie() {
      this.isLoading = false;
      this.isActionNew = true;
      this.errors = [];
    },

    storeCategorie() {
      // console.log(this.categorie);
      if (this.isActionNew) {
        this.isLoading = true;
        axios
          .post("/categorie/", this.categorie)
          .then((res) => {
            $("#exampleModal1").modal("hide");
            this.getCategories();
            this.getProducts(0);
            this.$awn.success(res.data);
            this.isLoading = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      } else {
        axios
          .put("/categorie/" + this.idCategorie, this.categorie)
          .then((res) => {
            this.getCategories();
            this.getProducts(0);
            $("#exampleModal1").modal("hide");
            this.$awn.success(res.data);
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      }
    },

    editCategorie(data) {
      $("#exampleModal1").modal("show");
      this.errors = [];
      this.isActionNew = false; //Aquí
      this.isLoading = false;
      this.categorie.descriptionCategorie = data.descriptionCategorie;
    },

    dropCategorie(id) {
      let onOk = () => {
        axios
          .delete("/categorie/" + id)
          .then((res) => {
            console.log(res.data);
            this.getCategories();
            this.getProducts(0);
            this.$awn.info(res.data);
          })
          .catch((e) => {
            this.$awn.alert("Algo salió mal!.");
            console.log(e);
          });
      };

      this.$awn.confirm(
        "¿Estás seguro de eliminar?, recuerda que se eliminarán todos los productos de está categoria",
        onOk
      );
    },
  },
};
</script>
<template>
  <div class="row">
    <div class="col-12">
      <a
        @click="openModal()"
        href=""
        class="btn btn-outline-primary"
        data-toggle="modal"
        data-target="#exampleModal"
      >
        <i class="fa fa-plus"></i>
        Agregar
      </a>
    </div>
    <div
      class="col-md-4 mt-4 mg-md-t-0"
      v-for="pros in providers"
      :key="pros.keyPro"
    >
      <div class="card bg-primary tx-white bd-0">
        <div
          class="card-header"
          style="
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ15wheMNG9n-yZ2CSzTD0Gu0KR0oAsmi3iQ&usqp=CAU');
            height: 160px;
          "
        >
          <!-- <h5 class="card-title tx-black tx-medium border">
            {{ "Title" }}
          </h5> -->
        </div>
        <div class="card-body">
          <p class="card-subtitle tx-normal tx-white-8 mg-b-15">
            Representante: {{ pros.names }}
          </p>
          <p class="card-text">Razón Social: {{ pros.businessName }}</p>
          <a
            href="#"
            class="card-link tx-white-7 hover-white"
            @click="editProvider(pros)"
            >Editar</a
          >
          <a
            href="#"
            class="card-link tx-white-7 hover-white"
            :disabled="pros.status == 0"
            @click="deleteProvider(pros.keyPro)"
            >Eliminar</a
          >
        </div>
      </div>
      <!-- card -->
    </div>
    <!-- col -->
    <modal-section @submitted="store" @close="resetForm()">
      <template #title>
        {{ isActionNew ? "Nuevo Proveedor" : "Actualizar Proveedor" }}
      </template>
      <template #body>
        <div class="form-group">
          <label class="form-control-label" for="inputProvider"
            >Persona/Proveedor</label
          >
          <select
            id="inputProvider"
            v-model="proveedor.provider"
            class="form-control"
            :class="{ 'is-invalid': errors && errors.provider }"
          >
            <template v-if="isActionNew">
              <option value="">Seleccione...</option>
              <option
                :value="pro.dni"
                v-for="pro in providersNew"
                :key="pro.dni"
              >
                {{ pro.names }}
              </option>
            </template>
            <template v-else>
              <option
                :value="pro.dni"
                v-for="pro in providers"
                :key="pro.dni"
                disabled
              >
                {{ pro.names }}
              </option>
            </template>
          </select>
          <div
            class="invalid-feedback d-block"
            role="alert"
            v-if="errors && errors.provider"
          >
            {{ errors.provider[0] }}
          </div>
        </div>
        <div class="form-group">
          <label class="form-control-label" for="inputBusinessName"
            >Razón Social</label
          >
          <input
            type="text"
            v-model="proveedor.businessName"
            class="form-control"
            id="inputBusinessName"
            placeholder="Razón Social"
            :class="{ 'is-invalid': errors && errors.businessName }"
          />
          <div class="invalid-feedback" v-if="errors && errors.businessName">
            {{ errors.businessName[0] }}
          </div>
        </div>
        <small>
          Nota: Ingrese la razón social de la empresa y su representante de la
          misma.
        </small>
      </template>
      <template #footer>
        <button
          type="button"
          class="btn btn-pink"
          data-dismiss="modal"
          @click="resetForm()"
        >
          Cancelar
        </button>
        <button
          type="submit"
          class="btn"
          :class="{ 'btn-teal': isActionNew, 'btn-info': !isActionNew }"
        >
          <loader-action v-show="isLoading"></loader-action>
          Guardar
        </button>
      </template>
    </modal-section>
  </div>
  <!-- row -->
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
    this.getProviders();
  },

  data() {
    return {
      providers: [],
      providersNew: [],
      proveedor: {
        provider: "",
        businessName: "",
        status: "1",
      },
      errors: [],
      selected_id: "",
      isLoading: false,
      isNoEmpty: true,
      isActionNew: true,
    };
  },

  methods: {
    async getProviders() {
      const res = await axios.get("/api/dataProviders");
      this.providers = res.data;
      // console.log(this.providers);
      if (res) {
        this.isNoEmpty = false;
      }
    },
    openModal() {
      this.resetForm();
      this.getProvidersNew();
    },
    async getProvidersNew() {
      const res = await axios.get("/api/dataProvidersNew");
      this.providersNew = res.data;
      // console.log(this.providers);
      if (res) {
        this.isNoEmpty = false;
      }
    },

    store() {
      // Save Element
      if (this.isActionNew) {
        this.isLoading = true;
        // console.log(this.provider);
        axios
          .post("/providers/", this.proveedor)
          .then((res) => {
            $("#exampleModal").modal("hide");
            this.getProviders();
            this.$awn.success(res.data);
            this.isLoading = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      } else {
        this.isLoading = true;
        axios
          .put("/providers/" + this.selected_id, this.proveedor)
          .then((res) => {
            this.getProviders();
            $("#exampleModal").modal("hide");
            this.$awn.success(res.data);
            this.isLoading = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      }
    },
    deleteProvider(id) {
      let onOk = () => {
        axios
          .delete("/providers/" + id)
          .then((res) => {
            this.getProviders();
            console.log(res);
            this.$awn.info(res.data);
          })
          .catch((e) => {
            this.$awn.alert("Algo salió mal!.");
            console.log(e);
          });
      };

      this.$awn.confirm("Estás seguro de eliminar?", onOk);
    },

    editProvider(data) {
      this.errors = [];
      this.isActionNew = false; //Aquí
      this.isLoading = false;
      this.proveedor.provider = data.dni;
      this.proveedor.businessName = data.businessName;
      this.selected_id = data.keyPro;
      $("#inputProvider").prop("disabled", true);
      $("#exampleModal").modal("show");
    },

    existsErrors(e) {
      if (e.response.status === 422) {
        this.errors = e.response.data.errors;
      } else {
        this.$awn.alert("Ha ocurrido un error!.");
      }
      this.isLoading = false;
    },

    resetForm() {
      this.isLoading = false;
      this.isActionNew = true;
      this.proveedor.provider = "";
      this.proveedor.businessName = "";
      this.proveedor.status = "1";
      this.errors = [];
      $("#inputProvider").prop("disabled", false);
    },
  },
};
</script>

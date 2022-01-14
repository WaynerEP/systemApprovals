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
        ></div>
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
    <modal-section maxWidth="lg" @submitted="store" @close="resetForm()">
      <template #title>
        {{ isActionNew ? "Nuevo Proveedor" : "Actualizar Proveedor" }}
      </template>
      <template #body>
        <div class="form-layout mb-2">
          <div class="row">
            <div class="col-3 form-group">
              <label class="form-control-label" for="inputRuc"
                >RUC <span class="tx-danger">*</span></label
              >
              <div class="input-group">
                <div class="input-group-prepend"></div>
                <input
                  type="text"
                  v-model="proveedor.ruc"
                  class="form-control"
                  id="inputRuc"
                  placeholder="RUC"
                  maxlength="11"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :class="{ 'is-invalid': errors && errors.ruc }"
                />
                <!-- @blur="getProvider(proveedor.ruc)" -->

                <a
                  class="btn input-group-text bg-secondary"
                  @click="getProvider(proveedor.ruc)"
                >
                  <i class="icon ion-search tx-16 lh-0 op-6 tx-white"></i>
                </a>
                <div class="invalid-feedback" v-if="errors && errors.ruc">
                  {{ errors.ruc[0] }}
                </div>
              </div>
              <!-- input-group -->
            </div>
            <div class="col-6 form-group">
              <label class="form-control-label" for="inputBusinessName"
                >Razón Social</label
              >
              <input
                type="text"
                v-model="proveedor.businessName"
                class="form-control"
                id="inputBusinessName"
                placeholder="Razón Social"
                readonly
                :class="{ 'is-invalid': errors && errors.businessName }"
              />
              <div
                class="invalid-feedback"
                v-if="errors && errors.businessName"
              >
                {{ errors.businessName[0] }}
              </div>
            </div>
            <div class="col-3 form-group">
              <label class="form-control-label" for="inputCountry"
                >País <span class="tx-danger">*</span></label
              >
              <select
                id="inputCountry"
                v-model="proveedor.country"
                class="form-control"
                :class="{ 'is-invalid': errors && errors.country }"
              >
                <option value="">Seleccione...</option>
                <option :value="p.name" v-for="p in countries" :key="p.id">
                  {{ p.name }}
                </option>
              </select>
              <div class="invalid-feedback" v-if="errors && errors.country">
                {{ errors.country[0] }}
              </div>
            </div>
            <div class="col-3 form-group">
              <label class="form-control-label" for="inputCity">Ciudad</label>
              <input
                type="text"
                v-model="proveedor.city"
                class="form-control"
                id="inputCity"
                placeholder="Ciudad"
                readonly
                :class="{ 'is-invalid': errors && errors.city }"
              />
              <div class="invalid-feedback" v-if="errors && errors.city">
                {{ errors.city[0] }}
              </div>
            </div>
            <div class="col-3 form-group">
              <label class="form-control-label" for="inputCodePostal"
                >Código Postal</label
              >
              <input
                type="text"
                v-model="proveedor.codePostal"
                class="form-control"
                id="inputCodePostal"
                placeholder="Código Postal"
                readonly
                :class="{ 'is-invalid': errors && errors.codePostal }"
              />
              <div class="invalid-feedback" v-if="errors && errors.codePostal">
                {{ errors.codePostal[0] }}
              </div>
            </div>
            <div class="col-6 form-group">
              <label class="form-control-label" for="inputAddress"
                >Dirección</label
              >
              <input
                type="text"
                v-model="proveedor.address"
                class="form-control"
                id="inputAddress"
                placeholder="Dirección"
                readonly
                :class="{ 'is-invalid': errors && errors.address }"
              />
              <div class="invalid-feedback" v-if="errors && errors.address">
                {{ errors.address[0] }}
              </div>
            </div>
            <div class="col-2">
              <label class="form-control-label" for="inputPhone"
                >Télefono <span class="tx-danger">*</span></label
              >
              <input
                type="text"
                v-model="proveedor.phone"
                class="form-control"
                id="inputPhone"
                placeholder="Télefono"
                maxlength="9"
                :class="{ 'is-invalid': errors && errors.phone }"
              />
              <div class="invalid-feedback" v-if="errors && errors.phone">
                {{ errors.phone[0] }}
              </div>
            </div>
            <div class="col-5">
              <label class="form-control-label" for="inputEmail">
                Correo Electrónico <span class="tx-danger">*</span>
              </label>
              <input
                type="text"
                v-model="proveedor.email"
                class="form-control"
                id="inputEmail"
                placeholder="Correo Electrónico"
                :class="{ 'is-invalid': errors && errors.email }"
              />
              <div class="invalid-feedback" v-if="errors && errors.email">
                {{ errors.email[0] }}
              </div>
            </div>
            <div class="col-5">
              <label class="form-control-label" for="inputProvider"
                >Representante <span class="tx-danger">*</span></label
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
          </div>
        </div>
        <small>
          <b>Nota:</b> Ingrese el RUC, el país donde labora la empresa y su
          teléfono.
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
        status: "1",
        provider: "",
        businessName: "",
        address: "",
        city: "",
        phone: "",
        codePostal: "",
        email: "",
        country: "",
        ruc: "",
      },

      errors: [],
      selected_id: "",
      isLoading: false,
      isNoEmpty: true,
      isActionNew: true,
      countries: [
        {
          id: 1,
          name: "Argentina",
        },
        {
          id: 2,
          name: "Bolivia",
        },
        {
          id: 3,
          name: "Brasil",
        },
        {
          id: 4,
          name: "Chile",
        },
        {
          id: 5,
          name: "Colombia",
        },
        {
          id: 6,
          name: "Ecuador",
        },
        {
          id: 7,
          name: "España",
        },
        {
          id: 8,
          name: "Estados Unidos",
        },
        {
          id: 9,
          name: "México",
        },
        {
          id: 10,
          name: "Paraguay",
        },
        {
          id: 11,
          name: "Perú",
        },
        {
          id: 12,
          name: "Uruguay",
        },
        {
          id: 13,
          name: "Venezuela",
        },
      ],
    };
  },

  methods: {
    // Trae todos los proveedores si excepción
    async getProviders() {
      const res = await axios.get("/api/dataProviders");
      this.providers = res.data;
      // console.log(this.providers);
      if (res) {
        this.isNoEmpty = false;
      }
    },

    // Trae solo los proveedores nuevos
    async getDelegate() {
      const res = await axios.get("/api/dataProvidersNew");
      this.providersNew = res.data;
      // console.log(this.providers);
      if (res) {
        this.isNoEmpty = false;
      }
    },

    async getProvider(ruc) {
      if (ruc.length < 11) {
        this.$awn.alert("Ingrese el ruc completo.", {
          durations: { success: 2000 },
        });
        this.resetForm();
      } else {
        // let
        const token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImtwZXJlemVzcGlAZ21haWwuY29tIn0.e0H9C9yn95TQXyLjocE4bbW11RbxAmiLEbGRTwWQaeI";
        this.$awn.async(
          axios.get(
            `https://dniruc.apisperu.com/api/v1/ruc/${ruc}?token=${token}`
          ),
          (res) => {
            if (res.data.direccion || res.data.capital || res.data.ubigeo) {
              this.$awn.success("La acción ha sido exitosa.");
              this.proveedor.businessName = res.data.razonSocial;
              this.proveedor.address = res.data.direccion;
              this.proveedor.city = res.data.capital;
              this.proveedor.codePostal = res.data.ubigeo;
            } else {
              this.resetForm();
              this.$awn.warning("Datos obtenidos imcompletos.");
            }
          },
          (err) =>
            this.$awn.alert(
              `La API respondió con el código: ${err.response.status}`
            )
        );
      }
    },

    openModal() {
      this.resetForm();
      this.getDelegate();
    },

    store() {
      // Save Element
      if (this.isActionNew) {
        this.isLoading = true;
        axios
          .post("/providers/", this.proveedor)
          .then((res) => {
            $("#exampleModal").modal("hide");
            this.isLoading = false;
            this.$awn.success(res.data);
            this.getProviders();
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      }
      // else {
      //   this.isLoading = true;
      //   axios
      //     .put("/providers/" + this.selected_id, this.proveedor)
      //     .then((res) => {
      //       this.getProviders();
      //       $("#exampleModal").modal("hide");
      //       this.$awn.success(res.data);
      //       this.isLoading = false;
      //     })
      //     .catch((e) => {
      //       this.existsErrors(e);
      //     });
      // }
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
      $("#exampleModal").modal("show");
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
      this.proveedor.businessName = "";
      this.proveedor.provider = "";
      this.proveedor.address = "";
      this.proveedor.city = "";
      this.proveedor.codePostal = "";
      this.proveedor.phone = "";
      this.proveedor.email = "";
      this.proveedor.ruc = "";
      this.proveedor.country = "";
      this.errors = [];
      $("#inputProvider").prop("disabled", false);
    },
  },
};
</script>
<template>
  <div class="section-wrapper mg-t-20">
    <label class="section-title">FICHA DE DATOS PERSONALES</label>
    <p class="mg-b-20 mg-sm-b-40">Aquí puede editar sus datos personales.</p>

    <form @submit.prevent="updateProfile()" class="form-layout form-layout-2">
      <div class="row no-gutters">
        <div class="col-md-4">
          <div class="form-group">
            <label class="form-control-label"
              >Nombres: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              v-model="user.nombres"
              placeholder="Enter firstname"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.nombres"
            >
              {{ errors.nombres[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-md-4 mg-t--1 mg-md-t-0">
          <div class="form-group mg-md-l--1">
            <label class="form-control-label"
              >Apellidos: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              v-model="user.apellidos"
              placeholder="Enter lastname"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.apellidos"
            >
              {{ errors.apellidos[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-md-4 mg-t--1 mg-md-t-0">
          <div class="form-group mg-md-l--1">
            <label class="form-control-label"
              >Documento: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              v-model="user.dni"
              readonly
              placeholder="Enter document number"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.dni"
            >
              {{ errors.dni[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-md-8">
          <div class="form-group bd-t-0-force">
            <label class="form-control-label"
              >Domicilio actual: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              v-model="user.address"
              placeholder="Enter address"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.address"
            >
              {{ errors.address[0] }}
            </div>
          </div>
        </div>
        <!-- col-8 -->
        <div class="col-md-4">
          <div class="form-group bd-t-0-force">
            <label class="form-control-label"
              >Telefono: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              v-model="user.telefono"
              placeholder="Enter address"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.telefono"
            >
              {{ errors.telefono[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-md-6 mg-t--1 mg-md-t-0">
          <div class="form-group mg-md-l--1">
            <label class="form-control-label"
              >Email: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="email"
              v-model="user.correo"
              placeholder="Enter email address"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.correo"
            >
              {{ errors.correo[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-md-6">
          <div class="form-group mg-md-l--1 bd-t-0-force">
            <label class="form-control-label mg-b-0-force"
              >Sexo: <span class="tx-danger">*</span></label
            >
            <select class="form-control" v-model="user.sexo" required>
              <option value="M">MASCULINO</option>
              <option value="F">FEMENINO</option>
            </select>
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.sexo"
            >
              {{ errors.sexo[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
      </div>
      <!-- row -->
      <div class="form-layout-footer bd pd-20 bd-t-0">
        <button class="btn btn-primary bd-0" type="submit">
          ACTUALIZAR
          <Loading v-show="isLoading" />
        </button>
      </div>
      <!-- form-group -->
    </form>
    <!-- form-layout -->
  </div>
</template>
<script>
import Loading from "../components/LoaderAction.vue";

export default {
  props: {
    user: {
      type: Object,
    },
  },

  components: {
    Loading,
  },

  data() {
    return {
      isLoading: false,
      errors: [],
    };
  },

  methods: {
    updateProfile() {
      this.isLoading = true;
      axios
        .put("/update-profile/" + this.user.dni, this.user)
        .then((res) => {
          this.$awn.info(res.data);
          this.isLoading = false;
        })
        .catch((e) => {
          if (e.response.status == 422) {
            this.errors = e.response.data.errors;
          } else {
            this.$awn.alert("La acción ha fallado!.");
          }
          this.isLoading = false;
        });
    },
  },
};
</script>
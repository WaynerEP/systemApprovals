<template>
  <div class="card card-people-list mg-t-20">
    <div class="slim-card-title">Configuración de la cuenta</div>
    <form @submit.prevent="store()" class="form-layout mg-t-20">
      <div class="row mg-b-25">
        <div class="col-lg-12">
          <div class="form-group">
            <label class="form-control-label"
              >Usuario: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              v-model="user.name"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.name"
            >
              {{ errors.name[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-lg-12">
          <div class="form-group">
            <label class="form-control-label"
              >Email: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="email"
              v-model="user.email"
              readonly
              required
            />
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-lg-12">
          <div class="form-group">
            <label class="form-control-label"
              >Contraseña actual: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="password"
              v-model="usuario.current_password"
              placeholder="Ingrese contraseña"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.current_password"
            >
              {{ errors.current_password[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-lg-12">
          <div class="form-group">
            <label class="form-control-label"
              >Contraseña nueva: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="password"
              v-model="usuario.new_password"
              placeholder="Ingrese contraseña"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.new_password"
            >
              {{ errors.new_password[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-lg-12">
          <div class="form-group">
            <label class="form-control-label"
              >Confirmar contraseña: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="password"
              v-model="usuario.confirm_password"
              placeholder="Confirme su contraseña"
              required
            />
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.confirm_password"
            >
              {{ errors.confirm_password[0] }}
            </div>
          </div>
        </div>
        <!-- col-4 -->
      </div>
      <!-- row -->

      <div class="form-layout-footer">
        <button class="btn btn-primary bd-0" type="submit">
          Actualizar <Loading v-show="isLoading" />
        </button>
      </div>
      <!-- form-layout-footer -->
    </form>
    <form id="form-logut" action="logout" method="POST" style="display: none">
      <input type="hidden" name="_token" :value="csrf" />
    </form>
  </div>
</template>
<script>
import Loading from "../components/LoaderAction.vue";

export default {
  name: "UpdatePasword",

  components: {
    Loading,
  },

  props: ["user"],

  data() {
    return {
      csrf: document
        .querySelector('meta[name="csrf-token"]')
        .getAttribute("content"),
      usuario: {
        name: "",
        current_password: "",
        new_password: "",
        confirm_password: "",
      },
      isLoading: false,
      errors: [],
    };
  },

  methods: {
    store() {
      this.isLoading = true;
      this.usuario.name = this.user.name;
      axios
        .post("/update-password", this.usuario)
        .then((res) => {
          this.isLoading = false;
          this.errors = [];
          this.$awn.info(res.data);
          this.submit();
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

    submit: function () {
      document.getElementById("form-logut").submit();
    },
  },
};
</script>
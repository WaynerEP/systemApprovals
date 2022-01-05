<template>
  <div class="row">
    <template v-if="roles.length > 0">
      <div class="col-md-6 col-lg-3 mb-3" v-for="r in roles" :key="r.id">
        <div class="card card-todo">
          <h6 class="slim-card-title">{{ r.name }}</h6>
        <div class="signup-separator"></div>

          <div class="todo-list">
            <div class="todo-item" v-for="p in r.permissions" :key="p.id">
              <p class="mg-b-0">
                <i class="fa fa-check tx-primary mg-r-8"></i>
                <span class="tx-secondary">{{ p.name }}</span>
              </p>
            </div>
          </div>
          <div class="mt-4">
            <button @click="editForm(r)" class="btn  btn-icon">
              <div class="tx-20">
                <i class="fa fa-pencil"></i>
              </div>
            </button>
            <button class="btn btn-icon">
              <div class="tx-20">
                <i class="fa fa-eye"></i>
              </div>
            </button>
          </div>
        </div>
      </div>
    </template>
    <template v-else>
      <div class="col-12 text-center mt-5">
        <Loading v-if="isNoEmpty"></Loading>
        <p v-else>No se encontraron resultados</p>
      </div>
    </template>

    <div class="col-md-6 col-lg-3 mb-3">
      <div class="card card-todo">
        <div class="card-body">
          <a
            href="#"
            @click="openModal()"
            data-toggle="modal"
            data-target="#exampleModal"
            ><img src="/assets/img/4.png" class="img-fluid" alt="" />
            
            <p class="section-label text-center">Agregar <i class="fa fa-plus"></i></p>
          </a>
        </div>
      </div>
    </div>

    <modal-section @submitted="store" @close="resetForm()" maxWidth="lg">
      <template #title>
        {{ isActionNew ? "Nuevo" : "Actualizar" }}
      </template>
      <template #body>
        <div class="form-group">
          <label class="form-control-label" for="inputAutocomplete"
            >Nombre de Rol <span class="tx-danger">*</span></label
          >
          <input
            type="text"
            v-model="role.name"
            class="form-control"
            :class="{ 'is-invalid': errors && errors.name }"
            id="inputAutocomplete"
            placeholder="Escriba un nombre de rol"
          />
          <div class="invalid-feedback d-block" v-if="errors && errors.name">
            {{ errors.name[0] }}
          </div>
        </div>
        <div class="form-group">
          <label for="">Permisos de rol <span class="tx-danger">*</span></label>
          <div class="form-row">
            <label class="col-sm-4 form-control-label"
              >Acceso de administrador <span class="tx-danger">*</span></label
            >
            <div class="col-sm-8 mg-t-10 mg-sm-t-0">
              <label class="ckbox">
                <input
                  type="checkbox"
                  v-model="checked"
                  id="gridCheck"
                  @change="onChange($event)"
                /><span>Seleccionar todo</span>
              </label>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="" class="form-control-label"
            >Permisos de rol <span class="tx-danger">*</span></label
          >
          <div class="form-group row">
            <div class="col-sm-3" v-for="p in permissions" :key="p.id">
              <label class="ckbox" :for="'gridCheck' + p.id">
                <input
                  type="checkbox"
                  :value="p.id"
                  v-model="role.permissions"
                  :id="'gridCheck' + p.id"
                  :disabled="isCheckedDisabled"
                /><span>{{ p.name }}</span>
              </label>
            </div>
          </div>
          <div
            class="invalid-feedback d-block"
            v-if="errors && errors.permissions"
          >
            {{ errors.permissions[0] }}
          </div>
        </div>
      </template>
      <template #footer>
        <button
          type="button"
          class="btn btn-secondary"
          data-dismiss="modal"
          @click="resetForm()"
        >
          Cancelar
        </button>
        <button
          type="submit"
          class="btn"
          :class="{ 'btn-primary': isActionNew, 'btn-info': !isActionNew }"
        >
          <loader-action v-show="isLoadingSubmit"></loader-action>
          Guardar
        </button>
      </template>
    </modal-section>
  </div>
</template>

<script>
import ModalSection from "../components/ModalSection.vue";
import Loading from "../components/Loader.vue";
import LoaderAction from "../components/LoaderAction.vue";

export default {
  components: {
    ModalSection,
    Loading,
    LoaderAction,
  },

  mounted() {
    this.getRoles();
    this.getPermisos();
  },

  data() {
    return {
      roles: [],
      permissions: [],
      role: {
        name: "",
        permissions: [],
      },
      errors: [],
      selected_id: "",
      isLoadingSubmit: false,
      isNoEmpty: true,
      isActionNew: true,
      checked: "",
      isCheckedDisabled: false,
    };
  },

  methods: {
    async getRoles() {
      const res = await axios.get("/roles/list");
      this.roles = res.data;
      if (res) {
        this.isNoEmpty = false;
      }
    },

    async getPermisos() {
      const res = await axios.get("/roles/permissions");
      this.permissions = res.data;
    },

    onChange(e) {
      if (e.target.checked == true) {
        this.role.permissions = [];
        let size = this.permissions.length;
        this.formPermissions(size, this.permissions);
        this.isCheckedDisabled = true;
      } else {
        this.role.permissions = [];
        this.isCheckedDisabled = false;
      }
    },

    store() {
      // Save Element
      this.isLoadingSubmit = true;
      if (this.isActionNew) {
        axios
          .post("/roles/list/", this.role)
          .then((res) => {
            $("#exampleModal").modal("hide");
            this.getRoles();
            this.$awn.success(res.data);
            this.isLoadingSubmit = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      } else {
        axios
          .put("/roles/list/" + this.selected_id, this.role)
          .then((res) => {
            this.getRoles();
            $("#exampleModal").modal("hide");
            this.isLoadingSubmit = false;
            this.$awn.success(res.data);
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      }
    },

    editForm(data) {
      // const res = await axios.get("/roles/permissions");
      this.errors = [];
      let n = data.permissions.length;
      let size = this.permissions.length;
      if (size == n) {
        this.checked = "checked";
        this.formPermissions(size, this.permissions);
        this.isCheckedDisabled = true;
      } else {
        this.formPermissions(n, data.permissions);
      }
      this.isActionNew = false;
      this.role.name = data.name;
      this.selected_id = data.id;
      $("#exampleModal").modal("show");
    },

    formPermissions(size, data) {
      for (let index = 0; index < size; index++) {
        const element = data[index].id;
        this.role.permissions.push(element);
      }
    },

    openModal() {
      this.resetForm();
    },

    existsErrors(e) {
      if (e.response.status === 422) {
        this.errors = e.response.data.errors;
      } else {
        this.$awn.alert("La acción ha fallado!.");
      }
      this.isLoadingSubmit = false;
    },

    resetForm() {
      this.role.name = "";
      this.checked = false;
      this.isActionNew = true;
      this.isCheckedDisabled = false;
      this.errors = [];
      this.role.permissions = [];
    },
  },
};
</script>
<template>
  <div>
    <div class="card card-table">
      <div
        class="card-header d-flex align-items-center justify-content-between"
      >
        <h6 class="slim-card-title">Lista de Permisos</h6>
        <button
          type="button"
          @click="resetForm"
          class="btn btn-outline-info"
          data-toggle="modal"
          data-target="#exampleModal"
        >
          <i class="fa fa-plus"></i> Agregar
        </button>
      </div>

      <div class="card-body">
        <table-component>
          <template #thead>
            <th>#</th>
            <th>DESCRIPCIÓN</th>
            <th>ACCIONES</th>
          </template>
          <template #tbody>
            <template v-if="permissions.total > 0">
              <tr v-for="u in permissions.data" :key="u.id">
                <td>{{ u.id }}</td>
                <td>
                  {{ u.name }}
                </td>
                <td>
                  <button
                    @click="editPermission(u)"
                    class="btn btn-outline-info btn-sm"
                  >
                    <i class="fa fa-pencil"></i>
                  </button>
                </td>
              </tr>
            </template>
            <template v-else>
              <tr class="text-center">
                <td colspan="3" v-if="isNoEmpty" class="text-info">
                  <Loading></Loading>
                </td>
                <td colspan="3" v-else>No se encontraron resultados!.</td>
              </tr>
            </template>
          </template>
        </table-component>
        <div
          class="
            pagination-wrapper
            flex-md-row flex-column
            justify-content-between
            align-items-center
          "
        >
          <span class="section-label-sm mg-t-20 mg-md-t-0"
            >Mostrando {{ permissions.current_page }} a {{ permissions.to }} de
            {{ permissions.total }} entradas</span
          >
          <div class="d-flex justify-content-between">
            <pagination
              :data="permissions"
              @pagination-change-page="getPermissions"
            ></pagination>
          </div>
        </div>
      </div>
    </div>

    <modal-section @submitted="store" @close="resetForm()" maxWidth="lg">
      <template #title>
        {{ isActionNew ? "Nuevo Permiso" : "Actualizar permiso" }}
      </template>
      <template #body>
        <div class="form-layout">
          <div class="row mg-b-25">
            <div class="col-lg-12">
              <div class="form-group">
                <label for="inputName" class="form-control-label"
                  >Descripción</label
                >
                <input
                  type="text"
                  v-model="permission.permiso"
                  class="form-control"
                  :class="{ 'is-invalid': errors && errors.permiso }"
                  id="inputName"
                  placeholder="Ingrese un permiso"
                />
                <div class="invalid-feedback" v-if="errors && errors.permiso">
                  {{ errors.permiso[0] }}
                </div>
              </div>
            </div>
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
          :class="{ 'btn-info': isActionNew, 'btn-teal': !isActionNew }"
        >
          <Loading v-show="isLoadingSubmit"></Loading>
          Guardar
        </button>
      </template>
    </modal-section>
  </div>
</template>

<script>
import ModalSection from "../components/ModalSection.vue";
import TableComponent from "../components/Table.vue";
import Loading from "../components/LoaderAction.vue";

export default {
  name: "Permissions",

  components: {
    ModalSection,
    TableComponent,
    Loading,
  },

  mounted() {
    this.getPermissions();
  },

  data() {
    return {
      permissions: {},
      paginate: "10",
      permission: {
        permiso: "",
      },
      errors: [],
      selected_id: "",
      isNoEmpty: true,
      isActionNew: true,
      isLoadingSubmit: false,
    };
  },

  methods: {
    async getPermissions(page = 1) {
      const res = await axios.get(
        "/permissions/list?page=" + page + "&paginate=" + this.paginate
      );
      this.permissions = res.data;
      if (res) {
        this.isNoEmpty = false;
      }
    },

    store() {
      // Save Element
      this.isLoadingSubmit = true;
      if (this.isActionNew) {
        axios
          .post("/permissions/list/", this.permission)
          .then((res) => {
            $("#exampleModal").modal("hide");
            this.getPermissions();
            this.$awn.success(res.data);
            this.isLoadingSubmit = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      } else {
        axios
          .put("/permissions/list/" + this.selected_id, this.permission)
          .then((res) => {
            this.getPermissions();
            $("#exampleModal").modal("hide");
            this.$awn.success(res.data);
            this.isLoadingSubmit = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      }
    },

    editPermission(data) {
      this.errors = [];
      this.isActionNew = false;
      this.permission.permiso = data.name;
      this.selected_id = data.id;
      $("#exampleModal").modal("show");
    },

    existsErrors(e) {
      if (e.response.status === 422) {
        this.errors = e.response.data.errors;
      } else {
        this.$awn.alert("La acción ha fallado!.", "OK");
      }
      this.isLoadingSubmit = false;
    },

    resetForm() {
      this.permission.permiso = "";
      this.isActionNew = true;
      this.errors = [];
    },
  },
};
</script>
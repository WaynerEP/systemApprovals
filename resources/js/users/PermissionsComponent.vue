<template>
  <div>
    <div class="card card-table">
      <div
        class="card-header d-flex align-items-center justify-content-between"
      >
        <h6 class="slim-card-title">Lista de Permisos</h6>
        <a
          @click="resetForm"
          href=""
          class="btn btn-outline-primary"
          data-toggle="modal"
          data-target="#exampleModal"
          ><i class="fa fa-plus"></i> Agregar</a
        >
      </div>

      <div class="card-body">
        <table-component size="table-sm">
          <template #thead>
            <th>#</th>
            <th>DESCRIPCIÓN</th>
            <th>ACCIONES</th>
          </template>
          <template #tbody>
            <template v-if="permissions.length > 0">
              <tr v-for="u in permissions" :key="u.id">
                <td>{{ u.id }}</td>
                <td>
                  {{ u.name }}
                </td>
                <td>
                  <button
                    @click="editPermission(u)"
                    class="btn btn-outline-primary btn-sm"
                  >
                    <i class="fa fa-pencil"></i>
                  </button>
                  <!-- <button
                    :disabled="u.status == 0"
                    @click="deletePermission(u.id)"
                    class="btn btn-outline-danger btn-sm"
                  >
                    <i class="fa fa-close"></i>
                  </button> -->
                </td>
              </tr>
            </template>

            <template v-else>
              <tr class="text-center">
                <td colspan="3" v-if="isNoEmpty">
                  <Loading></Loading>
                </td>
                <td colspan="3" v-else>No se encontraron resultados!.</td>
              </tr>
            </template>
          </template>
        </table-component>
      </div>
    </div>

    <modal-section @submitted="store" @close="resetForm()" maxWidth="lg">
      <template #title>
        {{ isActionNew ? "Nuevo" : "Actualizar" }}
      </template>
      <template #body>
        <div class="form-group">
          <label for="inputName" class="form-control-label">Descripción</label>
          <input
            type="text"
            v-model="permission.name"
            class="form-control"
            :class="{ 'is-invalid': errors && errors.name }"
            id="inputName"
            placeholder="Ingrese un permiso"
          />
          <div class="invalid-feedback" v-if="errors && errors.name">
            {{ errors.name[0] }}
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
          <loading-submit v-show="isLoadingSubmit"></loading-submit>
          Guardar
        </button>
      </template>
    </modal-section>
  </div>
</template>

<script>
import ModalSection from "../components/ModalSection.vue";
import TableComponent from "../components/Table.vue";
import Loading from "../components/Loader.vue";
import LoadingSubmit from "../components/LoaderAction.vue";

export default {
  name: "Users",

  components: {
    ModalSection,
    TableComponent,
    LoadingSubmit,
    Loading,
  },

  mounted() {
    this.getPermissions();
  },

  data() {
    return {
      permissions: [],
      permission: {
        name: "",
      },
      errors: [],
      selected_id: "",
      isNoEmpty: true,
      isActionNew: true,
      isLoadingSubmit: false,
    };
  },

  methods: {
    async getPermissions() {
      const res = await axios.get("/permissions/list");
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

    // deletePermission(id) {
    //   let onOk = () => {
    //     axios
    //       .delete("/permissions/list/" + id)
    //       .then((res) => {
    //         this.getUsers();
    //         console.log(res);
    //         this.$awn.info(res.data);
    //       })
    //       .catch((e) => {
    //         this.$awn.alert("Algo salió mal!.");
    //         console.log(e);
    //       });
    //   };

    //   this.$awn.confirm("Estás seguro de eliminar?", onOk);
    // },

    editPermission(data) {
      this.errors = [];
      this.isActionNew = false;
      this.permission.name = data.name;
      this.selected_id = data.id;
      $("#exampleModal").modal("show");
    },

    existsErrors(e) {
      if (e.response.status === 422) {
        this.errors = e.response.data.errors;
      } else {
        this.$awn.alert("Halgo ha salido mal!.", "OK");
      }
      this.isLoadingSubmit = false;
    },
    resetForm() {
      this.permission.name = "";
      this.isActionNew = true;
      this.errors = [];
    },
  },
};
</script>
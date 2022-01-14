<template>
  <div>
    <div class="card card-table">
      <div
        class="card-header d-flex align-items-center justify-content-between"
      >
        <h6 class="slim-card-title">Lista de Usuarios</h6>
        <button
          type="button"
          @click="openModal()"
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
            <th class="pd-y-5"></th>
            <th class="pd-y-5">Usuario</th>
            <th class="pd-y-5">Email</th>
            <th class="pd-y-5">Rol</th>
            <th class="pd-y-5">Estado</th>
            <th class="pd-y-5">Acciones</th>
          </template>
          <template #tbody>
            <template v-if="users.length > 0">
              <tr v-for="u in users" :key="u.id">
                <td class="valign-middle pd-l-20">
                  <img
                    :src="
                      u.avatar ? '/' + u.avatar : '/storage/avatars/user.png'
                    "
                    loading="lazy"
                    class="wd-40 rounded-circle"
                    alt="Image"
                  />
                </td>
                <td class="valign-middle">
                  <span class="tx-medium">
                    {{ u.name }}
                  </span>
                </td>
                <td class="valign-middle">{{ u.email }}</td>
                <td class="valign-middle">
                  <template v-for="r in u.roles">
                    {{ r.name }}
                  </template>
                </td>
                <td class="valign-middle">
                  <span class="tx-success" v-if="u.status == 1"
                    >Habilitado</span
                  >
                  <span class="tx-danger" v-else>Inhabilitado</span>
                </td>
                <td class="valign-middle">
                  <button
                    type="button"
                    @click="editUser(u)"
                    class="btn btn-outline-info btn-sm"
                  >
                    <i class="fa fa-pencil"></i>
                  </button>
                  <button
                    type="button"
                    :disabled="u.status == 0"
                    @click="deleteUser(u.id)"
                    class="btn btn-sm btn-outline-secondary"
                  >
                    <i class="fa fa-close"></i>
                  </button>
                </td>
              </tr>
            </template>

            <template v-else>
              <tr class="text-center">
                <td colspan="8" v-if="isNoEmpty" class="text-info">
                  <Loading></Loading>
                </td>
                <td colspan="8" v-else>No se encontraron resultados!!</td>
              </tr>
            </template>
          </template>
        </table-component>
      </div>
    </div>

    <modal-section maxWidth="lg" @submitted="store" @close="resetForm()">
      <template #title>
        {{ isActionNew ? "Nuevo Usuario" : "Actualizar Usuario" }}
      </template>
      <template #body>
        <div class="form-layout">
          <div class="row mg-b-25">
            <div class="col-lg-6" v-show="isActionNew">
              <div class="form-group">
                <label class="form-control-label"
                  >Empleado: <span class="tx-danger">*</span></label
                >
                <select
                  class="form-control"
                  v-model="user.empleado"
                  :disabled="!isActionNew"
                  :class="{ 'is-invalid': errors && errors.empleado }"
                  @change="selectedPersona(user.empleado)"
                >
                  <option value="">Seleccione</option>
                  <option
                    v-for="employee in employees"
                    :key="employee.codEmpleado"
                    :value="
                      employee.codEmpleado +
                      '_' +
                      employee.dni +
                      '_' +
                      employee.email +
                      '_' +
                      employee.names
                    "
                  >
                    {{ employee.names }}
                  </option>
                </select>
                <div
                  class="invalid-feedback d-block"
                  v-if="errors && errors.empleado"
                >
                  {{ errors.empleado[0] }}
                </div>
              </div>
            </div>
            <!-- col-12 -->
            <div class="col-lg-6">
              <div class="form-group">
                <label class="form-control-label" for="inputUser"
                  >Username: <span class="tx-danger">*</span></label
                >
                <input
                  class="form-control"
                  type="text"
                  id="inputUser"
                  v-model="user.name"
                  :class="{ 'is-invalid': errors && errors.name }"
                  placeholder="Username"
                />
                <div
                  class="invalid-feedback d-block"
                  v-if="errors && errors.name"
                >
                  {{ errors.name[0] }}
                </div>
              </div>
            </div>
            <!-- col-12 -->
            <div class="col-lg-6" v-show="isActionNew">
              <div class="form-group">
                <label class="form-control-label" for="inputDni"
                  >Documento: <span class="tx-danger">*</span></label
                >
                <input
                  type="number"
                  readonly
                  v-model="user.dni"
                  class="form-control bg-white"
                  :class="{ 'is-invalid': errors && errors.dni }"
                  id="inputDni"
                  placeholder="Dni"
                />
                <div class="invalid-feedback" v-if="errors && errors.dni">
                  {{ errors.dni[0] }}
                </div>
              </div>
            </div>
            <!-- col-12 -->
            <div class="col-lg-6">
              <div class="form-group">
                <label class="form-control-label" for="inputEmail"
                  >Email: <span class="tx-danger">*</span></label
                >
                <input
                  type="email"
                  v-model="user.email"
                  class="form-control"
                  :class="{ 'is-invalid': errors && errors.email }"
                  id="inputEmail"
                  placeholder="Email"
                />
                <div class="invalid-feedback" v-if="errors && errors.email">
                  {{ errors.email[0] }}
                </div>
              </div>
            </div>
            <!-- col-12 -->
            <div class="col-lg-6">
              <div class="form-group">
                <label class="form-control-label" for="inputStatus"
                  >Estado: <span class="tx-danger">*</span></label
                >
                <select
                  id="inputStatus"
                  v-model="user.status"
                  class="form-control"
                  :class="{ 'is-invalid': errors && errors.status }"
                >
                  <option value="">Seleccione...</option>
                  <option value="1">Habilitado</option>
                  <option value="0">Inhabilitado</option>
                </select>
                <div
                  class="invalid-feedback d-block"
                  role="alert"
                  v-if="errors && errors.status"
                >
                  {{ errors.status[0] }}
                </div>
              </div>
            </div>
            <!-- col-12 -->
            <div class="col-lg-6">
              <div class="form-group">
                <label class="form-control-label" for="inputRole"
                  >Roles: <span class="tx-danger">*</span></label
                >
                <select
                  id="inputRole"
                  v-model="user.rol"
                  class="form-control"
                  :class="{ 'is-invalid': errors && errors.rol }"
                >
                  <option value="">Seleccione...</option>
                  <option :value="r.id" v-for="r in roles" :key="r.id">
                    {{ r.name }}
                  </option>
                </select>
                <div
                  class="invalid-feedback d-block"
                  role="alert"
                  v-if="errors && errors.rol"
                >
                  {{ errors.rol[0] }}
                </div>
              </div>
            </div>
            <!-- col-4 -->
          </div>
          <!-- row -->
        </div>
        <small>
          Nota: El password del usuario será su número de Dni y podrá cambiarla
          cuando desee.
        </small>
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
          <Loading v-show="isLoading"></Loading>
          Guardar
        </button>
      </template>
    </modal-section>
  </div>
</template>

<script>
import TableComponent from "../components/Table.vue";
import ModalSection from "../components/ModalSection.vue";
import Loading from "../components/LoaderAction.vue";

export default {
  name: "Users",

  components: {
    ModalSection,
    Loading,
    TableComponent,
  },

  mounted() {
    this.getUsers();
    this.getEmployees();
    this.getRoles();
  },

  data() {
    return {
      users: [],
      roles: [],
      employees: [],
      user: {
        empleado: "",
        name: "",
        email: "",
        dni: "",
        codeEmpleado: "",
        rol: "",
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
    async getUsers() {
      const res = await axios.get("/users/list");
      this.users = res.data;
      if (res) {
        this.isNoEmpty = false;
      }
    },

    async getEmployees() {
      const res = await axios.get("/api/users/employees");
      this.employees = res.data;
    },

    async getRoles() {
      const res = await axios.get("/users/roles");
      this.roles = res.data;
    },

    selectedPersona(value) {
      if (this.isActionNew) {
        let el = this;
        let datos = value.split("_");
        el.user.codeEmpleado = datos[0];
        el.user.dni = datos[1];
        el.user.email = datos[2];
        el.user.name = datos[3];
      }
    },

    openModal() {
      this.resetForm();
      this.getRoles();
    },

    store() {
      // Save Element
      if (this.isActionNew) {
        this.isLoading = true;
        axios
          .post("/users/list/", this.user)
          .then((res) => {
            $("#exampleModal").modal("hide");
            this.getUsers();
            this.getEmployees();
            this.$awn.success(res.data);
            this.isLoading = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      } else {
        this.isLoading = true;
        axios
          .put("/users/list/" + this.selected_id, this.user)
          .then((res) => {
            this.getUsers();
            $("#exampleModal").modal("hide");
            this.$awn.success(res.data);
            this.isLoading = false;
          })
          .catch((e) => {
            this.existsErrors(e);
          });
      }
    },

    deleteUser(id) {
      let onOk = () => {
        axios
          .delete("/users/list/" + id)
          .then((res) => {
            this.getUsers();
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

    editUser(data) {
      this.errors = [];
      this.isActionNew = false;
      this.isLoading = false;
      this.user.name = data.name;
      this.user.email = data.email;
      this.user.status = data.status;
      data.roles[0] ? (this.user.rol = data.roles[0].id) : (this.user.rol = "");
      this.selected_id = data.id;
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
      this.user.empleado = "";
      this.user.name = "";
      this.user.email = "";
      this.user.dni = "";
      this.user.rol = "";
      this.user.status = "1";
      this.errors = [];
      this.isActionNew = true;
    },
  },
};
</script>


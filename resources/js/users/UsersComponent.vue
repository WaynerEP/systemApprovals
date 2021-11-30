<template>
  <div>
    <div class="card card-table">
      <div
        class="card-header d-flex align-items-center justify-content-between"
      >
        <h6 class="slim-card-title">Lista de Usuarios</h6>
        <a
          @click="openModal()"
          href=""
          class="btn btn-primary"
          data-toggle="modal"
          data-target="#exampleModal"
          ><i class="fa fa-plus"></i> Agregar</a
        >
      </div>

      <div class="card-body">
        <table-component>
          <template #thead>
            <th class="wd-5p pd-y-5">Image</th>
            <th class="pd-y-5">Usuario</th>
            <th class="pd-y-5">Email</th>
            <th class="pd-y-5">Rol</th>
            <th class="pd-y-5">Última Sesión</th>
            <th class="pd-y-5">Fecha</th>
            <th class="pd-y-5">Estado</th>
            <th class="pd-y-5">Acciones</th>
          </template>
          <template #tbody>
            <template v-if="users.length > 0">
              <tr v-for="u in users" :key="u.id">
                <td class="valign-middle pd-l-20">
                  <img
                    src="http://via.placeholder.com/500x500"
                    class="wd-36 rounded-circle"
                    alt="Image"
                  />
                </td>
                <td class="valign-middle">
                  <span class="tx-inverse tx-14 tx-medium d-block">
                    {{ u.name }}
                  </span>
                </td>
                <td class="valign-middle">{{ u.email }}</td>
                <td class="valign-middle">
                  <template v-for="r in u.roles">
                    {{ r.name }}
                  </template>
                </td>
                <td class="valign-middle tx-12">
                  <template v-if="u.last_login">
                    <span
                      class="square-8 bg-success mg-r-5 rounded-circle"
                    ></span>
                    {{ getHumanDate(u.last_login) }}
                  </template>
                  <template v-else
                    ><span
                      class="square-8 bg-warning mg-r-5 rounded-circle"
                    ></span>
                    Nunca</template
                  >
                </td>
                <td class="valign-middle">
                  {{ getCreatedDate(u.created_at) }}
                </td>
                <td class="valign-middle">
                  <span class="tx-success" v-if="u.status == 1"
                    >Habilitado</span
                  >
                  <span class="tx-danger" v-else>Inhabilitado</span>
                </td>
                <td class="valign-middle">
                  <button
                    @click="editUser(u)"
                    class="btn btn-outline-primary btn-sm"
                  >
                    <i class="fa fa-pencil"></i>
                  </button>
                  <button
                    :disabled="u.status == 0"
                    @click="deleteUser(u.id)"
                    class="btn btn-outline-danger btn-sm"
                  >
                    <i class="fa fa-close"></i>
                  </button>
                </td>
              </tr>
            </template>

            <template v-else>
              <tr class="text-center">
                <td colspan="8" v-if="isNoEmpty">
                  <Loading></Loading>
                </td>
                <td colspan="8" v-else>No se encontraron resultados</td>
              </tr>
            </template>
          </template>
        </table-component>
      </div>
    </div>

    <modal-section @submitted="store" @close="resetForm()">
      <template #title>
        {{ isActionNew ? "Nuevo Usuario" : "Actualizar Usuario" }}
      </template>
      <template #body>
        <div class="form-group">
          <label class="form-control-label" for="inputAutocomplete"
            >Persona/Empleado</label
          >
          <div class="input-group">
            <input
              type="text"
              class="form-control"
              v-model="user.name"
              :class="{ 'is-invalid': errors && errors.name }"
              placeholder="Buscar..."
            />
            <span class="input-group-btn">
              <button class="btn bd bd-l-0 bg-white tx-gray-600" type="button">
                <i class="fa fa-search"></i>
              </button>
            </span>
          </div>
          <div class="invalid-feedback d-block" v-if="errors && errors.name">
            {{ errors.name[0] }}
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-4" v-show="isActionNew">
            <label class="form-control-label" for="inputDni">Documento</label>
            <input
              type="number"
              v-model="user.dni"
              class="form-control"
              :class="{ 'is-invalid': errors && errors.dni }"
              id="inputDni"
              placeholder="Dni"
            />
            <div class="invalid-feedback" v-if="errors && errors.dni">
              {{ errors.dni[0] }}
            </div>
          </div>
          <div class="form-group col">
            <label class="form-control-label" for="inputEmail">Correo</label>
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
        <div class="form-row">
          <div class="form-group col-md-6">
            <label class="form-control-label" for="inputStatus">Estado</label>
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
          <div class="form-group col-md-6">
            <label class="form-control-label" for="inputRole">Rol</label>
            <select
              id="inputRole"
              v-model="user.role"
              class="form-control"
              :class="{ 'is-invalid': errors && errors.role }"
            >
              <option value="">Seleccione...</option>
              <option :value="r.id" v-for="r in roles" :key="r.id">
                {{ r.name }}
              </option>
            </select>
            <div
              class="invalid-feedback d-block"
              role="alert"
              v-if="errors && errors.role"
            >
              {{ errors.role[0] }}
            </div>
          </div>
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
          <loader-action v-show="isLoading"></loader-action>
          Guardar
        </button>
      </template>
    </modal-section>
  </div>
</template>

<script>
import TableComponent from "../components/Table.vue";
import moment from "moment";
import ModalSection from "../components/ModalSection.vue";
import Loading from "../components/Loader.vue";
import LoaderAction from "../components/LoaderAction.vue";

export default {
  name: "Users",

  components: {
    ModalSection,
    Loading,
    TableComponent,
    LoaderAction,
  },

  mounted() {
    this.getUsers();
    this.getRoles();
  },

  data() {
    return {
      users: [],
      roles: [],
      user: {
        name: "",
        email: "",
        dni: "",
        role: "",
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
    getHumanDate: function (date) {
      moment.locale("es");
      return moment(date, "YYYY-MM-DD h:mm:ss").fromNow();
    },

    getCreatedDate: function (date) {
      return moment(date).format("DD/MM/YYYY");
    },

    async getUsers() {
      const res = await axios.get("/users/list");
      this.users = res.data;
      if (res) {
        this.isNoEmpty = false;
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
      data.roles[0]
        ? (this.user.role = data.roles[0].id)
        : (this.user.role = "");
      this.selected_id = data.id;
      $("#exampleModal").modal("show");
    },

    async getRoles() {
      const res = await axios.get("/users/roles");
      this.roles = res.data;
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
      this.user.name = "";
      this.user.email = "";
      this.user.dni = "";
      this.user.role = "";
      this.user.status = "1";
      this.isActionNew = true;
      this.errors = [];
      this.roles = [];
    },
  },
};
</script>

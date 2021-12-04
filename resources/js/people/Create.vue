<template>
  <section class="section">
    <div class="section-header">
      <h1>Nuevo Contacto</h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item"><a :href="'/home'">Dashboard</a></div>
        <div class="breadcrumb-item">
          <a :href="'/contacts/people/create'">Contactos</a>
        </div>
        <div class="breadcrumb-item active">Create</div>
      </div>
    </div>

    <div class="section-body">
      <p class="section-lead">
        Crea tus contactos para asociarlos en los documentos y transacciones que
        registres a su nombre..
      </p>
      <div class="row">
        <div class="col-lg-12">
          <form @submit.prevent="store" class="card px-5 pt-4 mx-5">
            <div class="card-body px-5">
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="inputEmail4">Número (RUC, DNI, Etc.)</label>
                  <div class="input-group justify-content-center">
                    <input
                      type="number"
                      size="8"
                      minlength="8" maxlength="8"
                      class="form-control form-control-sm"
                      v-model="persona.dniCiudadano"
                      :class="{ 'is-invalid': errors && errors.dniCiudadano }"
                      required
                    />

                    <div class="ml-2">
                      <button
                        type="button"
                        class="btn btn-primary btn-sm"
                        @click="getByDni()"
                      >
                        <i class="fas fa-search"></i> Extraer?
                      </button>
                    </div>
                  </div>
                  <input-error v-if="errors && errors.dniCiudadano">
                    {{ errors.dniCiudadano[0] }}
                  </input-error>
                </div>
                <div class="col-1"></div>
                <div class="form-group col-md-7">
                  <label>Tipo de identificación</label>
                  <select class="custom-select">
                    <option>RUC - Registro único de contribuyente</option>
                    <option selected>
                      DNI - Documento nacional de identidad
                    </option>
                    <option>CE - Carnet de extranjería</option>
                    <option>PP - Pasaporte</option>
                    <option>PP - Pasaporte</option>
                  </select>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="inputEmailName">Nombres</label>
                  <input
                    type="text"
                    class="form-control form-control-sm"
                    :class="{ 'is-invalid': errors && errors.nombres }"
                    v-model="persona.nombres"
                    id="inputEmailName"
                    placeholder=""
                    required
                  />
                  <input-error v-if="errors && errors.nombres">
                    {{ errors.nombres[0] }}
                  </input-error>
                </div>
                <div class="form-group col-md-6">
                  <label for="inputEmailLastName">Apellidos</label>
                  <input
                    type="text"
                    class="form-control form-control-sm"
                    v-model="persona.apellidos"
                    :class="{ 'is-invalid': errors && errors.apellidos }"
                    id="inputEmailLastName"
                    placeholder=""
                    required
                  />
                  <input-error v-if="errors && errors.apellidos">
                    {{ errors.lastName[0] }}
                  </input-error>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="inputEmail4">Nacimiento</label>
                  <input
                    type="date"
                    class="form-control form-control-sm"
                    id="date1"
                    v-model="persona.fechaNacimiento"
                    :class="{ 'is-invalid': errors && errors.fechaNacimiento }"
                    placeholder=""
                    required
                  />
                  <input-error v-if="errors && errors.fechaNacimiento">
                    {{ errors.fechaNacimiento[0] }}
                  </input-error>
                </div>
                <div class="form-group col-md-6">
                  <label class="d-block text-center">Género</label>
                  <div class="text-center mt-1">
                    <div class="form-check form-check-inline">
                      <input
                        class="form-check-input"
                        type="radio"
                        id="inlineradio1"
                        v-model="persona.sexo"
                        :class="{ 'is-invalid': errors && errors.sexo }"
                        value="M"
                      />
                      <label class="form-check-label" for="inlineradio1"
                        >Masculino</label
                      >
                    </div>
                    <div class="form-check form-check-inline">
                      <input
                        class="form-check-input"
                        type="radio"
                        id="inlineradio2"
                        v-model="persona.sexo"
                        :class="{ 'is-invalid': errors && errors.sexo }"
                        value="F"
                      />
                      <label class="form-check-label" for="inlineradio2"
                        >Femenino</label
                      >
                    </div>
                  </div>
                  <input-error class="text-center" v-if="errors && errors.sexo">
                    {{ errors.sexo[0] }}
                  </input-error>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="inputDepa">Departamento</label>
                  <select
                    required
                    class="custom-select"
                    v-model="selected_depa"
                    @change="getProvincias(selected_depa)"
                  >
                    <option value="">Seleccione</option>
                    <option
                      v-for="d in departamentos"
                      :key="d.idDepartamento"
                      :value="d.idDepartamento"
                    >
                      {{ d.departamento }}
                    </option>
                  </select>
                </div>
                <div class="form-group col-md-4">
                  <label for="inputProv">Provincias</label>
                  <select
                    class="custom-select"
                    required
                    v-model="selected_prov"
                    @change="getDistritos(selected_prov)"
                  >
                    <option value="">Seleccione</option>
                    <option
                      v-for="p in provincias"
                      :key="p.idProvincia"
                      :value="p.idProvincia"
                    >
                      {{ p.provincia }}
                    </option>
                  </select>
                </div>
                <div class="form-group col-md-4">
                  <label for="InputDist">Distrito</label>
                  <select
                    required
                    class="custom-select"
                    v-model="persona.codDistrito"
                  >
                    <option value="">Seleccione</option>
                    <option
                      v-for="d in distritos"
                      :key="d.idDistrito"
                      :value="d.idDistrito"
                    >
                      {{ d.distrito }}
                    </option>
                  </select>
                  <input-error v-if="errors && errors.distrito">
                    {{ errors.distrito[0] }}
                  </input-error>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="inputAddress">Dirección</label>
                  <textarea
                  required
                    class="form-control"
                    v-model="persona.direccion"
                    :class="{ 'is-invalid': errors && errors.direccion }"
                  ></textarea>
                  <input-error v-if="errors && errors.direccion">
                    {{ errors.direccion[0] }}
                  </input-error>
                </div>
                <div class="form-group col-md-6">
                  <label for="inputReferencia">Referencia</label>
                  <textarea
                    class="form-control"
                    v-model="persona.referencia"
                    :class="{ 'is-invalid': errors && errors.referencia }"
                  ></textarea>
                  <input-error v-if="errors && errors.referencia">
                    {{ errors.referencia[0] }}
                  </input-error>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="inputLevel">Nivel de Estudios</label>
                  <select
                    required
                    class="custom-select"
                    v-model="persona.idNivel"
                  >
                    <option value="">Seleccione</option>
                    <option
                      v-for="n in nivelEstudios"
                      :key="n.idNivel"
                      :value="n.idNivel"
                    >
                      {{ n.nivel }}
                    </option>
                  </select>
                  <input-error v-if="errors && errors.idNivel">
                    {{ errors.idNivel[0] }}
                  </input-error>
                </div>
                <div class="form-group col-md-6">
                  <label for="email">Correo electrónico</label>
                  <input
                    type="email"
                    class="form-control form-control-sm"
                    id="email"
                    :class="{ 'is-invalid': errors && errors.email }"
                    v-model="persona.email"
                    placeholder=""
                    required
                  />
                  <input-error v-if="errors && errors.email">
                    {{ errors.email[0] }}
                  </input-error>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="inputPhone1">Teléfono 1</label>
                  <input
                    type="number"
                    class="form-control form-control-sm"
                    id="inputPhone1"
                    v-model="persona.celular"
                    :class="{ 'is-invalid': errors && errors.celular }"
                    placeholder=""
                    required
                  />
                  <input-error v-if="errors && errors.celular">
                    {{ errors.celular[0] }}
                  </input-error>
                </div>
                <div class="form-group col-md-6">
                  <label for="inputPhone2">Teléfono 2</label>
                  <input
                    type="text"
                    class="form-control form-control-sm"
                    id="inputPhone2"
                    v-model="persona.telefono1"
                    :class="{ 'is-invalid': errors && errors.telefono1 }"
                    placeholder=""
                  />
                  <input-error v-if="errors && errors.telefono1">
                    {{ errors.telefono1[0] }}
                  </input-error>
                </div>
              </div>
            </div>
            <div class="card-footer text-right">
              <button type="submit" class="btn btn-primary mr-1">
                <i class="fas fa-save"></i> Guardar
              </button>
              <a :href="'/contacts/people/create'" class="btn btn-secondary">
                <i class="fas fa-arrow-alt-circle-left"></i> Cancelar
              </a>
            </div>
          </form>
        </div>
        <!-- <div class="col-lg-3">
          <div class="card text-left">
            <div class="card-body">
              <div class="custom-control custom-checkbox">
                <input
                  type="checkbox"
                  class="custom-control-input"
                  id="customCheck1"
                  @change="showSelectEmpleado($event)"
                />
                <label class="custom-control-label" for="customCheck1"
                  >Empleado</label
                >
                <loader-section v-show="isLoadingBoxEmpleado"></loader-section>
              </div>
              <div v-show="showBoxEmpleado" class="mt-3">
                <div class="form-group">
                  <label>Departamento de la Empresa</label>
                  <select
                    class="custom-select"
                    v-model="idDepa"
                    @change="getAreasByDepas(idDepa)"
                  >
                    <option value="">Seleccione</option>
                    <option
                      v-for="dp in depaEmpresa"
                      :key="dp.idDepart"
                      :value="dp.idDepart"
                    >
                      {{ dp.departamento }}
                    </option>
                  </select>
                </div>
                <div class="form-group">
                  <label>Area</label>
                  <select class="custom-select" v-model="idArea">
                    <option value="">Seleccione</option>
                    <option
                      v-for="area in areas"
                      :key="area.codArea"
                      :value="area.codArea"
                    >
                      {{ area.area }}
                    </option>
                  </select>
                </div>
                <div class="form-group">
                  <label>Cargo</label>
                  <select class="custom-select" v-model="idCargo">
                    <option value="">Seleccione</option>
                    <option
                      v-for="n in cargos"
                      :key="n.idCargo"
                      :value="n.idCargo"
                    >
                      {{ n.cargo }}
                    </option>
                  </select>
                </div>
              </div>
              <div class="custom-control custom-checkbox mt-4">
                <input
                  type="checkbox"
                  class="custom-control-input"
                  id="customCheck2"
                />
                <label class="custom-control-label" for="customCheck2"
                  >Proveedor</label
                >
              </div>
            </div>
          </div>
        </div> -->
      </div>
    </div>
  </section>
</template>

<script>
import LoaderSection from "../components/LoaderAction.vue";
import InputError from "../components/InputError.vue";

export default {
  name: "CreateContacto",

  components: {
    LoaderSection,
    InputError,
  },

  data() {
    return {
      departamentos: [],
      provincias: [],
      distritos: [],
      nivelEstudios: [],
      depaEmpresa: [],
      areas: [],
      cargos: [],
      errors: [],
      persona: {
        dniCiudadano: "",
        nombres: "",
        apellidos: "",
        fechaNacimiento: "",
        sexo: "",
        codDistrito: "",
        direccion: "",
        referencia: "",
        idNivel: "",
        email: "",
        celular: "",
        telefono1: "",
      },
      idDepa: "",
      idCargo: "",
      idArea: "",
      selected_depa: "",
      selected_prov: "",
      isLoading: false,
    };
  },

  mounted() {
    this.getAllDepartamentos();
    this.getNivelEstudios();
  },

  methods: {
    async getAllDepartamentos() {
      const res = await axios.get("/api/departamentos");
      this.departamentos = res.data;
    },

    async getNivelEstudios() {
      const res = await axios.get("/api/nivelEstudios");
      this.nivelEstudios = res.data;
    },

    async getProvincias(idDepa) {
      const res = await axios.get("/api/provincias/" + idDepa);
      this.provincias = res.data;
    },

    async getDistritos(idProv) {
      const res = await axios.get("/api/distritos/" + idProv);
      this.distritos = res.data;
    },

    getByDni() {
      axios
        .get("https://consulta.api-peru.com/api/dni/74122465")
        .then((response) => response.json())
        .then((json) => console.log(json))
        .catch((error) =>
          console.log("Authorization failed : " + error.message)
        );
    },

    store() {
      // Save Element
      this.isLoading = true;
      console.log(this.persona);
      axios
        .post("/persona/list/", this.persona)
        .then((res) => {
          this.$awn.success(res.data);
          this.isLoading = false;
        })
        .catch((e) => {
          // this.existsErrors(e);
          console.log(e);
        });
    },

    existsErrors(e) {
      if (e.response.status === 422) {
        this.errors = e.response.data.errors;
      } else {
        this.$awn.alert("Ha ocurrido un error!.");
      }
      console.log(e);
      this.isLoading = false;
    },

    // showSelectEmpleado(e) {
    //   this.idDepa = "";
    //   this.idCargo = "";
    //   this.idArea = "";
    //   if (e.target.checked == true) {
    //     this.isLoadingBoxEmpleado = true;
    //     this.getDepasEmpresa();
    //     this.getCargos();
    //     this.showBoxEmpleado = true;
    //     this.isLoadingBoxEmpleado = false;
    //   } else {
    //     this.showBoxEmpleado = false;
    //   }
    // },

    // async getDepasEmpresa() {
    //   const res = await axios.get("/api/depas/");
    //   this.depaEmpresa = res.data;
    // },

    // async getAreasByDepas(idDepa) {
    //   const res = await axios.get("/api/depas/areas/" + idDepa);
    //   this.areas = res.data;
    // },

    // async getCargos() {
    //   const res = await axios.get("/api/cargos");
    //   this.cargos = res.data;
    // },
  },
};
</script>

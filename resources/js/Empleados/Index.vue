<template>
  <section-component>
    <template #section_header>Empleados</template>

    <template #section_actions>
      <a :href="'/contacts/people/create'" class="btn btn-light">
        <i class="fas fa-plus"></i> Agregar
      </a>
    </template>

    <template #section_title>Empleados</template>
    <template #section_lead
      >Crea los contactos que asociarás en tus documentos y transacciones de
      ingresos.</template
    >
    <template #section_card_header>
      Listado de Empleados
      <!-- <form-seacher></form-seacher> -->
    </template>

    <template #section_card_body>
      <table-component>
        <template #thead>
          <th>Razón social o nombre completo</th>
          <th>Identificación</th>
          <th>Télefono</th>
          <th>Acciones</th>
        </template>
        <template #tbody>
          <template v-if="data.length > 0">     
            <tr v-for="d in data" :key="d.id">
              <td>{{ d.name }}</td>
              <td>{{ d.name }}</td>
              <td>{{ d.name }}</td>

              <td>
                <button-action
                  ><i class="fas fa-eye text-primary"></i
                ></button-action>
                <button-action
                  ><i class="fas fa-edit text-primary"></i
                ></button-action>
                <button-action
                  ><i class="fas fa-thumbs-up text-success"></i
                ></button-action>
                <button-action
                  ><i class="fas fa-times text-danger"></i
                ></button-action>
              </td>
            </tr>
          </template>

          <template v-else>
            <tr class="text-center">
              <td colspan="9" v-if="isNoEmpty">
                <loading-comp></loading-comp>
              </td>
              <td colspan="9" v-else>No se encontraron resultados!.</td>
            </tr>
          </template>
        </template>
      </table-component>
    </template>
  </section-component>
</template>

<script>
import SectionComponent from "../components/Section.vue";
import FormSeacher from "../components/Seacher.vue";
import TableComponent from "../components/Table.vue";
import ButtonAction from "../components/Button.vue";
import LoadingComp from "../components/Loader.vue";

export default {
  name: "Employees",

  components: {
    SectionComponent,
    FormSeacher,
    TableComponent,
    ButtonAction,
    LoadingComp,
  },

  mounted() {
    // this.getPermissions();
  },

  data() {
    return {
      data: [
        {
          name: "wayner",
        },
      ],
      permission: {
        name: "",
      },
      errors: [],
      selected_id: "",
      isNoEmpty: true,
      isActionNew: true,
      isDisabled: false,
    };
  },
};
</script>
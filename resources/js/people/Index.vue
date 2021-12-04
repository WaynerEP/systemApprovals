<template>
  <div>
      <table-component>
        <template #thead>
          <th>Acciones</th>
          <th>Dni</th>
          <th>Nombres</th>
          <th>Apellidos</th>
          <th>Género</th>
          <th>Edad</th>
          <th>Dirección</th>
          <th>Correo</th>
          <th>Teléfono</th>
        </template>
        <template #tbody>
          <template v-if="data.length > 0">
            <tr v-for="d in data" :key="d.id">
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
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
  </div>
</template>

<script>
import FormSeacher from "../components/Seacher.vue";
import TableComponent from "../components/Table.vue";
import ButtonAction from "../components/Button.vue";
import LoadingComp from "../components/Loader.vue";

export default {
  name: "Employees",

  components: {
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
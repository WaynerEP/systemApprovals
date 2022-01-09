<div class="table-responsive">
  <table class="table mg-b-0 tx-13 table-bordered table-reference">
    <thead>
      <tr class="tx-10">
        <th class="pd-y-5">Seleccionar</th>
        <th class="pd-y-5">Image</th>
        <th class="pd-y-5">Producto</th>
        <th class="pd-y-5">Categoria</th>
        <th class="pd-y-5">Stock</th>
        <th class="pd-y-5">Unidad de Medida</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="product in products" :key="product.id">
        <td>hello</td>
        <td class="valign-middle pd-l-20">
          <img
            :src="
              product.image
                ? product.image
                : 'http://via.placeholder.com/500x500'
            "
            :alt="product.descripcionProducto"
            class="wd-36 rounded-circle"
          />
        </td>
        <td class="valign-middle">
          <span class="tx-medium">
            {{ product.descripcionProducto }}
          </span>
        </td>
        <td class="valign-middle">{{ product.idTipo }}</td>
        <td class="valign-middle">{{ product.stock }}</td>
        <td class="valign-middle">
          {{ product.medida }}
        </td>
      </tr>
    </tbody>
  </table>
</div>

<vue-bootstrap4-table
:rows="products"
:columns="columns"
:config="config"
:classes="classesTable"
:showLoader="loadingTable"
>
<template slot="image" slot-scope="props">
  <img
    :src="
      props.cell_value
        ? props.cell_value
        : 'http://via.placeholder.com/800x533'
    "
    class="wd-55"
    alt="Image"
  />
</template>
</vue-bootstrap4-table>
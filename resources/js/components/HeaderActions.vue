<template>
  <div class="section-header-breadcrumb">
    <!-- <div class="dropdown d-inline mr-2">
      <button
        class="btn btn-outline-dark dropdown-toggle"
        type="button"
        id="dropdownMenuButton3"
        data-toggle="dropdown"
        aria-haspopup="true"
        aria-expanded="false"
      >
        <slot name="trigger"></slot>
      </button>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#"><i class="fas fa-upload"></i> Importar desde Excel</a>
                    <a class="dropdown-item" href="#"><i class="fas fa-download"></i> Exportar a excel</a>
        <slot name="actions"></slot>
      </div>
    </div> -->
    <a
      href="#"
      class="btn btn-light"
      data-toggle="modal"
      data-target="#exampleModal"
      @click="$emit('showModal')"
      ><i class="fas fa-plus"></i> <slot/></a>
  </div>
</template>
<script>
export default {
  emits: ["showModal"],
};
</script>
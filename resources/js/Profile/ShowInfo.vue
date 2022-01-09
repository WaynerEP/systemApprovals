<template>
  <div class="card pd-25">
    <div class="slim-card-title">Datos personales del usuario</div>

    <div class="media-list mg-t-25">
      <div class="media">
        <div><i class="icon ion-person tx-24 lh-0"></i></div>
        <div class="media-body mg-l-15 mg-t-4">
          <h6 class="tx-14 tx-gray-700">Nombres y Apellidos</h6>
          <span class="d-block">{{ user.nombres }}, {{ user.apellidos }}</span>
        </div>
        <!-- media-body -->
      </div>
      <div class="media mg-t-25">
        <div><i class="icon ion-calendar tx-24 lh-0"></i></div>
        <div class="media-body mg-l-15 mg-t-2">
          <h6 class="tx-14 tx-gray-700">Fecha de Nacimiento</h6>
          <span class="d-block">{{ user.fechaNacimiento }}</span>
        </div>
        <!-- media-body -->
      </div>
      <!-- media -->
      <div class="media mg-t-25">
        <div><i class="icon ion-ios-telephone tx-24 lh-0"></i></div>
        <div class="media-body mg-l-15 mg-t-4">
          <h6 class="tx-14 tx-gray-700">Contacto</h6>
          <span class="d-block">{{ user.telefono }}</span>
        </div>
        <!-- media-body -->
      </div>
      <!-- media -->
      <div class="media mg-t-25">
        <div><i class="icon ion-location tx-24 lh-0"></i></div>
        <div class="media-body mg-l-15 mg-t-4">
          <h6 class="tx-14 tx-gray-700">Dirección</h6>
          <span class="d-block">{{ user.address }}, {{ user.city }}</span>
        </div>
        <!-- media-body -->
      </div>
      <!-- media -->

      <!-- media -->
    </div>
    <!-- media-list -->
  </div>
  <!-- card -->
</template>
<script>
export default {
  props: ["user"],
};
</script>
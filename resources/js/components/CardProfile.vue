<template>
  <div class="card card-profile">
    <div class="card-body">
      <div class="media">
        <slot name="body" />
      </div>
      <!-- media -->
    </div>
    <!-- card-body -->
    <div class="card-footer">
      <slot name="footer" />
    </div>
  </div>
</template>
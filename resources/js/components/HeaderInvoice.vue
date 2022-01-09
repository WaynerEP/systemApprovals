<template>
  <div class="justify-content-end">
    <h1 class="invoice-title"><slot name="title" /></h1>
    <div class="form-layout form-layout-6">
      <div class="row no-gutter mt-1">
        <div class="col-5 col-sm-4">Nro.</div>
        <div class="col-7 col-sm-8">
          <slot name="input" />
        </div>
      </div>
    </div>
  </div>
</template>
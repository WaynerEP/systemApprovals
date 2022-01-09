<template>
  <div class="table-responsive">
    <table class="table table-invoice table-sm">
      <thead class="thead-colored bg-info">
        <tr>
          <slot name="thead" />
        </tr>
      </thead>
      <tbody>
        <slot name="tbody" />
      </tbody>
    </table>
  </div>
</template>
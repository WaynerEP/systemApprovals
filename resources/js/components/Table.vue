<template>
  <div class="table-responsive">
    <table
      class="table mg-b-0 tx-13 table-bordered table-reference"
      :class="size"
    >
      <thead class="">
        <tr class="tx-10">
          <slot name="thead" />
        </tr>
      </thead>
      <tbody>
        <slot name="tbody" />
      </tbody>
    </table>
  </div>
</template>
<script>
export default {
  props: ["size"],
};
</script>
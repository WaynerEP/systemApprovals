<template>
  <div class="card">
    <div class="card-header" role="tab" :id="'sectionHeader' + id">
      <a
        data-toggle="collapse"
        data-parent="#accordion"
        :href="'#sectionContent' + id"
        aria-expanded="true"
        aria-controls="collapseOne"
        class="tx-gray-800 transition"
      >
        <i class="fa fa-file-pdf-o text-info tx-15 mr-1"></i>
        <slot></slot>
      </a>
    </div>
    <!-- card-header -->

    <div
      :id="'sectionContent' + id"
      class="collapse"
      role="tabpanel"
      :aria-labelledby="'sectionHeader' + id"
    >
      <div class="card-body">
        <iframe
          :src="'/storage/proformas/'+src"
          width="100%"
          height="750"
        >
        </iframe>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: ["id","src"],
};
</script>
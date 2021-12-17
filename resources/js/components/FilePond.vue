<template>
  <div>
    <file-pond
      name="test"
      ref="pond"
      class-name="my-pond"
      label-idle="Drop files here or <span class='filepond--label-action'>Browse</span>"
      allow-multiple="true"
      data-allow-reorder="true"
      v-bind:files="myFiles"
      v-on:addfile="handleFilePondLoaded"
      v-on:removefile="handleFilePondLoaded"
    />
  </div>
</template>

<script>
// Import Vue FilePond
import vueFilePond from "vue-filepond";
// Import FilePond styles
import "filepond/dist/filepond.min.css";

// Import FilePond plugins
// Please note that you need to install these plugins separately

// Import image preview plugin styles
import "filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css";

// Import image preview and file type validation plugins
import FilePondPluginFileValidateType from "filepond-plugin-file-validate-type";
import FilePondPluginImagePreview from "filepond-plugin-image-preview";

// Create component
const FilePond = vueFilePond(
  FilePondPluginFileValidateType,
  FilePondPluginImagePreview
);

export default {
  name: "FilePondDemo",
  data: function () {
    return {
      myFiles: [],
    };
  },
  components: {
    FilePond,
  },
  methods: {
    handleFilePondLoaded() {
      // example of instance method call on pond reference
      const files = this.$refs.pond.getFiles();
      this.$emit("changeFile", files);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped></style>
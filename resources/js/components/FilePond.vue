<template>
  <div>
    <file-pond
      name="files"
      ref="pond"
      class-name="my-pond"
      label-idle="Suelta los archivos aquí o <span class='filepond--label-action'>selecciona</span>"
      :allow-multiple="multipleFiles"
      :max-files="maxFiles"
      allow-process="true"
      required="true"
      label-Invalid-Field="El campo contiene archivos no válidos"
      label-File-Processing-Complete="Carga completa"
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
  props: {
    multipleFiles: {
      type: Boolean,
      default: true,
    },
    maxFiles: {
      type: Number,
      default: 1,
    },
  },
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
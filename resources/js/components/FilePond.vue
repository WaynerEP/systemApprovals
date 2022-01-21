<template>
  <file-pond
    name="files"
    ref="pond"
    class-name="my-pond"
    label-idle="Suelta los archivos aquí o <span class='filepond--label-action'>selecciona</span>"
    :allow-multiple="multipleFiles"
    :max-files="maxFiles"
    :accepted-file-types="fileTypes"
    allow-process="true"
    required="true"
    label-Invalid-Field="El campo contiene archivos no válidos"
    label-File-Processing-Complete="Carga completa"
    imagePreviewHeight="160"
    imageCropAspectRatio="1:1"
    :imageResizeTargetWidth="imageWidth"
    :imageResizeTargetHeight="imageHeight"
    :stylePanelLayout="styleLayout"
    styleLoadIndicatorPosition="center bottom"
    styleProgressIndicatorPosition="right bottom"
    styleButtonRemoveItemPosition="left bottom"
    styleButtonProcessItemPosition="right bottom"
    v-bind:files="myFiles"
    v-on:addfile="emitFiles"
    v-on:removefile="emitFiles"
    :className="classes"
  />
</template>

<script>
// Import Vue FilePond
import vueFilePond from "vue-filepond";
// Import FilePond styles
import "filepond/dist/filepond.min.css";
// Import FilePond plugins
// Import image preview plugin styles
import "filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css";
// Import image preview and file type validation plugins
import FilePondPluginFileValidateType from "filepond-plugin-file-validate-type";
import FilePondPluginImagePreview from "filepond-plugin-image-preview";
import FilePondPluginImageResize from "filepond-plugin-image-resize";
import FilePondPluginImageCrop from "filepond-plugin-image-crop";
// Create component
const FilePond = vueFilePond(
  FilePondPluginFileValidateType,
  FilePondPluginImagePreview,
  FilePondPluginImageResize,
  FilePondPluginImageCrop
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
    styleLayout: {
      type: String,
      default: "",
    },
    fileTypes: {
      type: String,
      default: "",
    },
    classes: {
      type: String,
      default: "",
    },
    myFiles: {
      type: Array,
    },
    imageWidth: {
      type: Number,
      default: 200,
    },
    imageHeight: {
      type: Number,
      default: 200,
    },
  },
  data: function () {
    return {
      myFile: [],
    };
  },

  components: {
    FilePond,
  },

  methods: {
    emitFiles: function () {
      // example of instance method call on pond reference
      const files = this.$refs.pond.getFiles();
      this.$emit("changeFile", files);
    },

    removeFiles: function () {
      this.$refs.pond.removeFile();
    },
  },
};
</script>
<template>
  <div :id="id" class="modal fade">
    <div
      class="modal-dialog modal-dialog-vertical-center"
      role="document"
      :class="maxWidthClass"
    >
      <div class="modal-content bd-0 tx-14">
        <div class="modal-header">
          <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">
            <slot name="title"></slot>
          </h6>
          <button
            type="button"
            class="close"
            data-dismiss="modal"
            aria-label="Close"
            @click="$emit('close')"
          >
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form @submit.prevent="$emit('submitted')">
          <div class="modal-body pd-25">
            <slot name="body"></slot>
          </div>
          <div class="modal-footer">
            <slot name="footer"></slot>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ModalSection",
  props: {
    id: {
      type: String,
      default: "exampleModal",
    },
    maxWidth: {
      default: "md",
    },
  },

  emits: ["submitted", "close"],
  data() {
    return {};
  },
  computed: {
    maxWidthClass() {
      return {
        sm: "modal-sm",
        md: null,
        lg: "modal-lg",
        xl: "modal-xl",
      }[this.maxWidth];
    },
  },
};
</script>
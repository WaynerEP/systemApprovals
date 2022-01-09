<template>
  <card-profile>
    <template #body>
      <file-pond
        styleLayout="compact circle"
        fileTypes="image/png, image/jpeg, image/gif"
        :myFiles="myfiles"
        @changeFile="changeImageProfile"
        classes="wd-200 ht-200"
        ref="filePondComponente"
      ></file-pond>
      <div class="media-body">
        <h3 class="card-profile-name">{{ user.name }}</h3>
        <p class="card-profile-position">
          {{ user.role }} de <a href="">Comercial El Valle.</a>
        </p>
        <p>{{ user.address }}, {{ user.city }}</p>
      </div>
      <!-- media-body -->
    </template>
    <template #footer>
      <a href="" class="card-profile-direct"
        >.</a
      >
      <div>
        <a href="">Editar Perfil</a>
        <a href="">Configuración de la cuenta</a>
      </div>
    </template>
  </card-profile>
</template>
<script>
import CardProfile from "../components/CardProfile.vue";
import FilePond from "../components/FilePond.vue";

export default {
  props: {
    user: {
      type: Object,
    },
  },

  watch: {
    user(values) {
      if (values.avatar == null) this.myfiles.push("storage/avatars/user.png");
      else this.myfiles.push(values.avatar);
    },
  },

  data() {
    return {
      myfiles: [],
      user_data: {
        password: "",
        password_verification: "",
      },
    };
  },
  components: {
    CardProfile,
    FilePond,
  },

  methods: {
    changeImageProfile: function (values) {
      if (values.length > 0) {
        let file = values[0].file;
        console.log(file);
        let fields = new FormData();
        fields.append("image", file);

        const config = {
          headers: { "content-type": "multipart/form-data" },
        };
        axios
          .post("/update-profile", fields, config)
          .then((res) => {
            console.log(res.data);
          })
          .catch((e) => {
            this.$awn.alert("La acción ha fallado!.");
          });
      }
    },
  },
};
</script>
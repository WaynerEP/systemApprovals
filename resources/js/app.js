require('./bootstrap');

window.Vue = require('vue').default;
import VueAWN from "vue-awesome-notifications"
// Your custom options
let options = {
    labels: {
        success: "Éxito!",
        confirm: "Confirmación requerida",
        warning: "Atención",
    }
}

Vue.use(VueAWN, options)
//pagination vue laravel
Vue.component('pagination', require('laravel-vue-pagination'));

Vue.component('error-login', require('./components/ErrorLogin.vue').default);
Vue.component('message-notification', require('./components/NotificationMessage.vue').default);

// Management Users
Vue.component('users-component', require('./users/UsersComponent.vue').default);

//Managemente Roles
Vue.component('roles-component', require('./users/RolesComponent.vue').default);

//Management Permissions
Vue.component('permissions-component', require('./users/PermissionsComponent.vue').default);

//Management Providers
Vue.component('providers-component', require('./Providers/Index.vue').default);

//Management Products
Vue.component('products-component', require('./Products/Index.vue').default);

// Solicitudes
Vue.component('solicitud-component', require('./Compras/Solicitudes.vue').default);
Vue.component('listar-solicitudes', require('./Compras/ListSolicitudes.vue').default);

// Pedidos
Vue.component('pedidos-component', require('./Compras/Pedidos.vue').default);
Vue.component('list-pedidos', require('./Compras/ListPedidos.vue').default);

// Solicitudes
Vue.component('proformas-component', require('./Compras/Proformas.vue').default);
Vue.component('list-proformas', require('./Compras/ListarProformas.vue').default);

// Solicitudes
Vue.component('list-solicitudes', require('./Orders/Index.vue').default);

// Solicitudes
Vue.component('user-profile', require('./Profile/User-Profile.vue').default);

const app = new Vue({
    el: '#app',
});

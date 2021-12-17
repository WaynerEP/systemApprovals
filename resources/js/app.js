/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;
import VueAWN from "vue-awesome-notifications"
// Your custom options
let options = {
    labels: {
        success: "Exito!",
        confirm: "Confirmación requerida",
    }
}

Vue.use(VueAWN, options)

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

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
//Personas
// Vue.component('people-component', require('./Personas/Index.vue').default);
// Vue.component('people-create-component', require('./Personas/Create.vue').default);
 
// Solicitudes
Vue.component('nueva-compra-component', require('./Compras/NuevaCompra.vue').default);
Vue.component('solicitudes-component', require('./Compras/Proforma.vue').default);



/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});

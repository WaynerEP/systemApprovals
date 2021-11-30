const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .vue()
    .sass('resources/sass/app.scss', 'public/css')
    .postCss('public/assets/css/style.css', 'public/css')
    .postCss('public/assets/css/components.css', 'public/css')
    .postCss('public/assets/css/main.css', 'public/css')
    .postCss('public/assets/css/theme-2.css', 'public/css')
    .postCss('public/assets/lib/font-awesome/css/font-awesome.css', 'public/css/icons.css')
    .postCss('public/assets/lib/Ionicons/css/ionicons.css', 'public/css/icons.css');

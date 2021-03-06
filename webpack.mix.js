const mix = require('laravel-mix');
mix.js('resources/js/app.js', 'public/js')
    .vue()
    .js('public/assets/js/slim.js', 'public/js/main.js')
    .js('public/assets/lib/select2/js/select2.min.js', 'public/js/select2.js')
    .sass('resources/sass/app.scss', 'public/css')
    .postCss('public/assets/css/style.css', 'public/css')
    .postCss('public/assets/css/components.css', 'public/css')
    .postCss('public/assets/css/theme.css', 'public/css/theme.css')
    .postCss('public/assets/lib/jquery.steps/css/jquery.steps.css', 'public/css/wizard.css')
    .postCss('public/assets/lib/SpinKit/css/spinkit.css', 'public/css/spinkit.css')
    .postCss('public/assets/lib/datatables/css/jquery.dataTables.css', 'public/css/dataTables.css')
    .postCss('public/assets/lib/select2/css/select2.min.css', 'public/css/select2.css')
    .postCss('public/assets/css/main.css', 'public/css')
    .postCss('public/assets/css/toaster.css', 'public/css/main.css')
    .postCss('public/assets/lib/font-awesome/css/font-awesome.css', 'public/css/icons.css')
    .postCss('public/assets/lib/Ionicons/css/ionicons.css', 'public/css/icons.css');

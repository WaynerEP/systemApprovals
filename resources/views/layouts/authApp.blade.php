<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ __('Comercial - El Valle') }}</title>
    <link rel="shortcut icon" href="/assets/img/ilustrators/favicon.ico">

    <meta name="title" content="Sistema El valle">
    <meta name="description" content="Sistema de Comercial El Valle">
    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/icons.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
</head>

<body>
    <div id="app">
        <div class="signin-wrapper"
            style="background-image: url({{ asset('assets/img/ilustrators/panel-login.png') }}); background-repeat: no-repeat; background-size: cover">
            @yield('auth')
        </div>
    </div>

</body>

</html>

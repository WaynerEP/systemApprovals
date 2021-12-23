<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/icons.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">

</head>

<body>
    <div id="app" class="d-md-flex flex-row-reverse">
        <div class="signin-right">
            @yield('auth')
        </div>
        <div class="signin-left"
            style="background-image: url('/assets/img/blue-panel-bg-image.png'); background-repeat: no-repeat; background-size: cover">
            <div class="signin-box text-white">
                <h2 class="slim-logo"><a href="{{ route('login') }}">El Valle<span>.</span></a></h2>

                <p class="">We are excited to launch our new company and product. After being featured
                    in too many magazines
                    to mention and having created an online stir, we know that ThemePixels is going to be big. We also
                    hope to win Startup Fictional Business of the Year this year.</p>

                <p>Navegue por nuestro sitio y compruebe usted mismo por qué somos la mejor comercial del Valle.</p>

                <p><a href="#" class="btn btn-secondary pd-x-25">Ver más</a></p>

                <p class="tx-12">© Copyright 2018. Todos los derechos reservados.</p>
            </div>
        </div>
    </div>
</body>

</html>

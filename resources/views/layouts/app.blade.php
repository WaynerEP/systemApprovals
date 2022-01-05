<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ __('Comercial - El Valle') }}</title>
    <link rel="shortcut icon" href="/assets/img/favicon/apple-icon-57x57.png">

    <meta name="title" content="Sistema El valle">
    <meta name="description" content="Sistema de Comercial El Valle">
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <!-- Preloader -->
    <script src="{{ asset('js/loader.js') }}"></script>
    <link href="{{ asset('css/loader.css') }}" rel="stylesheet">
    <!-- styles app -->
    @include('layouts.themes.styles')
</head>

<body class="">
    <!-- Preloader -->
    <div id="preloader-area">
        <div class="lds-ripple">
            <div></div>
            <div></div>
        </div>
    </div>
    <!-- Preloader -->
    <div id="app">
        @include('layouts.themes.header')
        @include('layouts.themes.navbar')
        <!-- Main Content -->
        <div class="slim-mainpanel">
            <div class="container">
                <div class="slim-pageheader">
                    <ol class="breadcrumb slim-breadcrumb">
                        @yield('navigation')
                    </ol>
                    <h6 class="slim-pagetitle">
                        @yield('title')
                    </h6>
                </div>

                @yield('content')
            </div>
        </div>
        @include('layouts.themes.footer')
    </div>
    @include('layouts.themes.scripts')
    @yield('scripts')
</body>

</html>

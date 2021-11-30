<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Preloader -->
    <script src="{{ asset('js/loader.js') }}"></script>
    <!-- Preloader -->

    <!-- Preloaders  -->
    <style>
        @keyframes spinner-border {
            to {
                transform: rotate(360deg);
            }
        }

        .spinner-border {
            display: inline-block;
            width: 2rem;
            height: 2rem;
            vertical-align: text-bottom;
            border: 0.25em solid currentColor;
            border-right-color: transparent;
            border-radius: 50%;
            -webkit-animation: spinner-border .75s linear infinite;
            animation: spinner-border .75s linear infinite;
        }

        .spinner-border-sm {
            width: 1rem;
            height: 1rem;
            border-width: 0.2em;
        }

    </style>
    <!-- Styles -->
    <link href="{{ asset('css/loader.css') }}" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/icons.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <link href="{{ asset('css/theme-2.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/lib/SpinKit/css/spinkit.css') }}" rel="stylesheet">

</head>

<body class="slim-sticky-header">
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
                    @yield('title')
                </div>

                @yield('content')

            </div>
        </div>

        @include('layouts.themes.footer')
    </div>

    @include('layouts.themes.scripts')
</body>

</html>

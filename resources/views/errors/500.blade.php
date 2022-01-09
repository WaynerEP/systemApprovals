<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Error 500</title>
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
</head>

<body>
    <div class="page-error-wrapper">
        <div>
            <h1 class="error-title">500</h1>
            <h5 class="tx-sm-24 tx-normal">Oopps. Error de servidor interno.</h5>
            <p class="mg-b-50">El servidor encontró un error interno del servidor y no pudo completar su solicitud.</p>
            <p class="mg-b-50"><a href="{{ route('home') }}" class="btn btn-error">Ir a inicio</a></p>
            <p class="error-footer">&copy; Copyright 2021. Todos los derechos reservados. Comercial El Valle.</p>
        </div>

    </div><!-- page-error-wrapper -->
</body>

</html>

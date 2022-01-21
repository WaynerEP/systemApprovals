@extends('layouts.App')

@section('title')
    Listado de Solicitudes
    <a href="{{ route('purchase-request.create') }}" class="ml-3 messages-compose text-warning"><i
            class="icon ion-compose"></i></a>
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Solicitudes</li>
@endsection
@section('content')
    <listar-solicitudes></listar-solicitudes>
@endsection

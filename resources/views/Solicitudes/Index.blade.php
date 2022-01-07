@extends('layouts.App')

@section('title')
    Nueva Solicitud
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Solicitudes</li>
@endsection
@section('content')
    <div class="card card-invoice">
       Hello Listado de Solicitudes
    </div>
@endsection

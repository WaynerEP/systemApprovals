@extends('layouts.App')

@section('title')
    Nueva Solicitud
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item"><a href="{{ route('purchase-request.list') }}">Listado</a></li>
    <li class="breadcrumb-item active" aria-current="page">Nueva Solicitud</li>
@endsection
@section('content')
    <div class="card card-invoice">
        <solicitud-component :empleado="{{ json_encode($data) }}"></solicitud-component>
    </div>
@endsection

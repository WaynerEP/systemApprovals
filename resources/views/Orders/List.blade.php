@extends('layouts.App')
@section('title')
    Mis Solicitudes de Compra
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Solicitudes</li>
@endsection
@section('content')
    <list-solicitudes :user_id="{{ json_encode(Auth::user()->code_empleado) }}"
        :user_name="{{ json_encode(Auth::user()->name) }}"></list-solicitudes>
@endsection

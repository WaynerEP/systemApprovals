@extends('layouts.App')

@section('title')
    Nueva Compra
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Nueva Compra</li>
@endsection
@section('content')
    <div class="card card-invoice">
        <nueva-compra-component :empleado="{{ json_encode($data) }}"></nueva-compra-component>
    </div>
@endsection

@extends('layouts.App')

@section('title')
    <h6 class="slim-pagetitle">Solicitudes de Compra</h6>
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Compras</li>
@endsection
@section('content')
    <div class="section-wrapper">
        <solicitudes-component></solicitudes-component>
    </div>
@endsection

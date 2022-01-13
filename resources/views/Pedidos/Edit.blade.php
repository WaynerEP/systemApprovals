@extends('layouts.App')
@section('title')
    Pedidos
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Editar</li>
@endsection
@section('content')
    <pedidos-component :detalle="{{ json_encode($data) }}" :id_edit="{{ json_encode($idPedido) }}"></pedidos-component>
@endsection

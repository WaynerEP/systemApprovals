@extends('layouts.App')
@section('title')
    Pedidos
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Pedidos</li>
@endsection
@section('content')
    <pedidos-component></pedidos-component>
@endsection

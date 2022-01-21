@extends('layouts.App')

@section('title')
    Listado de Pedidos
    <a href="{{ route('pedidos.new') }}" class="ml-3 messages-compose text-warning"><i class="icon ion-compose"></i></a>
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Listado</li>
@endsection
@section('content')
    <list-pedidos></list-pedidos>
@endsection

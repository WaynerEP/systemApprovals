@extends('layouts.App')

@section('title')
    Mi Perfil
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="#">Inicio</a></li>
    <li class="breadcrumb-item"><a href="#">Info</a></li>
    <li class="breadcrumb-item active" aria-current="page">Perfil</li>
@endsection

@section('content')
    <user-profile></user-profile>
@endsection

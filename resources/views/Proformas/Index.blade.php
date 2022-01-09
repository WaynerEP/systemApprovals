@extends('layouts.App')
@section('title')
    Adjuntar Proformas
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Listado</li>
@endsection
@section('content')
    <list-proformas></list-proformas>
@endsection

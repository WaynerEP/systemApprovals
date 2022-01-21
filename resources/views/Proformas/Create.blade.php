@extends('layouts.App')
@section('title')
    Adjuntar Proformas
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item"><a href="{{ route('proformas.list') }}">Listado</a></li>
    <li class="breadcrumb-item active" aria-current="page">Proformas</li>
@endsection
@section('content')
    <div class="row">
        <div class="col-lg-12 mg-lg-t-0">
            <proformas-component></proformas-component>
        </div>
    </div>
@endsection

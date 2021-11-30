@extends('layouts.App')

@section('title')
    <h6 class="slim-pagetitle">Permisos</h6>
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Permisos</li>
@endsection
@section('content')
    <div class="row">
        <div class="col-lg-12 mg-lg-t-0">
            <permissions-component></permissions-component>
        </div>
    </div>

@endsection

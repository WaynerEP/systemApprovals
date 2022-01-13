@extends('layouts.App')
@section('title')
    <h6 class="slim-pagetitle">Personas</h6>
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item"><a href="{{ url('empleados') }}">Empleados</a></li>
    <li class="breadcrumb-item active" aria-current="page">Crear</li>
@endsection


@section('scripts')
    <script src="{{ asset('js/city.js') }}"></script>
@endsection

@extends('layouts.App')
@section('title')
    Roles
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Roles</li>
@endsection
@section('content')
    <roles-component></roles-component>
@endsection

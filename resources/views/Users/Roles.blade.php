@extends('layouts.App')
@section('title')
    <h6 class="slim-pagetitle">Roles</h6>
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Roles</li>
@endsection
@section('content')
    <roles-component></roles-component>
@endsection

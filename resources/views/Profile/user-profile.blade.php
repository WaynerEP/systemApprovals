@extends('layouts.App')

@section('title')
    Mi Perfil
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Perfil</li>
@endsection

@section('content')
    <user-profile :user_id="{{ json_encode(Auth::user()->id) }}"></user-profile>
@endsection

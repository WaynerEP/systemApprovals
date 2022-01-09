@extends('layouts.App')
@section('title')
<h6 class="slim-pagetitle">Providers</h6>
@endsection
@section('navigation')
<li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
<li class="breadcrumb-item active" aria-current="page">Providers</li>
@endsection
@section('content')
<div class="row">
    <div class="col-lg-12 mg-lg-t-0">
        <providers-component></providers-component>
    </div>
</div>
@endsection
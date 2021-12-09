@extends('layouts.App')
@section('title')
<h6 class="slim-pagetitle">Productos</h6>
@endsection
@section('navigation')
<li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
<li class="breadcrumb-item active" aria-current="page">Products</li>
@endsection
@section('content')
<div class="row">
    <div class="col-lg-12 mg-lg-t-0">
        <products-component></products-component>
    </div>
</div>
@endsection
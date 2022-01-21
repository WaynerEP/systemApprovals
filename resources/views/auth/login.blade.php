@extends('layouts.authApp')

@section('auth')
    <form class="signin-box rounded-5" method="POST" action="{{ route('login') }}" class="needs-validation">
        @csrf
        <h2 class="slim-logo"><a href="index.html">El valle<span>.</span></a></h2>
        <h4 class="signin-title-secondary">{{ __('Inicia sesión para continuar.') }}</h4>

        <div class="form-group">
            <input id="email" type="email" class="form-control rounded-5 @error('email') is-invalid @enderror" name="email"
                placeholder="Email" tabindex="1" value="{{ old('email') }}" required autocomplete="email" autofocus>

            @error('email')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
        </div><!-- form-group -->

        <div class="form-group mg-b-20">
            <input id="password" type="password" class="form-control rounded-5 @error('password') is-invalid @enderror"
                name="password" placeholder="Contraseña" tabindex="2" required autocomplete="current-password">

            @error('password')
                <div class="invalid-feedback" role="alert">
                    {{ $message }}
                </div>
            @enderror
            @if (Route::has('password.request'))
                <a href="{{ route('password.request') }}" class="tx-12 d-block mg-t-10">
                    ¿Olvidaste tu contraseña?
                </a>
            @endif
        </div>

        <button type="submit" class="btn btn-primary btn-block btn-signin rounded-5"><i class="fa fa-sign-in"></i>
            {{ __('Login') }}</button>

        <div class="signup-separator"><span>o</span></div>
        <a href="{{ route('auth-google') }}"
            class="btn btn-facebook btn-block rounded-5 d-flex justify-content-center text-white">Iniciar
            sesión usando Google <div class="ml-2"><i class="fa fa-google-plus"></i></div></a>

        @if (session('errorAuthGoogle'))
            <error-login></error-login>
        @endif
    </form>
@endsection

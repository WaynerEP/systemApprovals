@extends('layouts.authApp')

@section('auth')
    <form class="signin-box" method="POST" action="{{ route('login') }}" class="needs-validation">
        @csrf
        <h2 class="signin-title-primary">{{ __('¡Bienvenido de nuevo!') }}</h2>
        <h4 class="signin-title-secondary">{{ __('Inicia sesión para continuar.') }}</h4>

        <div class="form-group">
            <label for="email">{{ __('E-Mail Address') }}</label>
            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email"
                placeholder="Enter your email" tabindex="1" value="{{ old('email') }}" required autocomplete="email"
                autofocus>

            @error('email')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
        </div><!-- form-group -->

        <div class="form-group">
            <label for="password" class="control-label">{{ __('Password') }}</label>
            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password"
                placeholder="Enter your password" tabindex="2" required autocomplete="current-password">

            @error('password')
                <div class="invalid-feedback" role="alert">
                    {{ $message }}
                </div>
            @enderror
        </div>

        <div class="form-group">
            <label class="ckbox">
                <input type="checkbox" name="remember" tabindex="3" id="remember-me"
                    {{ old('remember') ? 'checked' : '' }}><span>{{ __('Remember Me') }}</span>
            </label>
        </div>

        <div class="form-group text-right">
            @if (Route::has('password.request'))
                <a href="{{ route('password.request') }}" class="float-left mt-3">
                    Forgot Password?
                </a>
            @endif
            <button type="submit" class="btn btn-primary btn-signin" tabindex="4">
                <i class="fa fa-sign-in"></i>
                {{ __('Login') }}
            </button>
        </div>

        <div class="signup-separator"><span>o</span></div>
        <a href="{{ route('auth-google') }}" class="btn btn-facebook btn-block d-flex justify-content-center text-white">Iniciar
            sesión usando Google <div class="ml-2"><i class="fa fa-google-plus"></i></div></a>
    </form>
@endsection

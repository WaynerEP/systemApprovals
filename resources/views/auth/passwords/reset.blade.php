@extends('layouts.authApp')

@section('auth')
    <form class="signin-box rounded-5" method="POST" action="{{ route('password.update') }}" class="needs-validation">
        @csrf

        <input type="hidden" name="token" value="{{ $token }}">
        <h2 class="slim-logo"><a href="{{ route('login') }}">El valle<span>.</span></a></h2>
        <h2 class="signin-title-primary">Restablecer contraseña</h2>
        <h6 class="signin-title-secondary">Complete los siguientes campos, para restablecer su contraseña.</h6>

        <div class="form-group">
            <label for="email">{{ __('E-Mail Address') }}</label>

            <input id="email" type="email" class="form-control rounded-5 @error('email') is-invalid @enderror" name="email"
                value="{{ $email ?? old('email') }}" required autocomplete="email" autofocus>

            @error('email')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror
        </div>

        <div class="form-group">
            <label for="password">{{ __('Password') }}</label>

            <input id="password" type="password" class="form-control rounded-5 @error('password') is-invalid @enderror"
                name="password" required autocomplete="new-password">

            @error('password')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror
        </div>

        <div class="form-group">
            <label for="password-confirm">{{ __('Confirm Password') }}</label>

            <input id="password-confirm" type="password" class="form-control rounded-5" name="password_confirmation"
                required autocomplete="new-password">
        </div>

        <button type="submit" class="btn btn-primary btn-block btn-signin rounded-5">
            {{ __('Reset Password') }}
        </button>

    </form>
@endsection

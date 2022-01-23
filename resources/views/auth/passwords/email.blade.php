@extends('layouts.authApp')

@section('auth')
    <form class="signin-box rounded-5" method="POST" action="{{ route('password.email') }}" class="needs-validation">
        @csrf
        <h2 class="slim-logo"><a href="{{ route('login') }}">El valle<span>.</span></a></h2>
        <h2 class="signin-title-primary">Has olvidado tu contraseña</h2>
        <h6 class="signin-title-secondary">Le enviaremos un enlace para restablecer su contraseña.
        </h6>

        @if (session('status'))
            <message-notification message="{{ session('status') }}" type="success"></message-notification>
        @endif

        <div class="form-group mg-b-50">
            <label for="email">{{ __('E-Mail Address') }}</label>
            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror rounded-5" name="email"
                value="{{ old('email') }}" tabindex="1" required autocomplete="email" autofocus>
            @error('email')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror
        </div>

        <button type="submit" class="btn btn-primary btn-block btn-signin rounded-5" tabindex="4">
            {{ __('Enviar link') }}
        </button>

    </form>
@endsection

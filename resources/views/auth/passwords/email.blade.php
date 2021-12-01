@extends('layouts.authApp')

@section('auth')
    <form class="signin-box" method="POST" action="{{ route('password.email') }}" class="needs-validation">
        @csrf
        <h2 class="signin-title-primary">{{ __('Forgot Password') }}</h2>
        <h6 class="signin-title-secondary">{{ __('We will send a link to reset your password.') }}</h6>

        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif

        <div class="form-group mg-b-50">
            <label for="email">{{ __('E-Mail Address') }}</label>
            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email"
                value="{{ old('email') }}" tabindex="1" required autocomplete="email" autofocus>
            @error('email')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror
        </div>

        <button type="submit" class="btn btn-primary btn-block btn-signin" tabindex="4">
            {{ __('Send Password Reset Link') }}
        </button>

    </form>
@endsection

@extends('layouts.authApp')

@section('auth')
    <div class="d-flex flex-wrap align-items-stretch">
        <div class="col-lg-4 col-md-6 col-12 order-lg-1 min-vh-100 order-2 bg-white">
            <div class="p-4 m-3">
                <img src="../assets/img/stisla-fill.svg" alt="logo" width="80" class="shadow-light rounded-circle mb-5 mt-2">
                <h4 class="text-dark font-weight-normal">Welcome to the <span class="font-weight-bold">Sistema</span>
                </h4>
                <p class="text-muted">Before you get started, you must login or register if you don't already
                    have an account.</p>
                <form method="POST" action="{{ route('login') }}" class="needs-validation">
                    @csrf

                    <div class="form-group">
                        <label for="email">{{ __('E-Mail Address') }}</label>
                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email"
                            tabindex="1" value="{{ old('email') }}" required autocomplete="email" autofocus>

                        @error('email')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="form-group">
                        <div class="d-block">
                            <label for="password" class="control-label">{{ __('Password') }}</label>
                        </div>
                        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror"
                            name="password" tabindex="2" required autocomplete="current-password">

                        @error('password')
                            <div class="invalid-feedback" role="alert">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="form-group">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" name="remember" class="custom-control-input" tabindex="3"
                                id="remember-me" {{ old('remember') ? 'checked' : '' }}>
                            <label class="custom-control-label" for="remember-me">{{ __('Remember Me') }}</label>
                        </div>
                    </div>

                    <div class="form-group text-right">
                        @if (Route::has('password.request'))
                            <a href="{{ route('password.request') }}" class="float-left mt-3">
                                Forgot Password?
                            </a>
                        @endif
                        <button type="submit" class="btn btn-primary btn-lg btn-icon icon-right" tabindex="4">
                            {{ __('Login') }}
                        </button>
                    </div>

                </form>

                <div class="text-center mt-5 text-small">
                    {{ __('Copyright © Your Company. Made with 💙 by NJWI') }}
                    <div class="mt-2">
                        <a href="#">{{ __('Privacy Policy') }}</a>
                        <div class="bullet"></div>
                        <a href="#">{{ __('Terms of Service') }}</a>
                    </div>
                </div>
            </div>
        </div>
        @include('auth.login-bg')
    </div>
@endsection

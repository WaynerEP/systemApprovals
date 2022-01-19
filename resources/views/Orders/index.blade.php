<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700,900&display=swap" rel="stylesheet">
    <title>Enviar Respuesta</title>
    <link rel="shortcut icon" href="https://cdn.sstatic.net/Sites/es/img/favicon.ico?v=a8def514be8a">
    <!-- Bootstrap CSS -->
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <!-- Style -->
    <link rel="stylesheet" href="{{ asset('css/email.css') }}">
</head>
<body>
    <div id="app" class="d-md-flex flex-row-reverse">
        <div class="signin-right">

            @if (Session::has('successfully'))
                <div class="signin-box text-center">
                    <h3 class="signin-title-primary">{!! Session::get('successfully') !!}</h3>
                    <a href="{{ route('home') }}" class="btn btn-primary mt-2">
                        Ir a mi cuenta
                    </a>
                </div>
            @else
                @if (!$user)
                    <form class="signin-box" method="POST" action="{{ route('response-request') }}">
                        @csrf
                        <h3 class="signin-title-primary">ENVIA TU RESPUESTA A LA SOLICITUD</h3>

                        <label class="section-label-sm tx-gray-500 mt-4">Debe responder este formulario, unicamente si ha
                            revisado la solicitud de compra.</label>
                        <input type="hidden" name="solicitud" value="{{ $idSolicitud }}">
                        <input type="hidden" name="employee" value="{{ $idEmpleado }}">
                        <input type="hidden" name="option" value="op">

                        <div class="row mt-5">
                            <div class="col-md-12 form-group">
                                <label class="form-control-label">Mensaje: <span class="tx-danger">*</span></label>
                                <textarea class="form-control @error('mensaje') is-invalid @enderror" value="{{ old('mensaje') }}" name="mensaje"
                                     cols="30" rows="4"
                                    placeholder="Ingrese su mensaje" required></textarea>
                                @error('mensaje')
                                    <div class="invalid-feedback d-block" role="alert">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group"><label class="rdiobox">
                                <input name="estado" type="radio" value="A" required>
                                <span>Aprobar</span>
                            </label>
                            <label class="rdiobox">
                                <input name="estado" type="radio" value="R" required>
                                <span>Rechazar</span>
                            </label>
                            @error('estado')
                                <div class="invalid-feedback d-block" role="alert">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="row mt-4">
                            <div class="col-md-12 form-group text-center">
                                <button type="submit" class="btn btn-primary">
                                    Enviar Respuesta
                                </button>
                            </div>
                        </div>
                    </form>
                @else
                    <div class="signin-box text-center">
                        <h3 class="signin-title-primary">No es posible realizar ninguna acción, al parecer usted ya ha
                            respondido a este formulario. Gracias!!</h3>
                        <a href="{{ route('home') }}" class="btn btn-primary mt-2">
                            Ir a mi cuenta
                        </a>
                    </div>
                @endif
            @endif

        </div>
        <div class="signin-left bg-image"> </div>
    </div>
</body>

</html>

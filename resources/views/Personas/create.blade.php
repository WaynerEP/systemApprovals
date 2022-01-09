@extends('layouts.App')
@section('title')
    Personas
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item"><a href="{{ url('personas') }}">Personas</a></li>
    <li class="breadcrumb-item active" aria-current="page">Crear</li>
@endsection
@section('content')
    <div class="section-wrapper">
        <label class="section-title">Nuevo</label>
        <p class="mg-b-20 mg-sm-b-40">Crea tus contactos para asociarlos en los documentos y transacciones que
            registres a su nombre...</p>

        <div class="row">
            <div class="col-lg-12">
                <form class="card px-5 pt-4 mx-5" method="POST" action="{{ route('personas.store') }}">
                    @csrf
                    <div class="card-body px-5">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="inputEmail4">Número (RUC, DNI, Etc.)</label>
                                <div class="input-group justify-content-center">
                                    <input type="number" size="8" min="0" minlength="8" maxlength="8"
                                        class="form-control @error('dni') is-invalid @enderror" name="dni"
                                        value="{{ old('dni') }}"
                                        oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                        autofocus />

                                    <div class="ml-2">
                                        <button type="button" class="btn btn-primary btn-sm">
                                            <i class="fas fa-search"></i> Extraer?
                                        </button>
                                    </div>
                                </div>
                                @error('dni')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="col-1"></div>
                            <div class="form-group col-md-7">
                                <label>Tipo de identificación</label>
                                <select class="custom-select">
                                    <option>RUC - Registro único de contribuyente</option>
                                    <option selected>
                                        DNI - Documento nacional de identidad
                                    </option>
                                    <option>CE - Carnet de extranjería</option>
                                    <option>PP - Pasaporte</option>
                                    <option>PP - Pasaporte</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmailName">Nombres</label>
                                <input type="text" class="form-control @error('nombres') is-invalid @enderror"
                                    name="nombres" id="inputEmailName" value="{{ old('nombres') }}" placeholder="" />
                                @error('nombres')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputEmailLastName">Apellidos</label>
                                <input type="text" class="form-control @error('apellidos') is-invalid @enderror"
                                    name="apellidos" id="inputEmailLastName" placeholder=""
                                    value="{{ old('apellidos') }}" />
                                @error('apellidos')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Nacimiento</label>
                                <input type="date" class="form-control @error('nacimiento') is-invalid @enderror" id="date1"
                                    name="nacimiento" value="{{ old('nacimiento') }}" placeholder="" />
                                @error('nacimiento')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label class="d-block text-center">Género</label>
                                <div class="text-center mt-1">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input @error('sexo') is-invalid @enderror" type="radio"
                                            id="inlineradio1" name="sexo" value="M" />
                                        <label class="form-check-label" for="inlineradio1">Masculino</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input @error('sexo') is-invalid @enderror" type="radio"
                                            id="inlineradio2" name="sexo" value="F" />
                                        <label class="form-check-label" for="inlineradio2">Femenino</label>
                                    </div>
                                </div>
                                @error('sexo')
                                    <div class="invalid-feedback d-block text-center">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="inputDepa">Departamento</label>
                                <select class="custom-select @error('departamento') is-invalid @enderror" id="departamentos"
                                    name="departamento">
                                    <option value="">Seleccione</option>
                                    @foreach ($departamentos as $d)
                                        <option value="{{ $d->codDepartamento }}">{{ $d->departamento }}</option>
                                    @endforeach
                                </select>
                                @error('departamento')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-4">
                                <label for="provincias">Provincias</label>
                                <select class="custom-select @error('provincia') is-invalid @enderror" id="provincias"
                                    name="provincia">
                                    <option value="">Seleccione</option>
                                </select>
                                @error('provincia')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-4">
                                <label for="distritos">Distrito</label>
                                <select class="custom-select @error('distrito') is-invalid @enderror" id="distritos"
                                    name="distrito">
                                    <option value="">Seleccione</option>
                                </select>
                                @error('distrito')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputAddress">Dirección</label>
                                <textarea class="form-control @error('direccion') is-invalid @enderror" name="direccion"
                                    value="{{ old('direccion') }}"></textarea>
                                @error('direccion')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputReferencia">Referencia</label>
                                <textarea class="form-control @error('referencia') is-invalid @enderror" name="referencia"
                                    value="{{ old('referencia') }}"></textarea>
                                @error('referencia')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputLevel">Nivel de Estudios</label>
                                <select class="custom-select @error('nivel') is-invalid @enderror" name="nivel">
                                    <option value="">Seleccione</option>
                                    @foreach ($estudios as $d)
                                        <option value="{{ $d->idNivel }}">{{ $d->nivel }}</option>
                                    @endforeach
                                </select>
                                @error('nivel')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label for="email">Correo electrónico</label>
                                <input type="email" class="form-control @error('correo') is-invalid @enderror" id="email"
                                    name="correo" value="{{ old('correo') }}" placeholder="" />
                                @error('correo')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputPhone1">Teléfono 1</label>
                                <input type="number" class="form-control @error('telefono') is-invalid @enderror"
                                    id="inputPhone1" name="telefono1" value="{{ old('telefono') }}" placeholder="" />
                                @error('telefono')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPhone2">Teléfono 2</label>
                                <input type="text" class="form-control @error('telefono2') is-invalid @enderror"
                                    id="inputPhone2" name="telefono2" value="{{ old('telefono2') }}" placeholder="" />
                                @error('telefono2')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="mb-5 text-right text-white">
                        <button type="submit" class="btn btn-primary mr-1">
                            Guardar
                        </button>
                        <a href="{{ url('personas') }}" class="btn btn-secondary">
                            Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script src="{{ asset('js/createPerson.js') }}"></script>
@endsection

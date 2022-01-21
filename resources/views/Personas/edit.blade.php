@extends('layouts.App')
@section('title')
    Personas
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item"><a href="{{ route('personas.index') }}">Personas</a></li>
    <li class="breadcrumb-item active" aria-current="page">Editar</li>
@endsection
@section('content')
    <div class="section-wrapper">
        <label class="section-title">EDITAR</label>
        <p class="mg-b-20 mg-sm-b-40">Edita tus contactos para asociarlos en los documentos y transacciones que
            registres a su nombre...</p>

        <div class="row">
            <div class="col-lg-12">
                <form method="POST" action="{{ route('personas.update', $data[0]->dniCiudadano) }}">
                    @csrf
                    <input name="_method" type="hidden" value="PATCH" />
                    <div class="card-body">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="">Número (RUC, DNI, Etc.)</label>
                                <div class="input-group justify-content-center">
                                    <input type="text" disabled="" class="form-control" name="dni"
                                        value="{{ $data[0]->dniCiudadano }}" required />

                                    <div class="ml-2">
                                        <button type="button" disabled class="btn btn-primary btn-sm">
                                            <i class="fas fa-search"></i> Extraer?
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-1"></div>
                            <div class="form-group col-md-7">
                                <label>Tipo de identificación</label>
                                <select class="custom-select" disabled required>
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
                                    name="nombres" id="inputEmailName" value="{{ $data[0]->nombres }}" placeholder=""
                                    required />
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
                                    value="{{ $data[0]->apellidos }}" required />
                                @error('apellidos')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="date1">Nacimiento</label>
                                <input type="date" class="form-control @error('nacimiento') is-invalid @enderror" id="date1"
                                    name="nacimiento" value="{{ $data[0]->fechaNacimiento }}" required />
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
                                            id="inlineradio1" name="sexo" value="M"
                                            checked="{{ $data[0]->sexo == 'm' || $data[0]->sexo == 'M' }}" />
                                        <label class="form-check-label" for="inlineradio1">Masculino</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input @error('sexo') is-invalid @enderror" type="radio"
                                            id="inlineradio2" name="sexo" value="F"
                                            {{ $data[0]->sexo == 'f' || $data[0]->sexo == 'F' }} />
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
                                    required name="departamento">
                                    <option value="">Seleccione</option>
                                    @foreach ($departamentos as $d)
                                        <option {{ $d->codDepartamento == $data[0]->codDepartamento ? 'selected' : '' }}
                                            value="{{ $d->codDepartamento }}">{{ $d->departamento }}</option>
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
                                    name="provincia" required>
                                    <option value="">Seleccione</option>
                                </select>
                                @error('provincia')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-4">
                                <label for="distritos">Distritos</label>
                                <select class="custom-select @error('distrito') is-invalid @enderror" id="distritos"
                                    name="distrito" required>
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
                                <input type="text" class="form-control @error('direccion') is-invalid @enderror"
                                    name="direccion" value="{{ $data[0]->direccion }}" required />
                                @error('direccion')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputReferencia">Referencia</label>
                                <input type="text" class="form-control @error('referencia') is-invalid @enderror"
                                    name="referencia" value="{{ $data[0]->referencia }}" />
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
                                <select class="custom-select @error('nivel') is-invalid @enderror" name="nivel" required>
                                    <option value="">Seleccione</option>
                                    @foreach ($estudios as $d)
                                        <option {{ $d->idNivel == $data[0]->idNivel ? 'selected' : '' }}
                                            value="{{ $d->idNivel }}">{{ $d->nivel }}</option>
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
                                    name="correo" value="{{ $data[0]->correo }}" placeholder="" required />
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
                                <input type="text" class="form-control @error('telefono') is-invalid @enderror"
                                    id="inputPhone1" name="telefono" value="{{ $data[0]->telefono1 }}" placeholder=""
                                    required />
                                @error('telefono')
                                    <div class="invalid-feedback d-block">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPhone2">Teléfono 2</label>
                                <input type="text" class="form-control @error('telefono2') is-invalid @enderror"
                                    id="inputPhone2" name="telefono2" value="{{ $data[0]->telefono2 }}" placeholder="" />
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
                            Actualizar
                        </button>
                        <a href="{{ route('personas.index') }}" class="btn btn-secondary">
                            Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        window.addEventListener('load', function() {
            var idProv = @json($data[0]->codProvincia);
            var idDist = @json($data[0]->codDistrito);
            var departamento = document.getElementById('departamentos');
            var provincias = document.getElementById('provincias');
            var distritos = document.getElementById('distritos');

            function addValuesProvincias(array, id) {
                provincias.innerHTML = `<option value="">Seleccione</option>`;
                array.forEach((element) => {
                    let selected = element.codProvincia == id ? 'selected' : '';
                    provincias.innerHTML +=
                        `<option ${selected} value="${element.codProvincia}">${element.provincia}</option>`;
                })
            }

            cargarAllData();

            function addValuesDistritos(array, id) {
                distritos.innerHTML = `<option value="">Seleccione</option>`;
                array.forEach((element) => {
                    let selected = element.codDistrito == id ? 'selected' : '';
                    distritos.innerHTML +=
                        `<option ${selected} value="${element.codDistrito}">${element.distrito}</>`;
                })
            }

            async function cargar_provincias(idDepa, idProvincia = 0) {
                const res = await axios.get(`/api/provincias/${idDepa}`);
                provincias.innerHTML = '';
                addValuesProvincias(res.data, idProvincia)

            }

            async function cargar_distritos(idProv, idDistrito = 0) {
                const res = await axios.get(`/api/distritos/${idProv}`);
                distritos.innerHTML = '';
                addValuesDistritos(res.data, idDistrito)
            }

            departamento.addEventListener('change', (e) => {
                cargar_provincias(e.target.value);
            })

            provincias.addEventListener('change', (e) => {
                cargar_distritos(e.target.value);
            })

            function cargarAllData() {
                cargar_provincias(departamento.value, idProv);
                cargar_distritos(idProv, idDist);
            }

        })
    </script>
@endsection

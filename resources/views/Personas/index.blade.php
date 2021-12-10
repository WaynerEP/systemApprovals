@extends('layouts.App')
@section('title')
    Personas
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Personas</li>
@endsection
@section('content')
    <div class="section-wrapper">
        <label class="section-title">Lista de todas las personas o contactos</label>
        <p class="mg-b-20 mg-sm-b-40">Puede ver, editar y crear un contacto. <a href="{{ route('personas.create') }}"><i
                    class="fa fa-plus"></i>
                Agregar</a></p>
        @if (Session::has('message'))

            <div class="alert alert-success" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <strong>Well done!</strong> {!! Session::get('message') !!}.
            </div>
        @endif

        <div class="table-wrapper">
            <table id="datatable1" class="table display table-bordered responsive table-sm">
                <thead>
                    <tr class="text-primary">
                        <th class="wd-10p pd-y-5">&nbsp;</th>
                        <th>Dni</th>
                        <th>Nombres</th>
                        <th>Género</th>
                        <th>Dirección</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div><!-- table-responsive -->
        <!-- table-wrapper -->
        @include('Personas.destroy')
    </div>
@endsection
@section('scripts')
    <script>
        $(function() {
            'use strict';

            $('#datatable1').DataTable({
                ajax: {
                    url: "api/dataPeople",
                    type: "GET",
                },
                columns: [{
                        data: 'btn'
                    },
                    {
                        data: 'dni'
                    },
                    {
                        data: 'fullName'
                    },
                    {
                        data: 'sexo'
                    },
                    {
                        data: 'email'
                    },
                    {
                        data: 'address'
                    },
                    {
                        data: 'phoneOne',
                    },

                ],
                responsive: true,
                language: {
                    searchPlaceholder: 'Buscar...',
                    sSearch: '',
                    lengthMenu: 'Mostrar _MENU_ ',
                }
            });

            // Select2
            $('.dataTables_length select').select2({
                minimumResultsForSearch: Infinity
            });
        });
        // 
        function ConfirmarBorrado(id) {
            $('#idPerson').val(id);
            $('#modal-confirmation').modal('show');
        }

        $('#btnEliminar').on('click', function(e) {
            e.preventDefault();
            axios.delete('personas/' + $('#idPerson').val())
                .then(function(d) {
                    console.log(d);
                    $('#modal-confirmation').modal('hide');
                    $('#datatable1').DataTable().ajax.reload();
                })
                .catch((e) => {
                    console.log(e);
                });;
        });
    </script>
@endsection

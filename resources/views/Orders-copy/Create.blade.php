@extends('layouts.App')

@section('content')
    <section class="section">

        <div class="section-header">
            <h1>Nueva orden de compra</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item"><a href="{{ route('home') }}">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="{{ route('orders') }}">Solicitudes</a></div>
                <div class="breadcrumb-item active">Create</div>
            </div>
        </div>

        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card px-5 pt-3">
                        <div class="card-header justify-content-end">   
                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="inputPassword6">No.</label>
                                    <input type="text" id="inputPassword6" class="form-control form-control-sm mx-sm-3"
                                        aria-describedby="passwordHelpInline">
                                </div>
                            </div>
                        </div>
                        <div class="card-body px-5">
                            <div class="row mb-1 px-5">
                                <div class="col-sm-6">
                                    <div class="form-group row justify-align-center">
                                        <label for="inputEmail3" class="col-sm-3 col-form-label text-right">Contacto</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control form-control-sm" id="inputEmail3"
                                                placeholder="Search">
                                        </div>
                                    </div>
                                    <div class="form-group row justify-align-center">
                                        <label for="inputEmail3"
                                            class="col-sm-3 col-form-label text-right">Identificación</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control form-control-sm" id="inputEmail3">
                                        </div>
                                    </div>
                                    <div class="form-group row justify-align-center">
                                        <label for="inputEmail3" class="col-sm-3 col-form-label text-right">Telefono</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control form-control-sm" id="inputEmail3">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group row">
                                        <label for="inputEmail3" class="col-sm-3 col-form-label text-right">Fecha</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control form-control-sm" id="inputEmail3"
                                                placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputEmail3" class="col-sm-3 col-form-label text-right">Plazo</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control form-control-sm" id="inputEmail3"
                                                placeholder="Email">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-sm">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Concepto</th>
                                            <th scope="col">Precio</th>
                                            <th scope="col">Descuento (%)</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Observaciones</th>
                                            <th class="px-4 text-center" scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td scope="row">
                                                <input type="text" class="form-control form-control-sm" id="inputEmail3"
                                                    placeholder="Search">
                                            </td>
                                            <td>
                                                <input type="number" class="form-control form-control-sm" id="inputEmail3"
                                                    placeholder="0">
                                            </td>
                                            <td>
                                                <input type="number" class="form-control form-control-sm" id="inputEmail3"
                                                    placeholder="0">
                                            </td>
                                            <td>
                                                <input type="number" class="form-control form-control-sm" id="inputEmail3"
                                                    placeholder="1">
                                            </td>
                                            <td>
                                                <input type="number" class="form-control form-control-sm" id="inputEmail3"
                                                    placeholder="1">
                                            </td>
                                            <td class="text-center">
                                                S/.0.00
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            <button type="submit" class="btn btn-outline-primary btn-sm"><i class="fas fa-plus"></i> Add
                                new row</button>

                            <div class="row mt-4">
                                <div class="col-lg-8">
                                    
                                </div>
                                <div class="col-lg-4 text-right">
                                    <div class="invoice-detail-item">
                                        <div class="invoice-detail-name">Subtotal</div>
                                        <div class="invoice-detail-value">$670.99</div>
                                    </div>
                                    <div class="invoice-detail-item">
                                        <div class="invoice-detail-name">Shipping</div>
                                        <div class="invoice-detail-value">$15</div>
                                    </div>
                                    <hr class="mt-2 mb-2">
                                    <div class="invoice-detail-item">
                                        <div class="invoice-detail-name">Total</div>
                                        <div class="invoice-detail-value invoice-detail-value-lg">$685.99</div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-5">
                                <label>Notas <i class="far fa-question-circle text-success"></i> : </label>
                                <textarea class="form-control"></textarea>
                                <small>Utiliza las notas para agregar información importante. No son visibles en la
                                    impresión.</small>
                            </div>
                        </div>
                        <div class="card-footer text-right"><button type="submit" class="btn btn-primary mr-1"> <i
                                    class="fas fa-save"></i> Guardar</button> <button type="reset"
                                class="btn btn-secondary"><i class="fas fa-arrow-alt-circle-left"></i> Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
@endsection

<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\distritosController;
use App\Http\Controllers\cargosController;
use App\Http\Controllers\Compras\PedidoController;
use App\Http\Controllers\Compras\SolicitudesController;
use App\Http\Controllers\Compras\ProformasController;
use App\Models\Organizacion;
use App\Models\Area;
use App\Models\DetallePedidos;
use App\Models\Proveedor;
use App\Models\Pedido;
use Illuminate\Support\Facades\DB;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


//Obtiene la informacion de la empresa el valle
Route::get('/info-el-valle', function () {
    return Organizacion::first();
});

//empleados que no son usuarios
Route::get('/users/employees', function () {
    return DB::select('exec spEmployeesNotUsers');
});

//Devuelve un datatable de todos los datos de personas
Route::get('/dataPeople', function () {
    $data = DB::select('exec citizens');
    return datatables()->of($data)->addColumn('btn', 'Personas.actions')->rawColumns(['btn'])->toJson();
});

//Obtiene array nivel de estudios
Route::get('/nivelEstudios', function () {
    return DB::table('nivelStudios')->get();
});

// Route::get('/areas', function () {
//     return response()->json(Area::all());
// });

// Data para provincias por departamento y distrito por Provincia
Route::get('/provincias/{idDepartamento}', [distritosController::class, 'getProvincias']);

Route::get('/distritos/{idProvincia}', [distritosController::class, 'getDistritos']);

//Data para departamentos, areas segun departamento, y cargos segun areas
Route::get('/depas', [cargosController::class, 'getDepartamentoEmpresa']);
Route::get('/depas/areas/{idDepa}', [cargosController::class, 'getAreasByDepartamento']);
Route::get('/depas/areas/cargos/{idArea}', [cargosController::class, 'getCargos']);

// Nos trae todos los proveedores que
//Nos trae todos los proveedores que
// tienen de estado 1
Route::get('/dataProviders', function () {
    $data = DB::select('exec listProviders');
    return response()->json($data);
});

// Se utiliza para actualizar un
// proveedor 
Route::get('/provider/{id}', function ($id) {
    $data = Proveedor::find($id)->first();
    return response()->json($data);
});

// Nos trae todos los ciudadanos que
// no son ni empleados ni
// proveedores
Route::get('/dataProvidersNew', function () {
    $data = DB::select('exec listProvidersNew');
    return response()->json($data);
});

// Trae todas las categorias de los
// productos
Route::get('/dataCategories', function () {
    $data = DB::select('exec spListCategories');
    return response()->json($data);
});

// Lista los productos por las distintas
// categorias
Route::get('/dataProducts/{id}', function ($id) {
    $data = DB::select('exec spListProducts ' . $id);
    return response()->json($data);
});

// Está pensado para dar mantenimiento
// a la tabla productos
Route::get('/products', function () {
    return DB::table('productos')->get();
});

// obtiene los productos para el pedido
Route::get('/products/proforma', function () {
    $data = DB::select('exec spListProductsToProforma');
    return response()->json($data);
});

//tiporecursos api
Route::apiResource('/pedidos', PedidoController::class);

//solicitudes api
Route::resource('/solicitud', SolicitudesController::class);

//proformas api
Route::resource('/proformas', ProformasController::class);


//numero de pedido se incrementa + 1
Route::get('/aprobaciones/detail/{idAprobaciones}', function ($id) {
    return response()->json(DB::select('exec spDetailAprobaciones ?', array($id)));
});


//numero de pedido se incrementa + 1
Route::get('/pedido/number', function () {
    return DB::table('pedidos')
        ->select(DB::raw('count(*) + 1 as max'))
        ->first();
});

//numero de solicitud se incrementa + 1
Route::get('/solicitudes/number', function () {
    return DB::table('solicitudes')
        ->select(DB::raw('count(*) + 1 as max'))
        ->first();
});

//ruta para traer los pedidos recientes sin proformas
Route::get('/proformas/pedidos', function () {
    return response()->json(DB::select('exec spPedidosNotProformas'));
});

//ruta para traer los pedidos recientes sin solicitudes y con proformas
Route::get('/solicitudes/pedidos', function () {
    return response()->json(DB::select('exec spPedidosNotSolicitudes'));
});

//ruta para traer los pedidos recientes sin solicitudes y con proformas
Route::get('/pedidos/detalle/{idPedido}', function ($idPedido) {
    $detalle = DetallePedidos::join('productos as p', 'p.idProducto', '=', 'detallePedidos.idProducto')
        ->select('detallePedidos.idPedido', 'p.idProducto', 'p.image', 'p.medida', 'p.descripcionProducto', 'detallePedidos.cantidad', 'detallePedidos.costoUnitario')
        ->where('detallePedidos.idPedido', '=', $idPedido)
        ->get();
    return response()->json($detalle);
});

//ruta para traer los 3 mejores proformas
Route::get('/pedidos/{idPedido}/proformas', function ($idPedido) {
    return response()->json(DB::select('exec spProformasMenorPrecio ' . $idPedido));
});

//devuelve las ordenes por aprobar de un empleado
Route::get('/orders/list/{id}/{status}', function ($id, $status) {
    $data = DB::select('Exec spOrdersListByEmpleado ?,?', array($id, $status));
    return response()->json($data);
});

//devuelve los datos el usuario
Route::get('/user-profile/{user_id}', function ($user_id) {
    $user_info = DB::select('Exec spUserProfile ?', array($user_id));
    return response()->json($user_info);
});

//

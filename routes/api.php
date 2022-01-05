<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\distritosController;
use App\Http\Controllers\cargosController;
use App\Models\Organizacion;
use App\Models\Area;
use App\Models\Proveedor;
use App\Models\Pedido;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

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

<<<<<<< HEAD
// Nos trae todos los proveedores que
=======
//Nos trae todos los proveedores que
>>>>>>> ad1bc9bae672d93da8bc46ab1e6332d330e06c88
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
<<<<<<< HEAD
 
=======

>>>>>>> ad1bc9bae672d93da8bc46ab1e6332d330e06c88
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

//numero de pedido se incrementa + 1
Route::get('/pedidos/number', function () {
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
    return Pedido::where('estado', '0')->get();
});

Route::apiResource('savesPdfsProforma', \App\Http\Controllers\Solicitudes\PDFsControleer::class);

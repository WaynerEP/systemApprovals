<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\distritosController;
use App\Http\Controllers\cargosController;
use App\Models\Organizacion;
use App\Models\Area;
use App\Models\Proveedor;
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

Route::get('/info-el-valle', function () {
    return Organizacion::first();
});

Route::get('/users/employees', function () {
    return DB::select('exec spEmployeesNotUsers');
});

Route::get('/dataPeople', function () {
    $data = DB::select('exec citizens');
    return datatables()->of($data)->addColumn('btn', 'Personas.actions')->rawColumns(['btn'])->toJson();
});

Route::get('/nivelEstudios', function () {
    return DB::table('nivelStudios')->get();
});

// Route::get('/areas', function () {
//     return response()->json(Area::all());
// });

// obtener  provincias por departamento
Route::get('/provincias/{idDepartamento}', [distritosController::class, 'getProvincias']);

Route::get('/distritos/{idProvincia}', [distritosController::class, 'getDistritos']);


Route::get('/depas', [cargosController::class, 'getDepartamentoEmpresa']);
Route::get('/depas/areas/{idDepa}', [cargosController::class, 'getAreasByDepartamento']);
Route::get('/depas/areas/cargos/{idArea}', [cargosController::class, 'getCargos']);


Route::get('/dataProviders', function () {
    $data = DB::select('exec listProviders');
    return response()->json($data);
});

Route::get('/provider/{id}', function ($id) {
    $data = Proveedor::find($id)->first();
    return response()->json($data);
});

Route::get('/dataProvidersNew', function () {
    $data = DB::select('exec listProvidersNew');
    return response()->json($data);
});

Route::get('/dataCategories', function () {
    $data = DB::select('exec spListCategories');
    return response()->json($data);
});

Route::get('/dataProducts/{id}', function ($id) {
    $data = DB::select('exec spListProducts ' . $id);
    return response()->json($data);
});

Route::get('/products', function () {
    return DB::table('productos')->get();
});

Route::get('/products/proforma', function () {
    $data = DB::select('exec spListProductsToProforma');
    return response()->json($data);
});

Route::apiResource('savesPdfsProforma', \App\Http\Controllers\Solicitudes\PDFsControleer::class);

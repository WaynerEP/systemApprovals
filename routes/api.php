<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\distritosController;
use App\Http\Controllers\cargosController;
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


Route::get('/departamentos', [distritosController::class, 'getAllDepartamentos']);

Route::get('/nivelEstudios', function () {
    return DB::table('nivelEstudios')->get();
});


Route::get('/provincias/{idDepartamento}', [distritosController::class, 'getProvincias']);

Route::get('/distritos/{idProvincia}', [distritosController::class, 'getDistritos']);


Route::get('/depas', [cargosController::class, 'getDepartamentoEmpresa']);
Route::get('/depas/areas/{idDepa}', [cargosController::class, 'getAreasByDepartamento']);
Route::get('/depas/areas/cargos/{idArea}', [cargosController::class, 'getCargos']);


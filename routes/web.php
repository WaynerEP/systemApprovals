<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Users\UserController;
use App\Http\Controllers\Users\RolesController;
use App\Http\Controllers\Users\PermissionsController;
use App\Http\Controllers\PersonaController;
use App\Http\Controllers\Providers\ProviderController;
use App\Http\Controllers\Compras\PedidoController;
use App\Http\Controllers\Compras\ProformasController;
use App\Http\Controllers\Aprobaciones\orderController;
use App\Http\Controllers\Compras\SolicitudesController;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Profile\UserProfileController;

use App\Http\Controllers\Products\ProductController;

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::get('/login-google', [\App\Http\Controllers\Auth\LoginController::class, 'redirectToGoogle'])
    ->name('auth-google');

Route::get('/google-callback', [App\Http\Controllers\Auth\LoginController::class, 'authWithGoogle']);

// Management Users
Route::middleware('auth')->group(function () {

    // rutas administracion de usuarios
    Route::get('management/users', function () {
        return view('Users.User');
    })->name('users');

    Route::get('management/roles', function () {
        return view('Users.Roles');
    })->name('roles');

    Route::get('management/permissions', function () {
        return view('Users.Permissions');
    })->name('permissions');


    // ruta personas
    Route::get('contacts/people/create', function () {
        return view('Personas.Create');
    });

    //ruta empleados
    Route::get('contacts/employees', function () {
        return view('Empleados.Index');
    })->name('employees');

    //ruta proveedores
    Route::get('contacts/providers', function () {
        return view('Proveedores.Index');
    })->name('providers');


    //ruta productos
    Route::get('/items/products', function () {
        return view('Items.Products');
    })->name('items');

    // //ruta categorias
    // Route::get('/items/categories', function () {
    //     return view('Items.Categories');
    // })->name('categories');


    // Rutas para pedidos
    Route::view('/compras-pedidos', 'Pedidos.Create')
        ->name('pedidos.new');

    // Rutas para listar pedidos 
    Route::view('/compras-pedidos/list', 'Pedidos.Index')
        ->name('pedidos.list');
    // end ruta pedidos

    // Rutas para proformas
    Route::view('/compras-proformas', 'Proformas.Create')
        ->name('proformas.new');

    // Rutas para listar proformas
    Route::view('/compras-proformas/list', 'Proformas.Index')
        ->name('proformas.list');
    // end ruta proformas

    // ruta para solicitudes
    Route::get('/compras-request', function () {
        $data = DB::select('exec sp_EmpleadoArea ' . Auth::user()->id);
        return view('Solicitudes.Create', compact('data'));
    })->name('purchase-request.create');

    // ruta para listar solicitudes
    Route::view('/compras-request/list', 'Solicitudes.Index')
        ->name('purchase-request.list');

    // ruta ordenes
    Route::view('/orders/list', 'Orders.List')->name('orders');


    //Rutas para el perfil del usuario
    Route::view('/user-profile', 'Profile.user-profile')
        ->name('profile');

    Route::view('/profile-settings', 'Profile.user-profile')
        ->name('settings');
    // end profile-user
});

Route::resource('/users/list', UserController::class)->except('create', 'show', 'edit')->middleware('auth');
Route::get('/users/roles', [UserController::class, 'getRoles']); //api then

Route::resource('/roles/list', RolesController::class)->except('create', 'show', 'edit')->middleware('auth');

Route::get('/roles/permissions', [RolesController::class, 'getPermissions']); //api then

Route::resource('/permissions/list', PermissionsController::class)->except('create', 'show', 'edit')->middleware('auth');

//routes para personas
Route::resource('/personas', PersonaController::class)->middleware('auth');

//show proforma
Route::get('/showProforma/{idPedido}/{value}', [ProformasController::class, 'showProforma']);

//tiporecursos api
Route::resource('/pedidos', PedidoController::class)->except('create', 'show', 'edit','update')->middleware('auth');

//solicitudes api
Route::resource('/solicitud', SolicitudesController::class)->except('create', 'show', 'edit','update')->middleware('auth');

//proformas api
Route::resource('/proformas', ProformasController::class)->except('create', 'show', 'edit','update')->middleware('auth');

// Aquí estará la data que cree a proveedores
Route::resource('/providers', ProviderController::class)->except('create', 'show', 'edit')->middleware('auth');
//Proveedores

//ruta productos
Route::view('/productos', 'Productos.index')->name('productos')->middleware('auth');

// ruta para productos
Route::resource('/products', ProductController::class)->except('create', 'show', 'edit', 'storeType', 'updateType', 'destroyType')->middleware('auth');

// rutas para agregar, editar y elimnar categorias
Route::post('/categorie', [ProductController::class, 'storeType'])->middleware('auth');
Route::put('/categorie/{categorie}', [ProductController::class, 'updateType'])->middleware('auth');
Route::delete('/categorie/{categorie}', [ProductController::class, 'destroyType'])->middleware('auth');
//

//orders
Route::get('orders/{idEmpleado}/{idPedido}', [orderController::class, 'index'])->name('order')->middleware('auth');
Route::post('/response-request', [orderController::class, 'store'])->middleware('auth')->name('response-request');

//update profile
Route::resource('/update-profile', UserProfileController::class)->middleware('auth');

Route::post('/update-password', [UserProfileController::class, 'updatePassword'])->middleware('auth');

// Route::get('/file', function () {
//     Storage::disk("google")->put("test.pdf", "Hello, I'm wayner");
//     return "Exito";
// });

// Route::view('/email','Orders.email');

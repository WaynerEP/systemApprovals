<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Users\UserController;
use App\Http\Controllers\Users\RolesController;
use App\Http\Controllers\Users\PermissionsController;
use App\Http\Controllers\PersonaController;
use App\Http\Controllers\Providers\ProviderController;
use App\Http\Controllers\Compras\PedidoController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use App\Models\User;


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

    //Ruta para todavia no sirve
    Route::view('/new-purchase', 'Compras.index')
        ->name('new-purchase');

    //ruta productos
    Route::get('/items/products', function () {
        return view('Items.Products');
    })->name('items');

    //ruta categorias
    Route::get('/items/categories', function () {
        return view('Items.Categories');
    })->name('categories');

    // Rutas para pedidos
    Route::view('/compras-pedidos', 'Compras.Pedidos')
        ->name('pedidos');
    // end ruta pedidos

    // Rutas para proformas
    Route::view('/compras-proformas', 'Compras.Proformas')
        ->name('proformas');
    // end ruta proformas

    // ruta para solicitudes
    Route::get('/compras-request', function () {
        $data = DB::select('exec sp_EmpleadoArea ' . Auth::user()->id);
        return view('Compras.Solicitud', compact('data'));
    })->name('purchase-request');


    // // ruta ordenes
    // Route::get('/purchases/orders', function () {
    //     return view('Orders.Index');
    // })->name('orders');

    // Route::get('/purchases/orders/create', function () {
    //     return view('Orders.create');
    // });

    // ruta aprobaciones
    // Route::get('/approvals', function () {
    //     return view('Aprobaciones.Index');
    // })->name('approvals');

    //Rutas para el perfil del usuario
    Route::view('/user-profile', 'Profile.user-profile')
        ->name('profile');

    Route::view('/profile-settings', 'Profile.user-profile')
        ->name('settings');
    // end profile-user
});

Route::resource('/users/list', UserController::class)->except('create', 'show', 'edit');
Route::get('/users/roles', [UserController::class, 'getRoles']); //api then

Route::resource('/roles/list', RolesController::class)->except('create', 'show', 'edit');

Route::get('/roles/permissions', [RolesController::class, 'getPermissions']); //api then

Route::resource('/permissions/list', PermissionsController::class)->except('create', 'show', 'edit');

Route::resource('personas', PersonaController::class);

//Routes para pedidos
Route::resource('pedidos', PedidoController::class);

//Routes para proformas
Route::post('/pedidos/proformas', [PedidoController::class, 'storeProformas']);


// Aquí estará la data que cree a proveedores
Route::resource('/providers', ProviderController::class)->except('create', 'show', 'edit');
//Proveedores

// ruta para productos,categorias
Route::view('/productos', 'Productos.index')
    ->name('productos');

Route::view('/email', 'Orders.Email');

Route::get('/file', function () {
    Storage::disk("google")->put("test.pdf", "Hello, I'm wayner");
    return "Exito";
});

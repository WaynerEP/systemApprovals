<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Users\UserController;
use App\Http\Controllers\Users\RolesController;
use App\Http\Controllers\Users\PermissionsController;
use App\Http\Controllers\PersonaController;
use App\Http\Controllers\Providers\ProviderController;
use Illuminate\Support\Facades\DB;

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

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


    // ruta ordenes
    Route::get('/purchases/orders', function () {
        return view('Orders.Index');
    })->name('orders');

    Route::get('/purchases/orders/create', function () {
        return view('Orders.create');
    });

    // ruta aprobacione
    Route::get('/approvals', function () {
        return view('Aprobaciones.Index');
    })->name('approvals');


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


    // ruta para solicitudes,proformas
    Route::view('/solicitudes', 'Solicitudes.index')
        ->name('solicitudes');

    //ruta productos
    Route::get('/items/products', function () {
        return view('Items.Products');
    })->name('items');

    //ruta categorias
    Route::get('/items/categories', function () {
        return view('Items.Categories');
    })->name('categories');
});

Route::resource('/users/list', UserController::class)->except('create', 'show', 'edit');
Route::get('/users/roles', [UserController::class, 'getRoles']); //api then

Route::resource('/roles/list', RolesController::class)->except('create', 'show', 'edit');
Route::get('/roles/permissions', [RolesController::class, 'getPermissions']); //api then

Route::resource('/permissions/list', PermissionsController::class)->except('create', 'show', 'edit');

Route::resource('personas', PersonaController::class);


// Aquí estará la data que cree a proveedores
Route::resource('/providers', ProviderController::class)->except('create', 'show', 'edit');
//Proveedores

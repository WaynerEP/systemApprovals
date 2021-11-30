<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Users\UserController;
use App\Http\Controllers\Users\RolesController;
use App\Http\Controllers\Users\PermissionsController;
use App\Http\Controllers\PersonaController;


Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// Management Users
Route::middleware('auth')->group(function () {

    Route::get('management/users', function () {
        return view('Users.User');
    })->name('users');

    Route::get('management/roles', function () {
        return view('Users.Roles');
    })->name('roles');

    Route::get('management/permissions', function () {
        return view('Users.Permissions');
    })->name('permissions');



    Route::get('/purchases/orders', function () {
        return view('Orders.Index');
    })->name('orders');

    Route::get('/purchases/orders/create', function () {
        return view('Orders.create');
    });


    Route::get('/approvals', function () {
        return view('Aprobaciones.Index');
    })->name('approvals');



    Route::get('contacts/people', function () {
        return view('Personas.Index');
    })->name('people');

    Route::get('contacts/people/create', function () {
        return view('Personas.Create');
    });


    Route::get('contacts/employees', function () {
        return view('Empleados.Index');
    })->name('employees');

    Route::get('contacts/providers', function () {
        return view('Proveedores.Index');
    })->name('providers');


    Route::get('/items/products', function () {
        return view('Items.Products');
    })->name('items');


    Route::get('/items/categories', function () {
        return view('Items.Categories');
    })->name('categories');
});

Route::resource('/users/list', UserController::class)->except('create', 'show', 'edit');
Route::get('/users/roles', [UserController::class, 'getRoles']); //api then

Route::resource('/roles/list', RolesController::class)->except('create', 'show', 'edit');
Route::get('/roles/permissions', [RolesController::class, 'getPermissions']); //api then

Route::resource('/permissions/list', PermissionsController::class)->except('create', 'show', 'edit');

Route::resource('/persona/list', PersonaController::class);;

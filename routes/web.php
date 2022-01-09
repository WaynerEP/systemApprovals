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

// use App\Models\User;
// use GuzzleHttp\Middleware;

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

    //ruta categorias
    Route::get('/items/categories', function () {
        return view('Items.Categories');
    })->name('categories');


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
    Route::get('/orders/list', function () {
        return view('Orders.List', ['idEmpleado' => Auth::user()->code_Empleado]);
    })->name('orders');

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

Route::resource('/users/list', UserController::class)->except('create', 'show', 'edit')->middleware('auth');
Route::get('/users/roles', [UserController::class, 'getRoles']); //api then

Route::resource('/roles/list', RolesController::class)->except('create', 'show', 'edit')->middleware('auth');

Route::get('/roles/permissions', [RolesController::class, 'getPermissions']); //api then

Route::resource('/permissions/list', PermissionsController::class)->except('create', 'show', 'edit')->middleware('auth');

//routes para personas
Route::resource('personas', PersonaController::class)->middleware('auth');


//Routes para pedidos
// Route::resource('pedidos', PedidoController::class)->middleware('auth');

//Routes para proformas
Route::resource('/pedidos/proformas', ProformasController::class)->middleware('auth');
//ruta para mostrar las proformas
Route::get('/showProforma/{idPedido}/{value}', [ProformasController::class, 'showProforma']);

//ruta post para guardar la solicitud y hacer el envio de correos
// Route::resource('/solicitud/enviar', SolicitudesControllerController::class);


// Aquí estará la data que cree a proveedores
Route::resource('/providers', ProviderController::class)->except('create', 'show', 'edit')->middleware('auth');
//Proveedores

//ruta productos
Route::view('/productos','Productos.index')->name('productos');

// ruta para productos
Route::resource('/products', ProductController::class)->except('create', 'show', 'edit')->middleware('auth');


//orders
Route::get('orders/{idEmpleado}/{idPedido}', [orderController::class, 'index'])->name('order');
Route::post('/response-request', [orderController::class, 'store'])->name('response-request');

//update profile
Route::resource('/update-profile', UserProfileController::class)->middleware('auth');

Route::post('/update-password', [UserProfileController::class, 'updatePassword'])->middleware('auth');

//no usable
// Route::view('/email', 'Orders.Email');

// Route::get('/file', function () {
//     Storage::disk("google")->put("test.pdf", "Hello, I'm wayner");
//     return "Exito";
// });

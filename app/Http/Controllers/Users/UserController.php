<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Notifications\WelcomeToTheApplication;
use App\Models\User;
use Spatie\Permission\Models\Role;


class UserController extends Controller
{

    public function index()
    {
        $paginate = request('paginate', 10);
        $data = User::with('roles')->paginate($paginate);
        return response()->json($data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'empleado' => 'required',
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'dni' => 'required|string|min:8',
            'rol' => 'required',
            'status' => 'required'
        ]);

        $user = User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'code_empleado' => $request['codeEmpleado'],
            'password' => Hash::make($request['dni']),
            'status' => $request['status']
        ]);

        $user->assignRole($request['rol']);

        $user->notify(new WelcomeToTheApplication());

        return response('La acción ha sido exitosa!.', 200);
    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $id,
            'rol' => 'required',
            'status' => 'required'
        ]);

        $user = User::findOrFail($id);
        $user->Update([
            'name' => $request['name'],
            'email' => $request['email'],
            'status' => $request['status']
        ]);

        $user->roles()->sync($request['rol']);

        return response('La acción ha sido exitosa!.', 200);
    }


    public function destroy($id)
    {
        $user = User::find($id);
        $user->status = 0;
        $user->save();
        return response('La acción ha sido exitosa!.', 200);
    }

    public function getRoles()
    {
        $data = Role::select('id', 'name')->get();
        return $data;
    }
}

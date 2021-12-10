<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use App\Models\User;
use Spatie\Permission\Models\Role;


class UserController extends Controller
{

    public function index()
    {
        $data = User::with('roles')->get();
        return $data;
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'dni' => 'required|string|min:8',
            'role' => 'required',
            'status' => 'required'
        ]);

        $user = User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'code_empleado' => $request['codeEmpleado'],
            'password' => Hash::make($request['dni']),
            'status' => $request['status']
        ]);

        $user->assignRole($request['role']);
        return response('Usuario creado!.', 200);
    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $id,
            'role' => 'required',
            'status' => 'required'
        ]);

        $user = User::findOrFail($id);
        $user->Update([
            'name' => $request['name'],
            'email' => $request['email'],
            'status' => $request['status']
        ]);

        $user->roles()->sync($request['role']);

        return response('Usuario Actualizado!.', 200);
    }


    public function destroy($id)
    {
        $user=User::find($id);
        $user->status = 0;
        $user->save();
        return response('Usuario inhabilitado!.', 200);
    }

    public function getRoles()
    {
        $data = Role::select('id', 'name')->get();
        return $data;
    }
}

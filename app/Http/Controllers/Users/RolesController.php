<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolesController extends Controller
{

    public function index()
    {
        $data = Role::with('permissions')->get();
        return response()->json($data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'rol' => 'required|string|max:255|unique:roles,name',
            'permisos' => 'required',
        ]);

        $role = Role::create([
            'name' => $request['rol'],
        ]);
        $arrayPermisos = $request['permisos'];
        $role->syncPermissions($arrayPermisos);

        return response('La acción ha sido exitosa!.', 200);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'rol' => 'required|string|max:255|unique:roles,name,' . $id,
            'permisos' => 'required',
        ]);

        $role = Role::find($id);
        $role->Update([
            'name' => $request['rol'],
        ]);

        $arrayPermisos = $request['permisos'];
        $role->permissions()->sync($arrayPermisos);

        return response('La acción ha sido exitosa!.', 200);
    }

    public function getPermissions()
    {
        $data = Permission::select('id', 'name')->get();
        return response()->json($data);
    }
}

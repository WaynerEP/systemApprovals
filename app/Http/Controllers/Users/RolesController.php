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
        return $data;
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:roles',
            'permissions' => 'required',
        ]);

        $role = Role::create([
            'name' => $request['name'],
        ]);
        $arrayPermisos = $request['permissions'];
        $role->syncPermissions($arrayPermisos);

        return response('Rol creado!.', 200);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:roles,name,'.$id,
            'permissions' => 'required',
        ]);

        $role = Role::find($id);
        $role ->Update([
            'name' => $request['name'],
        ]);
        
        $arrayPermisos = $request['permissions'];
        $role->permissions()->sync($arrayPermisos);

        return response('Rol actualizado!.', 200);
    }

    public function destroy($id)
    {
        //
    }

    public function getPermissions()
    {
        $data = Permission::select('id', 'name')->get();
        return $data;
    }
}

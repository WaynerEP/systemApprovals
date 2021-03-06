<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;

class PermissionsController extends Controller
{

    public function index()
    {
        $paginate = request('paginate', 10);
        $data = Permission::orderBy('id', 'desc')->paginate($paginate);;
        return response()->json($data);
    }


    public function store(Request $request)
    {
        $request->validate([
            'permiso' => 'required|string|max:255|unique:permissions,name',
        ]);

        Permission::create([
            'name' => $request['permiso'],
        ]);

        return response('La acción ha sido exitosa!.', 200);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'permiso' => 'required|string|max:255|unique:permissions,name,' . $id,
        ]);

        $permission = Permission::find($id);
        $permission->Update([
            'name' => $request['permiso'],
        ]);

        return response('La acción ha sido exitosa!.', 200);
    }
}

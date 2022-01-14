<?php

namespace App\Http\Controllers\Profile;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Persona;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;

class UserProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function store(Request $request)
    {
        if ($request->hasFile('image')) {

            $customFileName = uniqid() . '_' . auth()->user()->id . '.' . $request->file('image')->extension();
            $imageNameOld = auth()->user()->avatar;

            Storage::putFileAs('public/avatars/', $request->file('image'), $customFileName);

            $imageNameOld = auth()->user()->avatar;
            $user = auth()->user();
            $user->avatar = 'storage/avatars/' . $customFileName;
            $user->save();

            if ($customFileName) {
                if (file_exists($imageNameOld)) {
                    unlink($imageNameOld);
                }
            }
            return response()->json("OK");
        }
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nombres' => 'required|string|min:3|max:255',
            'apellidos' => 'required|string|min:|max:255',
            'sexo' => 'required|string|max:255',
            'correo' => 'required|string|email|max:255|unique:ciudadanos,correo,' . $id . ',dniCiudadano',
            'address' => 'required|string|max:255',
            'telefono' => 'required',
        ]);

        $persona = Persona::find($id);
        $persona->update([
            'nombres' => $request['nombres'],
            'apellidos' => $request['apellidos'],
            'sexo' => $request['sexo'],
            'correo' => $request['correo'],
            'direccion' => $request['address'],
            'telefono1' => $request['telefono'],
        ]);
        return response()->json('La acción ha sido exitosa.');
    }


    public function updatePassword(Request $request)
    {
        $request->validate([
            'name' => 'required|string|min:3|max:255',
            'current_password' => 'required|min:8|max:100',
            'new_password' => 'required|min:8|max:100',
            'confirm_password' => 'required|same:new_password'
        ]);

        $user = auth()->user();
        if (Hash::check($request->current_password, $user->password)) {
            $user->forceFill([
                'name' => $request->name,
                'password' => Hash::make($request->new_password),
            ])->save();
        }
        return response()->json('La accion ha sido exitosa');
    }
}

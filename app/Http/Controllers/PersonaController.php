<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Persona;
use Carbon\Carbon;

class PersonaController extends Controller
{

    public function index()
    {
        $data = Persona::all();
        return $data;
    }


    public function store(Request $request)
    {
        $request->validate([
            'dniCiudadano' => 'required',
            'nombres' => 'required|string|min:3|max:255',
            'apellidos' => 'required|string|min:|max:255',
            'sexo' => 'required|string|max:255',
            'fechaNacimiento' => 'required',
            'email' => 'required|string|email|max:255|unique:ciudadanos',
            'direccion' => 'required|string|max:255',
            'referencia' => 'nullable|max:255',
            'celular' => 'required',
            'telefono1' => 'max:15',
            'codDistrito' => 'required',
            'idNivel' => 'required',
        ]);

        $date = Carbon::parse($request['birthday'])->format('Y-m-d');
        Persona::create([
            'dniCiudadano' => $request['dniCiudadano'],
            'nombres' => $request['nombres'],
            'apellidos' => $request['apellidos'],
            'sexo' => $request['sexo'],
            'fechaNacimiento' => $date,
            'email' => $request['email'],
            'direccion' => $request['direccion'],
            'referencia' => $request['referencia'],
            'celular' => $request['celular'],
            'telefono1' => $request['telefono1'],
            'codDistrito' => $request['codDistrito'],
            'idNivel' => $request['idNivel'],
        ]);

        return response('Contacto creada!.', 200);
    }


    public function update(Request $request, $id)
    {
    }


    public function destroy($id)
    {
    }
}

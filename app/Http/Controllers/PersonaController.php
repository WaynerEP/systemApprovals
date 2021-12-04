<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Persona;
use App\Models\Departamento;
use Carbon\Carbon;
use DB;

class PersonaController extends Controller
{

    public function index()
    {
        return view('Personas.index');
    }



    public function create()
    {
        $depas = Departamento::all();
        $estudios = DB::table('nivelStudios')->get();
        return view('Personas.create', ['departamentos' => $depas, 'estudios' => $estudios]);
    }



    public function store(Request $request)
    {
        $request->validate([
            'dni' => 'required|min:8',
            'nombres' => 'required|string|min:3|max:255',
            'apellidos' => 'required|string|min:|max:255',
            'nacimiento' => 'required',
            'sexo' => 'required|string|max:255',
            'correo' => 'required|string|email|max:255|unique:ciudadanos,correo',
            'direccion' => 'required|string|max:255',
            'referencia' => 'nullable|max:255',
            'telefono' => 'required',
            'departamento' => 'required',
            'provincia' => 'required',
            'distrito' => 'required',
            'nivel' => 'required',
        ]);

        $date = Carbon::parse($request['fechaNacimiento'])->format('Y-m-d');
        Persona::create([
            'dniCiudadano' => $request['dni'],
            'nombres' => $request['nombres'],
            'apellidos' => $request['apellidos'],
            'sexo' => $request['sexo'],
            'fechaNacimiento' => $date,
            'correo' => $request['correo'],
            'direccion' => $request['direccion'],
            'referencia' => $request['referencia'],
            'telefono1' => $request['telefono'],
            'telefono2' => $request['telefono2'],
            'idNivel' => $request['nivel'],
            'codDistrito' => $request['distrito'],
        ]);

        return redirect()->route('personas.index')->with('message', 'Registro guardado!!');
    }



    public function edit($id)
    {
        $data = DB::select(" exec sp_updatePerson '$id' ");
        $depas = Departamento::all();
        $estudios = DB::table('nivelStudios')->get();
        return view('Personas.edit', ['data' => $data, 'departamentos' => $depas, 'estudios' => $estudios]);
    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'nombres' => 'required|string|min:3|max:255',
            'apellidos' => 'required|string|min:|max:255',
            'nacimiento' => 'required',
            'sexo' => 'required|string|max:255',
            'correo' => 'required|string|email|max:255|unique:ciudadanos,correo,' . $id . ',dniCiudadano',
            'direccion' => 'required|string|max:255',
            'referencia' => 'nullable|max:255',
            'telefono' => 'required',
            'departamento' => 'required',
            'provincia' => 'required',
            'distrito' => 'required',
            'nivel' => 'required',
        ]);

        $date = Carbon::parse($request['fechaNacimiento'])->format('Y-m-d');
        $persona = Persona::find($id);
        $persona->update([
            'nombres' => $request['nombres'],
            'apellidos' => $request['apellidos'],
            'sexo' => $request['sexo'],
            'fechaNacimiento' => $date,
            'correo' => $request['correo'],
            'direccion' => $request['direccion'],
            'referencia' => $request['referencia'],
            'telefono1' => $request['telefono'],
            'telefono2' => $request['telefono2'],
            'idNivel' => $request['nivel'],
            'codDistrito' => $request['distrito'],
        ]);

        return redirect()->route('personas.index')->with('message', 'Registro actualizado!!');
    }

    public function destroy($id)
    {
        $persona = Persona::find($id);
        $persona->estado = '0';
        $persona->save();
        return response('Persona eliminado!.', 200);
    }
}

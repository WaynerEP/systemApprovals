<?php

namespace Database\Seeders;

use App\Models\Persona;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CiudadanoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $ciudadanos = DB::connection('baseantigua')->table('ciudadanos')->get();
        foreach ($ciudadanos as $fila) {
            $nuevaPersona = new Persona();
            $nuevaPersona->dniCiudadano = $fila->dniCiudadano;
            $nuevaPersona->nombres = $fila->nombres;
            $nuevaPersona->apellidos = $fila->apellidos;
            $nuevaPersona->sexo = $fila->sexo;
            $nuevaPersona->fechaNacimiento = $fila->fechaNacimiento;
            $nuevaPersona->correo = $fila->correo;
            $nuevaPersona->direccion = $fila->direccion;
            $nuevaPersona->referencia = $fila->referencia;
            $nuevaPersona->telefono1 = $fila->telefono1;
            $nuevaPersona->telefono2 = $fila->telefono2;
            $nuevaPersona->idNivel = $fila->idNivel;
            $nuevaPersona->codDistrito = $fila->codDistrito;
            $nuevaPersona->estado = $fila->estado;
            $nuevaPersona->save();
        }
    }
}

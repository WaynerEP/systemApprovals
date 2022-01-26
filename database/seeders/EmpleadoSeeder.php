<?php

namespace Database\Seeders;

use App\Models\Empleado;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EmpleadoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $empleados = DB::connection('baseantigua')->table('empleados')->get();
        foreach ($empleados as $fila) {
            $registro = new Empleado();
            $registro->codEmpleado = $fila->codEmpleado;
            $registro->dniCiudadano = $fila->dniCiudadano;
            $registro->idCargo = $fila->idCargo;
            $registro->observaciones = $fila->observaciones;
            $registro->sueldo = $fila->sueldo;
            $registro->estadoEmpleado = $fila->estadoEmpleado;
            $registro->save();
        }
    }
}

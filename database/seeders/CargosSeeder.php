<?php

namespace Database\Seeders;

use App\Models\Cargo;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CargosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $cargos = DB::connection('baseantigua')->table('cargos')->get();
        foreach ($cargos as $fila) {
            $nuevo = new Cargo();
            $nuevo->idCargo = $fila->idCargo;
            $nuevo->cargo = $fila->cargo;
            $nuevo->idArea = $fila->idArea;
            $nuevo->save();
        }
    }
}

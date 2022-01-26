<?php

namespace Database\Seeders;

use App\Models\Distrito;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DistritoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $distritos = DB::connection('baseantigua')->table('distritos')->get();
        foreach ($distritos as $fila) {
            $nuevoDistrito = new Distrito();
            $nuevoDistrito->codDistrito = $fila->codDistrito;
            $nuevoDistrito->distrito = $fila->distrito;
            $nuevoDistrito->codProvincia = $fila->codProvincia;
            $nuevoDistrito->save();
        }
    }
}

<?php

namespace Database\Seeders;

use App\Models\Provincia;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProvinciaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $provincias = DB::connection('baseantigua')->table('provincias')->get();
        foreach ($provincias as $fila) {
            $nuevoDepa = new Provincia();
            $nuevoDepa->codProvincia = $fila->codProvincia;
            $nuevoDepa->provincia = $fila->provincia;
            $nuevoDepa->codDepartamento = $fila->codDepartamento;
            $nuevoDepa->save();
        }
    }
}

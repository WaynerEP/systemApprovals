<?php

namespace Database\Seeders;

use App\Models\Area;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AreasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $departamentos = DB::connection('baseantigua')->table('areas')->get();
        foreach ($departamentos as $fila) {
            $nuevoregistro = new Area();
            $nuevoregistro->idArea = $fila->idArea;
            $nuevoregistro->area_descripcion = $fila->area_descripcion;
            $nuevoregistro->idDepart = $fila->idDepart;
            $nuevoregistro->save();
        }
    }
}

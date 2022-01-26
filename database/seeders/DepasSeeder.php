<?php

namespace Database\Seeders;

use App\Models\DepasEmpresa;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DepasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $departamentos = DB::connection('baseantigua')->table('departempresa')->get();
        foreach ($departamentos as $fila) {
            $nuevoregistro = new DepasEmpresa();
            $nuevoregistro->idDepart = $fila->idDepart;
            $nuevoregistro->departamento = $fila->departamento;
            $nuevoregistro->save();
        }
    }
}

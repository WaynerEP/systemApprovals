<?php

namespace Database\Seeders;

use App\Models\Departamento;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class DepartamentoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $departamentos = DB::connection('baseantigua')->table('departamentos')->get();
        foreach ($departamentos as $fila) {
            $nuevoDepa = new Departamento();
            $nuevoDepa->codDepartamento = $fila->codDepartamento;
            $nuevoDepa->departamento = $fila->departamento;
            $nuevoDepa->save();
        }
    }
}

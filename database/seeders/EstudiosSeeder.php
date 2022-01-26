<?php

namespace Database\Seeders;

use App\Models\Estudio;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EstudiosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $estudios = DB::connection('baseantigua')->table('nivelstudios')->get();
        foreach ($estudios as $fila) {
            $nuevoEstudio = new Estudio();
            $nuevoEstudio->idNivel = $fila->idNivel;
            $nuevoEstudio->nivel = $fila->nivel;
            $nuevoEstudio->save();
        }
    }
}

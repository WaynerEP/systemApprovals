<?php

namespace Database\Seeders;

use App\Models\Aprobaciones;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AprobacionesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $approvals = DB::connection('baseantigua')->table('aprobaciones')->get();
        foreach ($approvals as $fila) {
            $new = new Aprobaciones();
            $new->idAprobacion = $fila->idAprobacion + 1;
            $new->idSolicitud = $fila->idSolicitud;
            $new->codEmpleado = $fila->codEmpleado;
            $new->motivoDesicion = $fila->motivoDesicion;
            $new->observaciones = $fila->observaciones;
            $new->estado = $fila->estado;
            $new->fechaRespuesta = $fila->fechaRespuesta;
            $new->save();
        }
    }
}

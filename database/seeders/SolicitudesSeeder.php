<?php

namespace Database\Seeders;

use App\Models\Solicitud;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SolicitudesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $solicitudes = DB::connection('baseantigua')->table('solicitudes')->get();
        foreach ($solicitudes as $fila) {
            $new = new Solicitud();
            $new->idSolicitud = $fila->idSolicitud;
            $new->idPedido = $fila->idPedido;
            $new->fechaSolicitud = $fila->fechaSolicitud;
            $new->estado = $fila->estado;
            $new->nota = $fila->nota;
            $new->codEmpleado = $fila->codEmpleado;
            $new->save();
        }
    }
}

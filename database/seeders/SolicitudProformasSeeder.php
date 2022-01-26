<?php

namespace Database\Seeders;

use App\Models\SolicitudProformas;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SolicitudProformasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $solicitudesproforma = DB::connection('baseantigua')->table('solicitudesproforma')->get();
        foreach ($solicitudesproforma as $fila) {
            $new = new SolicitudProformas();
            $new->idSolicitud = $fila->idSolicitud;
            $new->observacion = $fila->observacion;
            $new->estado = $fila->estado;
            $new->idProforma = $fila->idProforma;
            $new->save();
        }
    }
}

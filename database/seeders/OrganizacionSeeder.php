<?php

namespace Database\Seeders;

use App\Models\Organizacion;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OrganizacionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $organizacion = DB::connection('baseantigua')->table('organizacion')->get();
        foreach ($organizacion as $fila) {
            $new = new Organizacion();
            $new->ruc = $fila->ruc;
            $new->razonSocial = $fila->razonSocial;
            $new->logo = $fila->logo;
            $new->rubro = $fila->rubro;
            $new->igv = $fila->igv;
            $new->direccion = $fila->direccion;
            $new->correo = $fila->correo;
            $new->numTelefonico = $fila->numTelefonico;
            $new->estado = $fila->estado;
            $new->save();
        }
    }
}

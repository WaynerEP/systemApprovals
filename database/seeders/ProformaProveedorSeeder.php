<?php

namespace Database\Seeders;

use App\Models\ProformaProveedor;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProformaProveedorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $proformaproveedor = DB::connection('baseantigua')->table('proformaproveedor')->get();
        foreach ($proformaproveedor as $fila) {
            $new = new ProformaProveedor();
            $new->idProveedor = $fila->idProveedor;
            $new->idPedido = $fila->idPedido;
            $new->montoProforma = $fila->montoProforma;
            $new->archivo = $fila->archivo;
            $new->fRegistro = $fila->fRegistro;
            $new->idProforma = $fila->idProforma;
            $new->sizeFile = $fila->sizeFile;
            $new->save();
        }
    }
}

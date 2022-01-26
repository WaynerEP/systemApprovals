<?php

namespace Database\Seeders;

use App\Models\Proveedor;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProveedoresSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $providers = DB::connection('baseantigua')->table('proveedores')->get();
        foreach ($providers as $fila) {
            $new = new Proveedor();
            $new->idProveedor = $fila->idProveedor;
            $new->estado = $fila->estado;
            $new->dniRepresentante = $fila->dniRepresentante;
            $new->razonSocial = $fila->razonSocial;
            $new->direccion = $fila->direccion;
            $new->ciudad = $fila->ciudad;
            $new->telefono = $fila->telefono;
            $new->codPostal = $fila->codPostal;
            $new->email = $fila->email;
            $new->pais = $fila->pais;
            $new->ruc = $fila->ruc;
            $new->save();
        }
    }
}

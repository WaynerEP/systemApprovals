<?php

namespace Database\Seeders;

use App\Models\DetallePedidos;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DetalleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $detalle = DB::connection('baseantigua')->table('detallepedidos')->get();
        foreach ($detalle as $fila) {
            $new = new DetallePedidos();
            $new->idProducto = $fila->idProducto;
            $new->idDetalle = $fila->idDetalle;
            $new->cantidad = $fila->cantidad;
            $new->costoUnitario = $fila->costoUnitario;
            $new->descuento = $fila->descuento;
            $new->idPedido = $fila->idPedido;
            $new->save();
        }
    }
}

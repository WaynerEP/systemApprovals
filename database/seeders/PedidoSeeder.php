<?php

namespace Database\Seeders;

use App\Models\Pedido;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PedidoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $pedidos = DB::connection('baseantigua')->table('pedidos')->get();
        foreach ($pedidos as $fila) {
            $new = new Pedido();
            $new->idPedido = $fila->idPedido;
            $new->monto = $fila->monto;
            $new->notas = $fila->notas;
            $new->estado = $fila->estado;
            $new->fechaPedido = $fila->fechaPedido;
            $new->save();
        }
    }
}

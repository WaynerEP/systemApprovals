<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $productos = DB::connection('baseantigua')->table('productos')->get();
        foreach ($productos as $fila) {
            $new = new Product();
            $new->idProducto = $fila->idProducto;
            $new->idTipo = $fila->idTipo;
            $new->descripcionProducto = $fila->descripcionProducto;
            $new->medida = $fila->medida;
            $new->precioC = $fila->precioC;
            $new->stock = $fila->stock;
            $new->estado = $fila->estado;
            $new->image = $fila->image;
            $new->save();
        }
    }
}

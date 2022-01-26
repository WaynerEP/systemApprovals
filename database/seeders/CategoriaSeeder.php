<?php

namespace Database\Seeders;

use App\Models\TypeProduct;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoriaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categoria = DB::connection('baseantigua')->table('tipoproducto')->get();
        foreach ($categoria as $fila) {
            $new = new TypeProduct();
            $new->idTipo = $fila->idTipo;
            $new->descripcion = $fila->descripcion;
            $new->save();
        }
    }
}

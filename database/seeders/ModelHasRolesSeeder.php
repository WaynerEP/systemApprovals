<?php

namespace Database\Seeders;

use App\Models\Model_has_role;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ModelHasRolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $model_has_roles = DB::connection('baseantigua')->table('model_has_roles')->get();
        foreach ($model_has_roles as $fila) {
            $new = new Model_has_role();
            $new->role_id = $fila->role_id;
            $new->model_type = $fila->model_type;
            $new->model_id = $fila->model_id;
            $new->save();
        }
    }
}

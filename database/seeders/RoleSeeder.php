<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $roles = DB::connection('baseantigua')->table('roles')->get();
        foreach ($roles as $fila) {
            $new = new Role();
            $new->id = $fila->id;
            $new->name = $fila->name;
            $new->guard_name = $fila->guard_name;
            $new->created_at = $fila->created_at;
            $new->updated_at = $fila->updated_at;
            $new->save();
        }
    }
}

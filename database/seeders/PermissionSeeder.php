<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissions = DB::connection('baseantigua')->table('permissions')->get();
        foreach ($permissions as $fila) {
            $new = new Permission();
            $new->id = $fila->id;
            $new->name = $fila->name;
            $new->guard_name = $fila->guard_name;
            $new->created_at = $fila->created_at;
            $new->updated_at = $fila->updated_at;
            $new->save();
        }
    }
}

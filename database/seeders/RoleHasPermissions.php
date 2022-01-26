<?php

namespace Database\Seeders;

use App\Models\role_has_permissions;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoleHasPermissions extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role_has_permissions = DB::connection('baseantigua')->table('role_has_permissions')->get();
        foreach ($role_has_permissions as $fila) {
            $new = new role_has_permissions();
            $new->role_id = $fila->role_id;
            $new->permission_id	 = $fila->permission_id	;
            $new->save();
        }
    }
}

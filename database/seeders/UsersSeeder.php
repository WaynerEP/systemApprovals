<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = DB::connection('baseantigua')->table('users')->get();
        foreach ($users as $fila) {
            $nuevo = new User();
            $nuevo->id = $fila->id;
            $nuevo->name = $fila->name;
            $nuevo->email = $fila->email;
            $nuevo->password = $fila->password;
            $nuevo->last_login = $fila->last_login;
            $nuevo->code_empleado = $fila->code_empleado;
            $nuevo->status = $fila->status;
            $nuevo->remember_token = $fila->remember_token;
            $nuevo->email_verified_at = $fila->email_verified_at;
            $nuevo->avatar = $fila->avatar;
            $nuevo->google_id = $fila->google_id;
            $nuevo->google_token = $fila->google_token;
            $nuevo->created_at = $fila->created_at;
            $nuevo->updated_at = $fila->updated_at;
            $nuevo->save();
        }
    }
}

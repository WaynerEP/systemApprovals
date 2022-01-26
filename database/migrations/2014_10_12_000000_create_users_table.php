<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name',100);
            $table->string('email',255)->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password',255);
            $table->dateTime('last_login')->nullable();
            $table->char('status', 1)->default(1);
            $table->integer('code_empleado');
            $table->string('avatar',255)->nullable();
            $table->string('google_id',255)->nullable();
            $table->string('google_token',255)->nullable();
            $table->foreign('code_empleado')->references('codEmpleado')->on('empleados');
            $table->rememberToken();
            // $table->timestamp('created_at',4)->nullable();
            // $table->timestamp('updated_at',4)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}

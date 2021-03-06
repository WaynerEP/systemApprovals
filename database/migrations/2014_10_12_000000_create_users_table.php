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
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at', 4)->nullable();
            $table->string('password');
            $table->dateTime('last_login', 4)->nullable();
            $table->char('status', 1)->default(1);
            $table->integer('code_empleado');
            $table->string('avatar')->nullable();
            $table->string('google_id')->nullable();
            $table->string('google_token')->nullable();
            $table->foreign('code_empleado')->references('codEmpleado')->on('empleados');
            $table->rememberToken();
            $table->timestamp('created_at',4)->nullable();
            $table->timestamp('updated_at',4)->nullable();
            // $table->timestamps();
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

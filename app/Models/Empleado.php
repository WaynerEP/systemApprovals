<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    use HasFactory;
    protected $table = "empleados";
    protected $primaryKey = "codEmpleado";
    protected $keyType = 'int';
    protected $fillable = [
        'dniCiudadano',
        'idCargo',
        'observaciones',
        'sueldo',
        'estadoEmpleado',
    ];
    public $timestamps = false;
}

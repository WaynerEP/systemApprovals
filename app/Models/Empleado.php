<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    use HasFactory;
    protected $table = "empleados";
    protected $primaryKey = "codEmpleado";
    protected $fillable = [
        'dniCiudadano',
        'idCargo',
        'observaciones',
        'sueldo',
        'estadoEmpleado',
    ];
    public $timestamps = false;

    public function ciudadano()
    {
        return $this->hasOne(Persona::class, 'dniCiudadano', 'dniCiudadano');
    }

    public function cargo()
    {
        return $this->hasOne(Cargo::class, 'idCargo', 'idCargo');
    }

    public function solicitud()
    {
        $this->belongsTo(Solicitud::class, 'codEmpleado', 'codEmpleado');
    }
}

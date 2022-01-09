<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Solicitud extends Model
{
    use HasFactory;
    protected $table = "solicitudes";
    protected $primaryKey = "idSolicitud";
    protected $fillable = [
        'idPedido',
        'fechaSolicitud',
        'estado',
        'nota',
        'codEmpleado',
    ];
    public $timestamps = false;

    public function aprobaciones()
    {
        return $this->hasMany(Aprobaciones::class, 'idSolicitud', 'idSolicitud');
    }

    public function empleado()
    {
        return $this->hasOne(Empleado::class, 'codEmpleado', 'codEmpleado');
    }
}

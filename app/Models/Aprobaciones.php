<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Aprobaciones extends Model
{
    use HasFactory;
    protected $table = "aprobaciones";
    protected $primaryKey = "idAprobacion";
    protected $fillable = [
        'idSolicitud',
        'codEmpleado',
        'motivoDesicion',
        'observaciones',
        'estado',
    ];
    public $timestamps = false;

    public function empleado()
    {
        return $this->hasOne(Empleado::class, 'codEmpleado', 'codEmpleado');
    }
}

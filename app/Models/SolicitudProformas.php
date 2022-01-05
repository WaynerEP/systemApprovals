<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SolicitudProformas extends Model
{
    use HasFactory;
    protected $table = "solicitudesProforma";
    protected $primaryKey = "idProforma";
    protected $fillable = [
        'idSolicitud',
        'idProforma',
        'estado',
        'observacion',
    ];
    public $timestamps = false;
}

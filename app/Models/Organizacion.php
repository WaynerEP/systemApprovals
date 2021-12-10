<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Organizacion extends Model
{
    use HasFactory;
    protected $table = "organizacion";
    protected $primaryKey = "ruc";
    protected $keyType = 'string';
    protected $fillable = [
        'razonSocial',
        'logo',
        'rubro',
        'igv',
        'direccion',
        'correo',
        'numTelefonico',
        'estado',
    ];
    public $timestamps = false;
}

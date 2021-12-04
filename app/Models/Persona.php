<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    use HasFactory;
    protected $table = "ciudadanos";
    protected $primaryKey = "dniCiudadano";
    protected $keyType = 'string';
    protected $fillable = [
        'dniCiudadano',
        'nombres',
        'apellidos',
        'sexo',
        'fechaNacimiento',
        'correo',
        'direccion',
        'referencia',
        'telefono1',
        'telefono2',
        'idNivel',
        'codDistrito',
    ];
    public $timestamps = false;
}

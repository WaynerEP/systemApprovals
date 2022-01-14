<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proveedor extends Model
{
    use HasFactory;
    protected $table = "proveedores";
    protected $primaryKey = "idProveedor";
    protected $fillable = [
        'estado', 'dniRepresentante',
        'razonSocial', 'direccion',
        'ciudad', 'telefono',
        'codPostal', 'email',
        'pais', 'ruc',
    ];

    public $timestamps = false;

    public function ciudadano()
    {
        return $this->hasOne(Persona::class, 'dniCiudadano', 'dniRepresentante');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
    use HasFactory;
    protected $table = "proveedores";
    protected $primaryKey = "idProveedor";
    protected $fillable = [
        'dniRepresentante',
        'razonSocial',
        'estado',
    ];
    public $timestamps = false;
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = "productos";
    protected $primaryKey = "idProducto";
    protected $fillable = [
        'idTipo',
        'descripcionProducto',
        'medida',
        'precioC',
        'stock',
        'estado',
        'image',
    ];
    public $timestamps = false;
}

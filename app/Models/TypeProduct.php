<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeProduct extends Model
{
    use HasFactory;
    protected $table = "tipoProducto";
    protected $primaryKey = "idTipo";
    protected $fillable = [
        'descripcion',
    ];
    public $timestamps = false;
}

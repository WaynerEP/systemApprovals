<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetallePedidos extends Model
{
    use HasFactory;
    protected $table = "detallePedidos";
    protected $primaryKey = "idDetalle";
    protected $fillable = [
        'idPedido',
        'idProducto',
        'cantidad',
        'costoUnitario',
        'descuento',
    ];
    public $timestamps = false;
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    use HasFactory;
    protected $table = "pedidos";
    protected $primaryKey = "idPedido";
    protected $fillable = [
        'monto',
        'notas',
        'estado',
        'fechaPedido',
    ];
    public $timestamps = false;

}

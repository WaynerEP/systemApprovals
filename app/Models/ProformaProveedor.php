<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProformaProveedor extends Model
{
    use HasFactory;
    protected $table = "proformaProveedor";
    protected $primaryKey = "idProforma";
    protected $fillable = [
        'idPedido',
        'idProveedor',
        'archivo',
        'sizeFile',
        'montoProforma',
    ];
    public $timestamps = false;
}

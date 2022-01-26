<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DepasEmpresa extends Model
{
    use HasFactory;
    protected $table = "departempresa";
    protected $primarykey = "idDepart";
    protected $fillable = [
        'departamento',
    ];
    public $timestamps = false;
}

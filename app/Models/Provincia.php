<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provincia extends Model
{
    use HasFactory;
    protected $table = "provincias";
    protected $primarykey = "codProvincia";
    protected $fillable = [
        'provincia',
        'codDepartamento',
    ];
    public $timestamps = false;
}

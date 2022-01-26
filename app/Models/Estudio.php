<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Estudio extends Model
{
    use HasFactory;
    protected $table = "nivelstudios";
    protected $primarykey = "idNivel";
    protected $fillable = [
        'nivel',
    ];
    public $timestamps = false;
}

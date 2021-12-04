<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Departamento;
use App\Models\Provincia;
use App\Models\Distrito;


class distritosController extends Controller
{

    public function getProvincias($idDepartamento)
    {
        $data = Provincia::select('codProvincia', 'provincia')
            ->where('codDepartamento', $idDepartamento)
            ->orderBy('codProvincia', 'asc')->get();
        return $data;
    }


    public function getDistritos($idProvincia)
    {
        $data = Distrito::select('codDistrito', 'distrito')
            ->where('codProvincia', $idProvincia)
            ->get();
        return $data;
    }


}

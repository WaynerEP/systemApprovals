<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Departamento;
use App\Models\Provincia;
use App\Models\Distrito;


class distritosController extends Controller
{
    public function getAllDepartamentos()
    {
        return Departamento::all();
    }

    public function getProvincias($idDepartamento)
    {
        $data = Provincia::select('idProvincia', 'provincia')
            ->where('idDepartamento', $idDepartamento)
            ->orderBy('idProvincia', 'asc')->get();
        return $data;
    }


    public function getDistritos($idProvincia)
    {
        $data = Distrito::select('idDistrito', 'distrito')
            ->where('idProvincia', $idProvincia)
            ->get();
        return $data;
    }


}

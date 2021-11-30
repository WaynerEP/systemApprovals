<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DepartamentoEmpresa;
use App\Models\Areas;
use App\Models\Cargo;

class cargosController extends Controller
{
    public function getDepartamentoEmpresa()
    {
        return DepartamentoEmpresa::all();
    }

    public function getAreasByDepartamento($id)
    {
        $data = Areas::select('codArea', 'area')
            ->where('idDepart', $id)
            ->get();
        return $data;
    }

    public function getCargos($id)
    {
        return Cargo::all();
    }
}

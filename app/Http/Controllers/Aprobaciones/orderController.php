<?php

namespace App\Http\Controllers\Aprobaciones;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Aprobaciones;
use App\Notifications\NotififyLogistics;
use App\Models\User;
use DB;

class orderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($idSolicitud, $idEmpleado)
    {
        $user = DB::table('aprobaciones')->where([
            ['idSolicitud', '=', $idSolicitud],
            ['codEmpleado', '=', $idEmpleado]
        ])->value('estado');
        return view('Orders.index', compact('user', 'idSolicitud', 'idEmpleado'));
    }


    public function store(Request $request)
    {
        $request->validate([
            'mensaje' => 'required|string|min:3|max:255',
            'estado' => 'required'
        ]);
        $idSolicitud = $request->solicitud;
        $idEmpleado = $request->employee;
        $status = $request->estado;
        $motivo = $request->mensaje;

        //guardamos la solicitud
        try {
            DB::beginTransaction();
            //
            DB::update("EXEC spUpdateAprobaciones ?,?,?,?", array($idSolicitud, $idEmpleado, $status, $motivo));
            $allCompleted = DB::table('solicitudes')
                ->where('idSolicitud', '=', $idSolicitud)
                ->where('estado', '=', '1')
                ->get();
            if ($allCompleted) {
                $user = User::role('Jefe de Logística')->get();
                $user[0]->notify(new NotififyLogistics($user[0]['name']));
            }
            // # confirmation of changes
            DB::commit();
            if ($request->option == 'op') {
                return redirect()->route('order', [$idSolicitud, $idEmpleado])->with('successfully', 'Tu respuesta se ha guardado exitosamente!');
            } else {
                return "La acción ha sido exitosa.";
            }
        } catch (Throwable $e) {
            DB::rollBack();
            return false;
        }
    }


    // public function sendEmailToLogistics()
    // {
    //     $user = User::role('Jefe de Logística')->get();
    //     $user[0]->notify(new NotififyLogistics($user[0]['name']));
    //     return 'Mensaje ha sido enviado';
    //     return $user;
    // }

    public function responder($idEmpleado, $idPedido)
    {
        return view('Orders.index');
    }
}

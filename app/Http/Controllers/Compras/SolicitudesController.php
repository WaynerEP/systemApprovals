<?php

namespace App\Http\Controllers\Compras;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\SolicitudCompra;
use App\Models\Aprobaciones;
use App\Models\Solicitud;
use DB;

class SolicitudesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $paginate = request('paginate', 8);
        $search = request('search');
        if (request('inicio') && request('fin')) {
            $date1 = request('inicio') . ' 00:00:00.0000000';
            $date2 = request('fin') . ' 23:59:59.0000000';
            $data = Solicitud::select('idSolicitud', 'idPedido', 'fechaSolicitud', 'estado')
                ->with(['aprobaciones', 'aprobaciones.empleado', 'aprobaciones.empleado.cargo:idCargo,cargo', 'aprobaciones.empleado.ciudadano:dniCiudadano,nombres'])
                ->where('idSolicitud', 'like', "%$search%")
                ->whereBetween('fechaSolicitud', [$date1, $date2])
                ->paginate($paginate);
        } else {
            $data = Solicitud::select('idSolicitud', 'idPedido', 'fechaSolicitud', 'estado')
                ->with(['aprobaciones', 'aprobaciones.empleado', 'aprobaciones.empleado.cargo:idCargo,cargo', 'aprobaciones.empleado.ciudadano:dniCiudadano,nombres'])
                ->where('idSolicitud', 'like', "%$search%")
                ->paginate($paginate);
        }

        return response()->json($data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $monto = $request->monto;
        $detailProforma = $request->detalleProformas;
        $detailPedido = $request->detallePedido;
        $pedido = $request->pedido;
        $idPedido = $request->idPedido;
        $nota = $request->notas;
        $empleado = $request->empleado;
        //guardamos la solicitud
        try {
            DB::beginTransaction();
            // insertamos nueva solicitud
            DB::insert("insert into solicitudes(idPedido, nota,codEmpleado) values(?,?,?)", [$idPedido, $nota, $empleado]);

            //obtenemos el ultimo id
            $solicitud = DB::select('select max(idSolicitud) as id from solicitudes');
            $idSolicitud = $solicitud[0]->id;

            //save solicitudes proformas
            for ($i = 0; $i < count($detailProforma); $i++) {
                DB::update("EXEC spRegisterSolicitudProformas ?,?", array($idSolicitud, $detailProforma[$i]['idProforma']));
            }
            # sending emails
            $users = DB::select('Exec spUserSendEmail ?', array($monto));
            foreach ($users as $index => $item) {
                DB::insert("insert into aprobaciones(idSolicitud, codEmpleado) values(?,?)", [$idSolicitud, $users[$index]->codEmpleado]);
                Mail::to($users[$index]->correo)->queue(new SolicitudCompra($users[0], $users[$index], $idSolicitud, $pedido, $detailPedido, $detailProforma));
            }
            # confirmation of changes
            DB::commit();

            return "La acción ha sido exitosa!.";
        } catch (Throwable $e) {
            DB::rollBack();
            return false;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

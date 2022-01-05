<?php

namespace App\Http\Controllers\Aprobaciones;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Aprobaciones;
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
        DB::update("EXEC spUpdateAprobaciones ?,?,?,?", array($idSolicitud, $idEmpleado, $status, $motivo));

        if ($request->option == 'op') {
            return redirect()->route('order', [$idSolicitud, $idEmpleado])->with('successfully', 'Tu respuesta se ha guardado exitosamente!');
        } else {
            return "La acción ha sido exitosa.";
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
    public function responder($idEmpleado, $idPedido)
    {
        return view('Orders.index');
    }
}

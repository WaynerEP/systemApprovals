<?php

namespace App\Http\Controllers\Compras;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use App\Mail\SolicitudCompra;
use Illuminate\Http\Request;
use App\Models\Pedido;
use App\Models\DetallePedidos;
use App\Models\ProformaProveedor;
use App\Models\Solicitud;
use App\Models\SolicitudProformas;
use Illuminate\Support\Facades\Storage;
use DB;


class PedidoController extends Controller
{

    public function index()
    {
        //
    }

    public function store(Request $request)
    {
        $request->validate([
            'total' => 'required',
            'detalle' => 'required',
        ]);

        $data = Pedido::create([
            'monto' => $request->total,
            'notas' => $request->notas
        ]);

        $id = $data->idPedido;
        $detalle = $request->detalle;

        foreach ($detalle  as $index => $dp) {
            DetallePedidos::create([
                'idPedido' => $id,
                'idProducto' => $detalle[$index]['idProducto'],
                'cantidad' => $detalle[$index]['cantidad'],
                'costoUnitario' => $detalle[$index]['precio'],
                'descuento' => $detalle[$index]['descuento'],
            ]);
        }
        return "Pedido registrado con éxito!.";
    }

    public function show($id)
    {
        //
    }


    public function storeProformas(Request $request)
    {
        $request->validate([
            'detalleProforma' => 'required',
        ]);
        $idPedido = ltrim($request->idPedido, '0');
        $idProveedores = $request->idProveedor;
        $montos = $request->montos;
        $date = date('Y-m-d');

        if ($request->hasFile('detalleProforma')) {
            foreach ($request->file('detalleProforma')  as $index => $file) {
                //guardamos en storage
                $file_name = $file->getClientOriginalName();
                Storage::putFileAs("/public/proformas/Pedido " . $idPedido . '/', $file, $file_name);
                //guardamos en Base de datos
                ProformaProveedor::create([
                    'idPedido' => $idPedido,
                    'idProveedor' => $idProveedores[$index],
                    'archivo' => $file_name,
                    'montoProforma' => $montos[$index],
                ]);
            }
            return "La acción ha sido exitosa!";
        } else {
            return "La acción ha fallado!";
        }
    }

    public function storeSolicitud(Request $request)
    {
        $monto = $request->monto;
        $detailProforma = $request->detalleProformas;
        $detailPedido = $request->detallePedido;
        $pedido = $request->pedido;
        $idPedido = $request->idPedido;
        $nota = $request->notas;
        //guardamos la solicitud
        try {
            DB::beginTransaction();
            // insertamos nueva solicitud
            DB::insert("insert into solicitudes(idPedido, nota) values(?,?)", [$idPedido, $nota]);

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





    public function showProforma($idPedido, $value)
    {
        $file = Storage::get('/public/proformas/Pedido ' . $idPedido . '/' . $value);
        $headers = [
            'Content-type' => 'application/pdf',
        ];
        return response($file, 200, $headers);
    }
}

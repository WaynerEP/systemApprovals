<?php

namespace App\Http\Controllers\Compras;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pedido;
use App\Models\DetallePedidos;
use App\Models\ProformaProveedor;
use Illuminate\Support\Facades\Storage;

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
                Storage::putFileAs("/public/proformas/Pedido ".$idPedido.'/', $file, $file_name);
                //guardamos en Base de datos
                ProformaProveedor::create([
                    'idPedido' => $idPedido,
                    'idProveedor' => $idProveedores[$index],
                    'archivo' => $file_name,
                    'montoProforma' => $montos[$index],
                ]);
            }
            return "Registro exitoso!";
        } else {
            return "Ha ocurrido un error!";
        }
    }
}

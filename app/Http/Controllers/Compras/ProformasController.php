<?php

namespace App\Http\Controllers\Compras;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\ProformaProveedor;
use App\Models\Pedido;
use Illuminate\Support\Facades\Storage;

class ProformasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Pedido::with(['proformas' => function ($query) {
            $query->where('proformaProveedor.idProforma', '<>', null);
        }])->get();
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
        $request->validate([
            'detalleProforma' => 'required',
            'idProveedor' => 'required',
            'montos' => 'required',
            'idPedido' => 'required',
        ]);
        $idPedido = ltrim($request->idPedido, '0');
        $idProveedores = $request->idProveedor;
        $montos = $request->montos;

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

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showProforma($idPedido, $value)
    {
        $file = Storage::get('/public/proformas/Pedido ' . $idPedido . '/' . $value);
        $headers = [
            'Content-type' => 'application/pdf',
        ];
        return response($file, 200, $headers);
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

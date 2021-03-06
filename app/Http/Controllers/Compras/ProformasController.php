<?php

namespace App\Http\Controllers\Compras;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProformaProveedor;
use Illuminate\Support\Facades\Storage;
use DB;
use Carbon\Carbon;

class ProformasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $top = request('top', 3);
        $data = DB::select('Exec spGetListToProformas ?', array($top));
        $datos = $this->groupBy('date', $data);
        return response()->json($datos);
    }


    public function groupBy($key, $data)
    {
        $result = array();

        foreach ($data as $val) {
            if (array_key_exists($key, $val)) {
                $result[$val->$key][] = $val;
            } else {
                $result[""][] = $val;
            }
        }
        return $result;
    }

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
                $file_name = $file->getClientOriginalName();
                $file_size = number_format($file->getSize() / 1000, 2) . 'kb';
                Storage::putFileAs("/public/proformas/Pedido " . $idPedido . '/', $file, $file_name);
                ProformaProveedor::create([
                    'idPedido' => $idPedido,
                    'idProveedor' => $idProveedores[$index],
                    'archivo' => $file_name,
                    'sizeFile' => $file_size,
                    'montoProforma' => $montos[$index],
                ]);
            }
            return "La acción ha sido exitosa.";
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

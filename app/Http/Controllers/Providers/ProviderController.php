<?php

namespace App\Http\Controllers\Providers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Proveedor;

class ProviderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        //
        $request->validate([
            'businessName' => 'required|string|max:80|unique:proveedores,razonSocial',
            'provider' => 'required',
            'address' => 'required',
            'city' => 'required',
            'phone' => 'required',
            'codePostal' => 'required',
            'email' => 'required',
            'country' => 'required',
            'ruc' => 'required|min:11|max:11',
        ]);

        Proveedor::create([
            'estado' => $request['status'],
            'dniRepresentante' => $request['provider'],
            'razonSocial' => $request['businessName'],
            'direccion' => $request['address'],
            'ciudad' => $request['city'],
            'telefono' => $request['phone'],
            'codPostal' => $request['codePostal'],
            'email' => $request['email'],
            'pais' => $request['country'],
            'ruc' => $request['ruc']
        ]);

        return response('Proveedor creado exitosamente!.', 200);
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
        $request->validate([
            'businessName' => 'required|string|max:255|unique:proveedores,razonSocial,'.$id.',idProveedor',
            'address' => 'required',
            'city' => 'required',
            'phone' => 'required',
            'codePostal' => 'required',
            'email' => 'required',
            'country' => 'required',
            'ruc' => 'required|min:11|min:11',
        ]);

        Proveedor::find($id)->update([
            'razonSocial' => $request['businessName'],
            'direccion' => $request['address'],
            'ciudad' => $request['city'],
            'telefono' => $request['phone'],
            'codPostal' => $request['codePostal'],
            'email' => $request['email'],
            'pais' => $request['country'],
            'ruc' => $request['ruc']
        ]);

        return response('Proveedor actualizado!.', 200);
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
        Proveedor::find($id)->delete();

        return response('Proveedor removido!.', 200);
    }
}

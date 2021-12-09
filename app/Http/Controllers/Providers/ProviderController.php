<?php

namespace App\Http\Controllers\Providers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Provider;

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
            'businessName' => 'required|string|max:255|unique:proveedores,razonSocial',
            'provider' => 'required'
        ]);

        Provider::create([
            'dniRepresentante' => $request['provider'],
            'razonSocial' => $request['businessName'],
            'estado' => $request['status']
        ]);

        return response('Proveedor creado!.', 200);
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
            'businessName' => 'required|string|max:255|unique:proveedores,razonSocial,'.$id.',idProveedor'
            // 'provider' => 'required',
            // 'status' => 'required'
        ]);

        Provider::find($id)->update([
            'razonSocial' => $request['businessName'],
            // 'email' => $request['email'],
            // 'status' => $request['status']
        ]);

        return response('Proveedor Actualizado!.', 200);
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
        Provider::find($id)->delete();
        // $provider=Provider::find($id);
        // $provider->estado = 0;
        // $provider->save();

        return response('Proveedor inhabilitado!.', 200);
    }
}
<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use DB;
use App\Models\Product;
use App\Models\TypeProduct;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return view('Productos.index');
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
            'descriptionProduct' => 'required|string|max:100|unique:productos,descripcionProducto',
            'type' => 'required',
            'measure' => 'required',
            'price' => 'required',
            'stock' => 'required',
        ]);

        if ($request->hasFile('fileImage')) {
            $customFileName = uniqid() . '.png';

            Storage::putFileAs('/public/products/', $request->file('fileImage'), $customFileName);
        }

        Product::create([
            'descripcionProducto' => $request['descriptionProduct'],
            'idTipo' => $request['type'],
            'medida' => $request['measure'],
            'precioC' => $request['price'],
            'stock' => $request['stock'],
            'estado' => $request['status'],
            'image' => '/' . 'products/' . $customFileName
        ]);

        return response('La acción ha sido exitosa!.', 200);
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
        // return $request;

        $request->validate([
            'descriptionProduct' => 'required|string|max:100|unique:productos,descripcionProducto,' . $id . ',idProducto',
            'type' => 'required',
            'measure' => 'required',
            'price' => 'required',
            'stock' => 'required',
        ]);

        if ($request->hasFile('fileImage')) {
            $customFileName = uniqid() . '.png';

            Storage::putFileAs('/public/products/', $request->file('fileImage'), $customFileName);
        }

        $product = Product::find($id);

        if ($customFileName != null) {
            if (file_exists($product->image)) {
                unlink($product->image);
            }
        }

        $product->update([
            'descripcionProducto' => $request['descriptionProduct'],
            'idTipo' => $request['type'],
            'medida' => $request['measure'],
            'precioC' => $request['price'],
            'stock' => $request['stock'],
            'estado' => $request['status'],
            'image' => '/' . 'products/' . $customFileName
        ]);

        return response('La acción ha sido exitosa!.', 200);
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
        Product::find($id)->delete();
        // $product=Product::find($id);
        // $product->estado = 0;
        // $product->save();

        return response('La acción ha sido exitosa!.', 200);
    }


    //Aqui crearemos y actualizamos el tipoProductos
    public function storeType(Request $request)
    {
        //
        $request->validate([
            'descriptionCategorie' => 'required|string|max:100|unique:tipoProducto,descripcion',
        ]);

        TypeProduct::create([
            'descripcion' => $request['descriptionCategorie'],
        ]);

        return response('La acción ha sido exitosa!.', 200);
    }

    public function updateType(Request $request, $id)
    {
        //
        $request->validate([
            'descriptionCategorie' => 'required|string|max:100|unique:tipoProducto,descripcion,' . $id . ',idTipo'
        ]);

        TypeProduct::find($id)->update([
            'descripcion' => $request['descriptionCategorie'],
        ]);

        return response('La acción ha sido exitosa!.', 200);
    }

    public function destroyType($id)
    {
        //
        Product::where('idTipo', $id)->delete();
        TypeProduct::find($id)->delete();

        return response('La acción ha sido exitosa!.', 200);
    }
}

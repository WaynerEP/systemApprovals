<?php

namespace App\Http\Controllers\Solicitudes;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PDFsControleer extends Controller
{
    public function store(Request $request)
    {
        // return $request;
        $date = date('Y-m-d');
        if ($request->hasFile('files')) {
            $documents = [];
            foreach ($request->file('files') as $file) {
                $file_name = $date . '_' . $file->getClientOriginalName();

                Storage::putFileAs('/public/proformas/', $file, $file_name);
                array_push($documents, $file_name);
            }
            return $documents;
        } else {
            return "Ha ocurrido un error!";
        }
    }
}

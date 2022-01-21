<?php

namespace App\Http\Controllers\Compras;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pedido;
use App\Models\DetallePedidos;
use Carbon\Carbon;
use DB;
class PedidoController extends Controller
{

    public function index()
    {
        $paginate = request('paginate', 8);
        $search = request('search');

        if (request('inicio') && request('fin')) {
            $date1 = Carbon::parse(request('inicio'))->format('Y-m-d') . ' 00:00:00.0000000';
            $date2 = Carbon::parse(request('fin'))->format('Y-m-d') . ' 23:59:59.0000000';
            $data = DetallePedidos::join('pedidos as p', 'p.idPedido', '=', 'detallePedidos.idPedido')
                ->select(DB::raw('count(detallePedidos.idPedido) as pedido_count, p.idPedido, p.fechaPedido, p.monto, p.estado'))
                ->groupBy('p.idPedido', 'p.fechaPedido', 'p.monto', 'p.estado')
                ->whereBetween('p.fechaPedido', [$date1, $date2])
                ->where('p.idPedido', 'like', "%$search%")
                ->paginate($paginate);
        } else {
            $data = DetallePedidos::join('pedidos as p', 'p.idPedido', '=', 'detallePedidos.idPedido')
                ->select(DB::raw('count(detallePedidos.idPedido) as pedido_count, p.idPedido, p.fechaPedido, p.monto, p.estado'))
                ->where('p.idPedido', 'like', "%$search%")
                ->groupBy('p.idPedido', 'p.fechaPedido', 'p.monto', 'p.estado')
                ->paginate($paginate);
        }
        return response()->json($data);
    }



    public function store(Request $request)
    {
        $request->validate([
            'total' => 'required',
            'detalle' => 'required',
        ]);
        // $date = Carbon::now()->subDays(5);
        $data = Pedido::create([
            'monto' => $request->total,
            'notas' => $request->notas,
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


    public function destroy($id)
    {
        // el estado 3 significa que ha sido anulado
        $pedido = Pedido::find($id);
        $pedido->estado = "3";
        $pedido->save();
        return "Pedido anulado con éxito!.";
    }
}

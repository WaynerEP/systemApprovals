<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Solicitud de Compra</title>
    <style type="text/css">
        #outlook a {
            padding: 0
        }

        body {
            width: 100% !important;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
            margin: 0;
            padding: 0;
            font-family: Helvetica, arial, sans-serif
        }

        label {
            display: inline-block;
            margin-bottom: .5rem
        }


        .backgroundTable {
            margin: 0;
            padding: 0;
            width: 100% !important;
            line-height: 100% !important
        }

        .main-temp table {
            border-collapse: collapse;
            mso-table-lspace: 0;
            mso-table-rspace: 0;
            font-family: Helvetica, arial, sans-serif
        }

        .main-temp table td {
            border-collapse: collapse
        }

        .text-center {
            text-align: center !important
        }

        .mg-b-20 {
            margin-bottom: 20px
        }

        .btn-primary {
            text-align: center;
            padding: .594rem .75rem;
            font-size: .875rem;
            line-height: 1.5;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            color: #fff;
            background-color: #0954d3;
            background-image: none;
            border: 0 solid #0954d3
        }

        .text-logo {
            color: #c4cdd2;
            margin: 0;
            letter-spacing: -2;
            margin-bottom: 0;
            font-size: 33px;
            font-weight: 700;
            font-family: Roboto, "Helvetica Neue", Arial, sans-serif
        }

    </style>
</head>

<body>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="backgroundTable main-temp"
        style="background-color:#f0f2f7">
        <tbody>
            <tr>
                <td>
                    <table width="600" align="center" cellpadding="15" cellspacing="0" border="0" class="devicewidth"
                        style="background-color:#fff">
                        <tbody>
                            <tr>
                                <td style="padding-top:30px">
                                    <table width="560" align="center" cellpadding="0" cellspacing="0" border="0"
                                        class="devicewidthinner" style="border-bottom:1px solid #eee;text-align:center">
                                        <tbody>
                                            <tr>
                                                <td
                                                    style="padding-bottom:10px;display:flex;align-items:center;justify-content:space-between">
                                                    <h2 class="text-logo">🏢El valle<span>.</span></h2><a
                                                        href="{{ route('home') }}" target="_blank"
                                                        class="btn btn-primary">Mi cuenta ⎆</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center"
                                                    style="font-family:Open Sans,Helvetica,Arial,sans-serif;font-size:16px;font-weight:400;line-height:24px;padding-top:25px">
                                                    <img src="https://ci3.googleusercontent.com/proxy/_DpuOIdcZbJ83x-aD4MlrRYtuvC_BR9edk9qUH9XnBzwSWobHTOmfWYAIjsZpCjxaBex_Gu_9d-2Ig8Jual4qNqIElKUxxF3B2uQkCAuJQiyCFgZlA_VMYDIPwzgjpFzMdLA_tvs0rJuaJdR4X5ISwSR_VpdIYjOW2tqcHdV_4ULBvzEq1J0EMnwjGpjAkI=s0-d-e1-ft#http://a.academia-assets.com/assets/bulk-download-email-8f4e8ce2105d33444212de31112a3ba49e8cfffb7dcb320237442fe8d2e1c132.png"
                                                        width="370" height="200" style="display:block;border:0"><br>
                                                    <h2
                                                        style="font-size:30px;font-weight:800;line-height:36px;color:#686868;margin:0">
                                                        Nueva Solicitud de Compra!</h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left"
                                                    style="font-size:14px;color:#666;font-weight:400;line-height:24px;padding-top:10px">
                                                    <p align="center">Hey!, Sr(a). , se le ha enviado una nueva
                                                        solicitud de compra que requiere de su inmediata revisión.</p>
                                                    <div class="text-center mg-b-20"><a target="_blank"
                                                            class="btn btn-primary">Enviar Respuesta ▸</a></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top:0">
                                    <table width="560" align="center" cellpadding="0" cellspacing="0" border="0"
                                        class="devicewidthinner" style="border-bottom:1px solid #bbb">
                                        <tbody>
                                            <tr>
                                                <td
                                                    style="width:55%;font-size:16px;font-weight:700;color:#666;padding-bottom:5px">
                                                    Pedido:</td>
                                                <td
                                                    style="width:45%;font-size:16px;font-weight:700;color:#666;padding-bottom:5px">
                                                    Solicita:</td>
                                            </tr>
                                            <tr>
                                                <td style="width:55%;font-size:14px;line-height:18px;color:#666">
                                                    #0000{{ $pedido['idPedido'] }}</td>
                                                <td style="width:45%;font-size:14px;line-height:18px;color:#666">
                                                    {{ $user->empleado }}</td>
                                            </tr>
                                            <tr>
                                                <td style="width:55%;font-size:14px;line-height:18px;color:#666">
                                                    {{ $pedido['fechaPedido'] }}</td>
                                                <td style="width:45%;font-size:14px;line-height:18px;color:#666">
                                                    {{ $user->correo }}</td>
                                            </tr>
                                            <tr>
                                                <td
                                                    style="width:55%;font-size:14px;line-height:18px;color:#666;padding-bottom:10px">
                                                    S/.{{ number_format($pedido['monto'], 2) }}</td>
                                                <td
                                                    style="width:45%;font-size:14px;line-height:18px;color:#666;padding-bottom:10px">
                                                    {{ $user->cargo }}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top:0">
                                    <table width="560" align="center" cellpadding="0" cellspacing="0" border="0"
                                        class="devicewidthinner" style="border-bottom:1px solid #eee">
                                        @foreach ($detailOrder as $item)<tbody><tr><td rowspan="4" style="padding-right:10px;padding-bottom:10px"><img style="height:80px" src="{{ $item['image'] ? $message->embed($item['image']) : 'http://via.placeholder.com/800x533' }}" alt="Product Image"/></td><td colspan="2" style="font-size:14px;font-weight:700;color:#666;padding-bottom:5px">{{ $item['descripcionProducto'] }}</td></tr><tr><td style="font-size:14px;line-height:18px;color:#757575;width:440px">Quantity: {{ $item['cantidad'] }} {{ $item['medida'] }}</td><td style="width:130px"></td></tr><tr><td style="font-size:14px;line-height:18px;color:#757575"></td><td style="font-size:14px;line-height:18px;color:#757575;text-align:right">Precio: S/.{{ number_format($item['costoUnitario'], 2) }}</td></tr><tr><td style="font-size:14px;line-height:18px;color:#757575;padding-bottom:10px">SubTotal:</td><td style="font-size:14px;line-height:18px;color:#757575;text-align:right;padding-bottom:10px"><b style="color:#666">S/.{{ number_format($item['cantidad'] * $item['costoUnitario'], 2) }}</b></td></tr></tbody>@endforeach</table></td></tr><tr><td style="padding-top:0"><table width="560" align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner" style="border-bottom:1px solid #bbb;margin-top:-5px"><tbody><tr><td rowspan="5" style="width:55%"></td><td style="font-size:14px;line-height:18px;color:#666">Sub-Total:</td><td style="font-size:14px;line-height:18px;color:#666;width:130px;text-align:right">S/.{{ number_format($pedido['subtotal'], 2) }}</td></tr><tr><td style="font-size:14px;line-height:18px;color:#666;padding-bottom:10px;border-bottom:1px solid #eee">Igv(18%):</td><td style="font-size:14px;line-height:18px;color:#666;padding-bottom:10px;border-bottom:1px solid #eee;text-align:right">S/.{{ number_format($pedido['igv'], 2) }}</td></tr><tr><td style="font-size:14px;font-weight:700;line-height:18px;color:#666;padding-top:10px;padding-bottom:10px">TOTAL</td><td style="font-size:14px;font-weight:700;line-height:18px;color:#666;text-align:right;padding-top:10px;padding-bottom:10px">S/.{{ number_format($pedido['monto'], 2) }}</td></tr></tbody></table></td></tr><tr><td style="padding:0 10px"><table width="560" align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner"><tbody><tr><td colspan="2" style="font-size:16px;font-weight:700;color:#666;padding-bottom:10px">Proformas Adjuntas:</td></tr>@foreach ($detailProforma as $item)<tr><td style="width:45%;font-size:14px;line-height:18px;font-weight:500;color:#666;padding-bottom:20px">{{ $item['razonSocial'] }}</td><td style="width:50%;font-size:14px;line-height:18px;font-weight:500;color:#666;padding-bottom:20px"><a href="{{ url('/showProforma' . '/' . $pedido['idPedido'] . '/' . $item['archivo']) }}" target="_blank">{{ $item['archivo'] }}</a></td><td style="width:15%;font-size:14px;line-height:18px;font-weight:500;color:#666;padding-left:10px;padding-bottom:20px"><b>S/.{{ number_format($item['montoProforma'], 2) }}</b></td></tr>@endforeach<tr>
                                            <td colspan="3"
                                                style="width:100%;text-align:center;font-style:italic;font-size:13px;font-weight:600;color:#666;padding:15px 0;border-top:1px solid #eee">
                                                <b style="font-size:14px">Nota:</b> Este correo es de carácter
                                                urgente!!.</td>
                                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </td>
    </tr>
    </tbody>
    </table>
</body>

</html>

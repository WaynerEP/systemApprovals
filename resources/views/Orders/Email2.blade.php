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

        .ExternalClass {
            width: 100%
        }

        .ExternalClass,
        .ExternalClass div,
        .ExternalClass font,
        .ExternalClass p,
        .ExternalClass span,
        .ExternalClass td {
            line-height: 100%
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

        .mg-t-20 {
            margin-top: 20px
        }

        .mg-b-20 {
            margin-bottom: 20px
        }

        .form-group {
            margin-bottom: 1rem
        }


        .btn-primary {
            text-align: center;
            padding: 0.594rem 0.75rem;
            font-size: .875rem;
            line-height: 1.5;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            color: #ffffff;
            background-color: #0954d3;
            background-image: none;
            border: 0 solid #0954d3;
        }

        .text-logo {
            color: #c4cdd2;
            margin: 0;
            margin-bottom: 0;
            letter-spacing: -2px;
            font-size: 33px;
            font-weight: 700;
            font-family: "Roboto", "Helvetica Neue", Arial, sans-serif;
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
                                                    <h2 class="text-logo">
                                                        🏢 El valle<span>.</span> </h2>
                                                    <a href="{{ route('home') }}" target="_blank"
                                                        class="btn-primary">Mi cuenta ⎆</a>
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
                                                    <p align="center">Hey!, Sr(a). {{ $dest->empleado }}, se le ha
                                                        enviado una nueva solicitud de compra que requiere de su
                                                        inmediata revisión.</p>
                                                    <div class="text-center mg-b-20"><a
                                                            href="{{ route('order', [$idSolicitud, $dest->codEmpleado]) }}"
                                                            target="_blank" class="btn btn-primary">Enviar Respuesta</a>
                                                    </div>
                                                </td>
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
    </td>
    </tr>
    </tbody>
    </table>
</body>

</html>

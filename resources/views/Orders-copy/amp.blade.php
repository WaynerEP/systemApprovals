<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>
    <form method="POST" action="{{ route('orders.store') }}"">
        @csrf
    <div class="   form-group"><label>Motivo :</label> <textarea rows="3" class="form-control" name="motivo" required
            placeholder="Ingresa una descripción"></textarea>
        <small>Ingresa el motivo de tu desición.</small>
        </div>
        <div class="form-group"><label class="rdiobox">
                <input name="rdio" type="radio" value="Aceptar" required>
                <span>Aprobar</span>
            </label></div>
        <div class="form-group"><label class="rdiobox">
                <input name="rdio" type="radio" value="Rechazar" required>
                <span>Rechazar</span>
            </label></div>
        <div class="text-center mg-b-20"><button type="submit" class="btn btn-primary">Enviar Respuesta</button>
            <span>Enviado!!</span>
        </div>
    </form>
</body>

</html>

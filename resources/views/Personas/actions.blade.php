<a href="{{ route('personas.edit', $dni) }}" class="btn btn-outline-primary btn-sm">
    <i class="fa fa-pencil"></i>
</a>
<button onClick="ConfirmarBorrado({{ $dni }})" class="btn btn-outline-danger btn-sm">
    <i class="fa fa-close"></i>
</button>

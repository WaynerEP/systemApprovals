<div id="modal-confirmation" class="modal fade effect-fall">
    <div class="modal-dialog" role="document">
        <div class="modal-content tx-size-sm">
            <div class="modal-body tx-center pd-y-20 pd-x-20">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <i class="icon icon ion-ios-close-outline tx-100 tx-danger lh-1 mg-t-20 d-inline-block"></i>
                <h4 class="tx-danger mg-b-20">Confirmación!</h4>
                <p class="mg-b-20 mg-x-20">Esta seguro de realizar esta acción?</p>
                <input type="hidden" id="idPerson">
                <div class="d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary mr-3" data-dismiss="modal"
                        aria-label="Close">Cancelar</button>
                    <button type="button" id="btnEliminar" class="btn btn-danger">Continuar</button>
                </div>
            </div><!-- modal-body -->
        </div><!-- modal-content -->
    </div><!-- modal-dialog -->
</div><!-- modal -->

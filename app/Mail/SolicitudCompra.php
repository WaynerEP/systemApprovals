<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Mehedi\AmpMail\Mimes\Amp;

class SolicitudCompra extends Mailable
{
    use Queueable, SerializesModels, Amp;

    public $subject = "Nueva Solicitud de Compra - Urgente";
    public $user;
    public $dest;
    public $idSolicitud;
    public $pedido;
    public $detailOrder;
    public $detailProforma;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, $dest,$idSolicitud, $pedido, $detailOrder, $detailProforma)
    {
        $this->user = $user;
        $this->dest = $dest;
        $this->idSolicitud = $idSolicitud;
        $this->pedido = $pedido;
        $this->detailOrder = $detailOrder;
        $this->detailProforma = $detailProforma;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view(
            'Orders.email'
        );
    }
}

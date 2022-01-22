<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SolicitudCompra extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    public $subject = "📄 [Urgente] Nueva Solicitud de Compra";
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
    public function __construct($user, $to,$idSolicitud, $pedido, $detailOrder, $detailProforma)
    {
        $this->user = $user;
        $this->dest = $to;
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

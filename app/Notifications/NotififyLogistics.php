<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NotififyLogistics extends Notification implements ShouldQueue
{
    use Queueable;

    protected $to;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($to)
    {
        $this->to = $to;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('📄 [URGENTE] NUEVO REQUERIMIENTO DE COMPRA 🚀')
            ->greeting('Mensaje de aviso!')
            ->line('📌 Hola ' . $this->to . ', se ha enviado una nueva compra al área de Logística. Es necesario realizar la compra para continuar con el proceso.')
            ->action('Más informacion ↗', url('/home'))
            ->line('Nota: La solicitud de compra ya tiene las aprobaciones correspondientes.');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}

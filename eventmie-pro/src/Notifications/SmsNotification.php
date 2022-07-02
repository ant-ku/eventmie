<?php

namespace Classiebit\Eventmie\Notifications;

use Classiebit\Eventmie\Channels\SmsChannel;
use Classiebit\Eventmie\Notifications\Messages\SmsMessage;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;

class SmsNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public function __construct(private string $to, private string $sms_content)
    {
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        // check sms creds
        if(checkSmsCreds())
        return [SmsChannel::class, CustomDb::class];

        // if sms creds not set then send only database notifications
        return [CustomDb::class];
    }

    /**
     * Get the Vonage / SMS representation of the notification.
     *
     * @param  mixed  $notifiable
     */
    public function toSms($notifiable): SmsMessage
    {
        return new SmsMessage('+33646314630', $this->sms_content);
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        return [
            'notification'  => $this->to. ': '. $this->sms_content,
            'n_type'        => 'sms',
        ];
    }
}

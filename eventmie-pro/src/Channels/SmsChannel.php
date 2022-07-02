<?php

namespace Classiebit\Eventmie\Channels;

use Classiebit\Eventmie\Notifications\SmsNotification;
use Illuminate\Support\Facades\Http;

class SmsChannel
{
    /**
     * Send the given notification.
     *
     * @param  mixed  $notifiable
     */
    public function send($notifiable, SmsNotification $notification): void
    {
        $message = $notification->toSms($notifiable);

        Http::post('https://9atx71nyvf.execute-api.us-east-1.amazonaws.com/api/send/sms', [
            'phone' => $message->to,
            'message' => $message->content,
        ]);
    }
}

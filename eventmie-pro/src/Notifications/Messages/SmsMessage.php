<?php

namespace Classiebit\Eventmie\Notifications\Messages;

class SmsMessage
{
    public function __construct(public string $to, public string $content)
    {
    }
}

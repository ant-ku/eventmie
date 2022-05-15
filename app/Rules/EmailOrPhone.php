<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class EmailOrPhone implements Rule
{
    private string $message = 'test';

    public function __construct(private bool $creating = false)
    {
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value): bool
    {
        if(is_numeric($value)) {
            return $this->validatePhone($value);
        }

        return $this->validateEmail($value);
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message(): string
    {
        return $this->message;
    }

    private function validatePhone(string $value): bool
    {
        $constraint = ['phone:BF,mobile'];
        if ($this->creating) {
            $constraint[] = 'unique:users';
        }

        $validator = Validator::make(
            ['phone' => $value],
            [
                'phone' => $constraint
            ]
        );

        try {
            $validator->validate();
        } catch (ValidationException $e) {
            dd($e);
        }

        return !$validator->fails();
    }

    private function validateEmail(string $value): bool
    {
        $constraint = ['email', 'max:255'];
        if ($this->creating) {
            $constraint[] = 'unique:users';
        }

        $validator = Validator::make(
            ['email' => $value],
            [
                'email' => $constraint
            ]
        );

        try {
            $validator->validate();
        } catch (ValidationException) {
        }

        return !$validator->fails();
    }
}

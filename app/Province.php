<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    protected $guarded = [];

    //for slug function (to replace URL id)
    public function getRouteKeyName()
    {
        return 'slug';
    }
}

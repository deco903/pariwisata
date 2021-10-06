<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    protected $guarded = [];

    //for slug function (to replace URL id)
    public function getRouteKeyName()
    {
        return 'slug';
    }

    //relationship from table provinces(province_id)
    public function province()
    {
        return $this->belongsTo('App\province');
    }
}

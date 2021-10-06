<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
    protected $guarded = [];

    public function city()
    {
        return $this->belongsTo(city::class);
    }

    public function user()
    {
        return $this->belongsTo(user::class);
    }

    //look at data content(image)
    public function getThumbnail()
    {
        return asset('/images/'. $this->thumbnail);
    }

    //continued from new content; from method index of dashboardcontroller.php script
    public function getCountContent($user)
    {
        return $this->where('user_id', $user)->count();
    }

    public function getCountContentPublish($user)
    {
        return $this->where('user_id', $user)->where('status_publish', 1)->count();
    }

    public function getCountContentNotPublish($user)
    {
        return $this->where('user_id', $user)->where('status_publish', 0)->count();
    }
    
    //for slug function (to replace URL id)
    public function getRouteKeyName()
    {
        return 'slug';
    }
}

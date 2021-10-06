<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use Notifiable, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','image'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    //to get picture from field image of user table
    public function getImage()
    {
        //if the user doesn`t chance the default picture 
        if($this->image == null){
            return asset('/images/profile/default.jpg');
        }
        return asset('/images/'. $this->image);//image taken from field of user table
    }

    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    //continued from ContentPolicy.php 
    public function ownsContent(Content $content)
    {
        return auth()->id() === $content->user->id;
    }

   
}

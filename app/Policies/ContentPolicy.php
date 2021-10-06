<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Content;

class ContentPolicy
{
    use HandlesAuthorization;
    //function policy that using by !administrator to edit his ownscontent
    public function edit(User $user, Content $content)
    {
        return $user->ownsContent($content);
    }
   
}

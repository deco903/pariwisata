<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\user;
use App\content;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $users = user::all();
        $content = content::count();
        //content status publish or not publish
        $publish = content::where('status_publish',1)->count();
        $notPublish = content::where('status_publish',0)->count();

        //retrieve data from table content 
        //(notes:new content; signify that in the model content must be create the new function)
        $getCountContent = new content;
        $getCountContentPublish = new content;
        $getCountContentNotPublish = new content;
        
        //function UI for !administrator
        $userContent = Content::where('user_id', auth()->user()->id)->count();
        $userContentPublish = Content::where('user_id', auth()->user()->id)
                                ->where('status_publish', 1)
                                ->count();
        $userContentNotPublish = Content::where('user_id', auth()->user()->id)
                                ->where('status_publish', 0)
                                ->count();


        return view('admin.dashboard',compact('users','content','publish','notPublish',
        'getCountContent','getCountContentPublish','getCountContentNotPublish','userContent',
        'userContentPublish','userContentNotPublish'));
    }




}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\content;
use App\Province;
use App\City;

class HomepageController extends Controller
{
    public function index()
    {
        //show contents in front end
        $contents = content::where('status_publish',1)->latest()->limit(7)->get();
        return view('homepage.index', compact('contents'));
    }

    //lainya
    public function detailContent(Province $province,City $city, Content $content)
    {
        $contents = content::where('status_publish', 1)->get()->random('5');
        $provinces = province::get()->random('5');
        //dd($contents);

         return view('homepage.detail', compact('province','city','content',
         'contents','provinces'));
    }

    //provinsi
    public function getContentProvince(Province $province)
    {
        $city = city::where('province_id', $province->id)->pluck('id');//province_id using because there`s no field province in content table
        $contents = content::where('status_publish', 1)->whereIn('city_id', $city)->paginate(3);
        return view('homepage.getContentProvince', compact('contents','province'));
    }

    //to showup province table
    public function getProvince()
    {
        $provinces = province::all();
        return view('homepage.getProvince', compact('provinces'));
    }

    //search function
    public function result(Request $request)
    {
        $search = $request->search;
        $city = city::where('name', 'like', '%'. $search .'%')->first();
        $province = province::where('name', 'like', '%'. $search .'%')->first();
        $contents = content::where('status_publish', 1)->where('title', 'like', '%'. $search .'%')->paginate(3);
    
        if($city == !NULL){
            $contents = content::where('status_publish', 1)->where('city_id', $city->id)->paginate(3);
        }

        if($province == !NULL){
            $city = city::where('province_id', $province->id)->pluck('id');//pluck function replace data to be array
            $contents = content::where('status_publish', 1)->whereIn('city_id', $city)->paginate(3);
        }

        return view('homepage.result', compact('search','contents'));
    }

    public function otherContent()
    {
        $current_id = content::where('status_publish', 1)->offset(0)->limit(7)->latest()->pluck('id');
        $contents = content::where('status_publish', 1)->latest()->whereNotIn('id', $current_id)->paginate(7);
        return view('homepage.otherContent', compact('contents'));
    }
}

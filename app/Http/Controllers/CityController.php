<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Province;
use App\City;
use Str;


class CityController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Province $province)
    {
         $cities = city::where('province_id', $province->id)->get();
         return view('admin.city.index',compact('province','cities'));   
    }

    public function create(Province $province)
    {
         return view('admin.city.create',compact('province'));   
    }

    public function store(Request $request,Province $province)
    {
        //validate
        $this->validate($request,[
            'name' => 'required'
        ],
        [
            'name.required' => 'nama kabupaten belum diisi'
        ]);   

        //insert into table city
        city::create([
            'province_id' => $request->province,
            'name' => $request->name,
            'slug' => str::slug($request->name)
        ]);

        return redirect()->route('city.index', $province)->with('succes','data berhasil ditambah');
    }

    public function edit(Province $province, City $city)
    {
        return view('admin.city.edit',compact('province','city'));  
    }

    public function update(Request $request, Province $province, City $city)
    {
       //validate
        $this->validate($request,[
            'name' => 'required'
        ],
        [
            'name.required' => 'nama kabupaten belum diisi'
        ]);   

        //update
        $city->update([
            'name' => $request->name,
            'slug' => str::slug($request->name)

        ]);    

        return redirect()->route('city.index', $province)->with('succes','data berhasil dirubah');
    }

    public function destroy(Province $province, City $city)
    {
        $city->delete();
        return redirect()->route('city.index', $province)->with('succes','data berhasil dihapus');

    }
}

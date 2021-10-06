<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Province;
use Str;
use Alert;

class ProvinceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $provinces = province::all();
        return view('admin.province.index', compact('provinces'));
    }

    public function create()
    {
        return view('admin.province.create');
    }

    public function store(Request $request)
    {
        //validate
        $this->validate($request,[
            'name' => 'required'
        ],
        [
            'name.required' => 'nama Provinsi belum diisi'
        ]);
        //insert into province table
       province::create([
           'name' => $request->name,
           'slug' => Str::slug($request->name)
       ]);

      
       return redirect()->route('province.index')->with('succes','data berhasil disimpan');
    }

    public function edit(Province $province)
    {
        return view('admin.province.edit', compact('province'));
    }

    public function update(Request $request,Province $province)
    {
        //validate
        $this->validate($request,[
            'name' => 'required'
        ],
        [
            'name.required' => 'nama Provinsi belum diisi'
        ]);

        //update 
        $province->update([
            'name' => $request->name,
            'slug' => Str::slug($request->name)
        ]);

       
        return redirect()->route('province.index')->with('succes','update data berhasil');
    }

    public function destroy(Province $province)
    {
        $province->delete();
        return redirect()->route('province.index')->with('succes','data berhasil dihapus');
    }

}

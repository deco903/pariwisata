<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\content;
use App\city;
use Storage;
use Str;

class ContentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $contents = content::all();
       //function to limit some user so you can see only content that he made
        if(auth()->user()->hasRole('contributor')){
            $contents = content::where('user_id', auth()->user()->id)->get();
        }

        return view('admin.content.index', compact('contents'));
    }

    public function create()
    {
        $cities = city::all();
        return view('admin.content.create', compact('cities'));
    }

    public function store(Request $request)
    {
        //validate
        $this->validate($request,[
            'city' => 'required|not_in:0',
            'title' => 'required',
            'content' => 'required',
            'thumbnail' => 'required|image|mimes:jpeg,png,jpg'
        ],
        [
            'city.not_in' => 'kabupaten/kota belum dipilih',
            'title.required' => 'judul kontent belum di isi',
            'content.required' => 'kontent belum di isi',
            'thumbnail.required' => 'thumbnail belum di isi',
            'thumbnail.mimes' => 'format thumbnail tidak valid',
        ]);
        
        //input to content table
        $image = $request->file('thumbnail')->store('wisata');

        content::create([
            'city_id' => $request->city,
            'user_id' => auth()->user()->id,
            'title' => $request->title,
            'slug' => Str::slug($request->title),
            'content' => $request->content,
            'thumbnail' => $image, 
        ]);

        return redirect()->route('content.index')->with('succes','data berhasil ditambah');
    }

    public function edit(Content $content)
    {
        //function to user !administrator able to edit content any user
        if(auth()->user()->hasRole('contributor')){
           $this->authorize('edit', $content);
        }
        $cities = city::all();
        return view('admin.content.edit', compact('content','cities'));
    }

    public function update(Request $request, Content $content)
    {
         //function to user administrator able to edit content any user
        if(auth()->user()->hasRole('contributor')){
         $this->authorize('edit', $content);
        }

        //validate
        $this->validate($request,[
            'city' => 'required|not_in:0',
            'title' => 'required',
            'content' => 'required'
        ],
        [
            'city.not_in' => 'kabupaten/kota belum dipilih',
            'title.required' => 'judul kontent belum di isi',
            'content.required' => 'kontent belum di isi',
            
        ]);

        //if file picture empty or format picture is not macthing
        if($request->hasFile('thumbnail')){
            $this->validate($request,[
                'thumbnail' => 'required|image|mimes:jpeg,png,jpg',
            ],
            [
                'thumbnail.required' => 'thumbnail belum di isi',
                'thumbnail.mimes' => 'format thumbnail tidak valid',
            ]);
        }

        //if picture change
        $image = $content->thumbnail;

        if($request->hasFile('thumbnail')){
            if($content->thumbnail){
                Storage::delete($content->thumbnail);
            }    
            $image = $request->file('thumbnail')->store('wisata');
        }

        //update
        $content->update([
            'city_id' => $request->city,
            'title' => $request->title,
            'slug' => Str::slug($request->title),
            'content' => $request->content,
            'thumbnail' => $image, 
        ]);

        return redirect()->route('content.index')->with('succes','data berhasil dirubah');
    }

    public function destroy(Content $content)
    {
        $content->delete();
        storage::delete($content->thumbnail);
        return redirect()->route('content.index')->with('succes','data berhasil dihapus');
    }

    //change status
    public function editStatus(Content $content)
    {
        //function to user administrator able to edit content any user
        if(auth()->user()->hasRole('contributor')){
            $this->authorize('edit', $content);
        }
        return view('admin.content.editStatus', compact('content'));
    }

    public function updateStatus(Request $request, Content $content)
    {
        //function to user administrator able to edit content any user
        if(auth()->user()->hasRole('contributor')){
            $this->authorize('edit', $content);
        }
        
        $content->update([
            'status_publish' => $request->status
        ]);

        // dd($content);
        return redirect()->route('content.index')->with('succes','status berhasil dirubah');
    }

    public function show(Content $content)
    {
        return view('admin.content.show', compact('content'));
    }

}

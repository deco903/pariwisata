<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\user;
use Storage;
use Spatie\Permission\Models\role;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $users = user::all();
        return view('admin.user.index', compact('users'));
    }

    public function create()
    {
        $roles = role::all();
        //dd($roles);
        return view('admin.user.create', compact('roles'));
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8',
            'password_confirm' => 'required|same:password',
            'role' => 'not_in:0',
            'image' => 'required|mimes:jpg,png,jpeg'
        ],
        [
            'name.required' => 'nama user harus di isi',
            'email.required' => 'email user harus di isi',
            'email.email' => 'email tidak valid',
            'password.required' => 'password user harus di isi',
            'password.min' => 'password kurang dari 8 character',
            'password_confirm.required' => 'konfirmasi password user harus di isi',
            'password_confirm.same' => 'konfirmasi password tidak sama',
            'role.not_in' => 'hak akses user di isi',
            'image.required' => 'foto user harus di isi',
            'image.mimes' => 'format foto tidak valid'
        ]);

        $image = $request->file('image')->store('profile');

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'image' => $image,
        ]);

        $user->assignRole($request->role);
        return redirect()->route('user.index')->with('succes','data berhasil disimpan');
    }

    public function edit(User $user)
    {
        $roles = Role::all();
        $user_role = user::join('model_has_roles','users.id','=','model_has_roles.model_id')
                        ->join('roles','roles.id','=','model_has_roles.role_id')
                        ->select('users.*','roles.name as role_name')
                        ->where('users.id', $user->id)
                        ->first();
        return view('admin.user.edit', compact('user','roles','user_role'));
    }

    public function update(Request $request, User $user)
    {
        $this->validate($request,[
            'name' => 'required',
            'email' => 'required|email',
            'role' => 'not_in:0',
        ],
        [
            'name.required' => 'nama user harus di isi',
            'email.required' => 'email user harus di isi',
            'email.email' => 'email tidak valid',
           
            'role.not_in' => 'hak akses user di isi'
           
        ]);

        //if the user doesn't want to replace the image
        if($request->hasFile('image')){
            $this->validate($request,[
                'image' => 'required|mimes:jpg,png,jpeg'
            ],
            [
                'image.required' => 'foto user harus di isi',
                'image.mimes' => 'format foto tidak valid'
            ]);
        }

        //if the user doesn`t chance the password
        $password = $user->password;

        if($request->password == !null)
        {
            $this->validate($request,[
                'password_confirm' => 'required|same:password',
                'role' => 'not_in:0',
            ],
            [
                'password.required' => 'password user harus di isi',
                'password.min' => 'password kurang dari 8 character',
                'password_confirm.required' => 'konfirmasi password user harus di isi',
                'password_confirm.same' => 'konfirmasi password tidak sama',
            ]);

            //if the user type the new password (chance)
            $password = bcrypt($request->password);
        }

        //if the user want to replace the image
        $image = $user->image;

        if($request->hasFile('image')){
            if($user->image){
                Storage::delete($user->image);
            }    
            $image = $request->file('image')->store('profile');
        }

        //update
        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'password' => $password,
            'image' => $image, 
        ]);

        //for role optional kontributor or administrator
        if($request->role == null){
            $user->revokePermissionTo($request->role);
        }else{
            $user->syncRoles($request->role);
        }

        return redirect()->route('user.index')->with('succes','data berhasil dirubah');
    }

    public function destroy(User $user)
    {
        $user->delete();
        Storage::delete($user->image);
        return redirect()->route('user.index')->with('succes','data berhasil dihapus');
    }
   
}

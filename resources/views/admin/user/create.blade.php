@extends('template.admin.default')
@section('title')
  <h1><i class="fa fa-list"></i>Tambah Data User</h1>
@endsection
@section('breadcrumbs')
{{ Breadcrumbs::render('tambah data user') }}
@endsection
@section('content')
<div class="col-md-12">
  <div class="tile">
    <h3 class="tile-title">Form Tambah Data User</h3>
      <div class="tile-body">
        <form action="{{route('user.store')}}" method="POST" enctype="multipart/form-data">
        @csrf
          <div class="form-group">
            <label class="control-label">Nama User</label>
            <input class="form-control @error ('name') is-invalid @enderror" type="text" name="name"
            placeholder="masukan nama user"> 
            <!--error message-->
            @error('name') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          <div class="form-group">
            <label class="control-label">Email</label>
            <input class="form-control @error ('email') is-invalid @enderror" type="text" name="email"
            placeholder="masukan email user"> 
            <!--error message-->
            @error('email') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          <div class="form-group">
            <label class="control-label">Password</label>
            <input class="form-control @error ('password') is-invalid @enderror" type="password" name="password"
            placeholder="masukan password"> 
            <!--error message-->
            @error('password') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          <div class="form-group">
            <label class="control-label">Ulangi Password</label>
            <input class="form-control @error ('password_confirm') is-invalid @enderror" type="password" name="password_confirm"
            placeholder="password confirm"> 
            <!--error message-->
            @error('password_confirm') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          <div class="form-group">
            <label class="control-label">Hak Akses</label>
            <select name="role" id="" class="form-control @error ('role') is-invalid @enderror">
            <option selected value="0">-- Pilih Hak Akses --</option>
              @foreach($roles as $role)
                 <option value="{{$role->name}}">{{$role->name}}</option>   
              @endforeach
            </select>
            <!--error message-->
            @error('role') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          <div class="form-group">
            <label class="control-label">Foto</label>
            <input class="form-control @error ('image') is-invalid @enderror" type="file" name="image"> 
            <!--error message-->
            @error('image') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          </div>
            <div class="tile-footer">
              <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle">
              </i>Simpan</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="{{route('user.index')}}">
              <i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
          </div>
        </form>
        </div>
  </div>
@endsection

@extends('template.admin.default')
@section('title')
  <h1><i class="fa fa-list"></i>Tambah Data Provinsi</h1>
@endsection
@section('breadcrumbs')
{{ Breadcrumbs::render('tambah data provinsi') }}
@endsection
@section('content')
<div class="col-md-12">
  <div class="tile">
    <h3 class="tile-title">Form Tambah Data Provinsi</h3>
      <div class="tile-body">
        <form action="{{route('province.store')}}" method="POST">
        @csrf
          <div class="form-group">
            <label class="control-label">Nama Provinsi</label>
            <input class="form-control @error ('name') is-invalid @enderror" type="text" name="name"
            placeholder="masukan nama provinsi"> 
            <!--error message-->
            @error('name') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          </div>
            <div class="tile-footer">
              <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle">
              </i>Simpan</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="{{route('province.index')}}">
              <i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
          </div>
        </form>
        </div>
  </div>
@endsection

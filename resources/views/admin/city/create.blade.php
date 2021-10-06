@extends('template.admin.default')
@section('title')
  <h1><i class="fa fa-list"></i>Tambah Data Kabupaten/Kota 
  Pada Provinsi {{$province->name}}</h1>
@endsection
@section('breadcrumbs')
{{ Breadcrumbs::render('tambah data', $province) }}
@endsection
@section('content')
<div class="col-md-12">
  <div class="tile">
    <h3 class="tile-title">Form Tambah Data Kabupaten/Kota</h3>
      <div class="tile-body">
        <form action="{{route('city.store', $province)}}" method="POST">
        @csrf
          <div class="form-group">
            <label class="control-label">Nama Kabupaten/Kota</label>
            <input type="hidden" name="province" value="{{$province->id}}">
            <input class="form-control @error ('name') is-invalid @enderror" type="text" name="name"
            placeholder="masukan nama kabupaten"> 
            <!--error message-->
            @error('name') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          </div>
            <div class="tile-footer">
              <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle">
              </i>Simpan</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="{{route('city.index', $province)}}">
              <i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
          </div>
        </form>
        </div>
  </div>
@endsection

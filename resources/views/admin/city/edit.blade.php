@extends('template.admin.default')
@section('title')
  <h1><i class="fa fa-list"></i>Edit Data Kabupuaten/Kota pada Provinsi</h1>
@endsection
@section('breadcrumbs')
{{ Breadcrumbs::render('edit data kabupaten/kota', $province, $city) }}
@endsection
@section('content')
<div class="col-md-12">
  <div class="tile">
    <h3 class="tile-title">Form Edit Data Kabupaten/Kota</h3>
      <div class="tile-body">
        <form action="{{route('city.update',[$province, $city])}}" method="POST">
        @csrf
        @method('PUT')
          <div class="form-group">
            <label class="control-label">Nama Kabupaten/kota</label>
            <input class="form-control @error ('name') is-invalid @enderror" type="text" name="name"
            value="{{$city->name}}">
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

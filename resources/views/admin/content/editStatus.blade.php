@extends('template.admin.default')
@section('title')
  <h1><i class="fa fa-list"></i>Edit Status Publish</h1>
@endsection
@section('breadcrumbs')
{{ Breadcrumbs::render('edit data status', $content) }}
@endsection
@section('content')
<div class="col-md-12">
  <div class="tile">
    <h3 class="tile-title">Form Edit Status</h3>
      <div class="tile-body">
        <form action="{{route('content.updatestatus', $content)}}" method="POST">
        @csrf
        @method('PUT')
            <div class="form-group">
                <label class="control-label">Pilih Status</label>
                <select name="status" id="" class="form-control">
                    <option value="0">Belum Publish</option>
                    <option value="1">Publish</option>
                </select>
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

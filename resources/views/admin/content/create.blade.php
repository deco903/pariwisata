@extends('template.admin.default')
@section('title')
  <h1><i class="fa fa-list"></i>Tambah Data Content</h1>
@endsection
@section('breadcrumbs')
{{ Breadcrumbs::render('tambah data content') }}
@endsection
@section('content')
<div class="col-md-12">
  <div class="tile">
    <h3 class="tile-title">Form Tambah Data Content</h3>
      <div class="tile-body">
        <form action="{{route('content.store')}}" method="POST" enctype="multipart/form-data">
        @csrf
         <div class="form-group">
            <label class="control-label">Pilih Kota</label>
            <select name="city" id="city" class="form-control @error ('city') is-invalid @enderror">
            <option value="0">-- Pilih Kabupaten/Kota --</option>
                @foreach($cities as $city)
                    <option value="{{$city->id}}">{{$city->name}}</option>
                @endforeach
            </select>
            <!--error message-->
            @error('city') <p class="text-danger">{{$message}}</p> @enderror
           </div>
          <div class="form-group">
            <label class="control-label">Judul</label>
            <input class="form-control @error ('title') is-invalid @enderror" 
            type="text" name="title" placeholder="masukan judul"> 
            <!--error message-->
            @error('title') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          <div class="form-group">
            <label class="control-label">Isi kontent</label>
            <textarea class="form-control @error ('content') is-invalid @enderror" 
            name="content" id="content" placeholder="masukan judul"></textarea> 
            <!--error message-->
            @error('content') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          <div class="form-group">
            <label class="control-label">Thumbnail</label>
            <input class="form-control @error ('thumbnail') is-invalid @enderror" 
            type="file" name="thumbnail"> 
            <!--error message-->
            @error('thumbnail') <p class="text-danger">{{$message}}</p> @enderror
          </div>
          </div>
            <div class="tile-footer">
              <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle">
              </i>Simpan</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="{{route('content.index')}}">
              <i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
          </div>
        </form>
        </div>
  </div>
@endsection

@push('scripts')
 <script src="{{asset('admin/js/plugins/select2.min.js')}}"></script>
 <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
    <script>
       $('#city').select2();
        CKEDITOR.replace( 'content' );
       </script>
    </script>
@endpush


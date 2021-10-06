@extends('template.admin.default')
@section('title')
  <h1><i class="fa fa-list"></i>Data Provinsi</h1>
@endsection
@section('breadcrumbs')
{{ Breadcrumbs::render('province') }}
@endsection
@section('content')

  <div class="col-md-12">
  @if(session('succes'))
    <div class="alert alert-success" role="alert">
    {{session('succes')}}
    </div>
  @endif
  </div>


<div class="col-md-12">
  <div class="tile">
  <a href="{{route('province.create')}}"><button type="button" 
  class="btn btn-success mb-3">Tambah Data</button></a>
            <div class="tile-body">
              <div class="table-responsive">
                <table class="table table-hover table-bordered" id="sampleTable">
                  <thead>
                    <tr>
                      <th>Nomor</th>
                      <th>Nama Provinsi</th>
                      <th>Slug</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  @php
                    $no = 0;
                  @endphp
                  @foreach($provinces as $province)
                  @php
                     $no ++;
                  @endphp
                    <tr>
                      <td>{{$no}}</td>
                      <td>{{$province->name}}</td>
                      <td>{{$province->slug}}</td>
                      <td> 
                       <form action="{{route('province.destroy', $province)}}" method="POST">
                        @csrf
                        @method('DELETE')
                        <a href="{{route('city.index', $province)}}"
                      class="btn btn-info btn-sm"><i class="fa fa-list"></i></a> 

                        <a href="{{route('province.edit', $province)}}"
                      class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a> 
                      
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('apakah anda yakin akan hapus')">
                        <i class="fa fa-trash"></i></button>
                       </form>
                    </tr>
                  @endforeach
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
@endsection

@push('scripts')
  <script type="text/javascript" src="{{asset('admin/js/plugins/jquery.dataTables.min.js')}}"></script>
  <script type="text/javascript" src="{{asset('admin/js/plugins/dataTables.bootstrap.min.js')}}"></script>
  <script type="text/javascript">$('#sampleTable').DataTable();</script>
  <!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->
  <script>
   $('button#delete').on('click', function(){
    var href= $(this).attr('href');
    var title= $(this).data('title')

   swal({
     title : 'apakah kamu yakin akan menghapus data provinsi '+title+' ?',
      text : 'data yang sudah dihapus tidak dapat dikembalikan',
      icon : 'warning',
      buttons : true,
      dangerMode : true,
   })
   
     .then((willDelete)=>{
       if(willDelete){
        document.getElementById('deleteForm').action = href;
        document.getElementById('deleteForm').submit();
        swal('data berhasil dihapus',{
          icon : "success",
        });
       }
     });
   });
  </script>
@endpush
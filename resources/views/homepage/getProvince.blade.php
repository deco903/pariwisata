@extends('template.frontend.default')
@section('content')
<main role="main">
   <div class="container">
     <div class="row">
       <div class="col-md-12 mt-5 mb-4">
         <nav aria-label="breadcrumb">
           <ol class="breadcrumb bg-light">
            <li class="breadcrumb-item"><a href="{{route('homepage')}}"
            class="text-decoration-none">{{config('app.name')}}</a></li>
            <li class="breadcrumb-item active" aria-current="page">Provinsi</li>
           </ol>
         </nav>
      </div>
      <div class="col-md-12">
        <div class="table-responsive">
          <table class="table table-hover table-bordered" id="sampleTable">
            <thead class="bg-info" style="color:white">
              <tr>
                <th width="10%">Nomor</th>
                <th>Nama Provinsi</th>
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
                <td><a href="{{route('getContentProvince',$province)}}" 
                class="text-decoration-none">{{$province->name}}</a></td>
              </tr>
            @endforeach
            </tbody>
          </table>
        </div>
       </div>
     </div>
   </div>
</main>   
@endsection
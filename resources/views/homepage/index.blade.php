@extends('template.frontend.default')
@section('content')
    <main role="main">
        <section class="jumbotron text-center mt-5">
            <div class="container">
                <h1>{{config('app.name')}}</h1>
                <p class="lead text-muted">
                Negara Republik Indonesia Merupakan Salah Satu Destinasi Wisata Dunia. Beragam Destinasi 
                Wisata ada di Negara ini
                </p>
            </div>
        </section>
        <div class="container">
            <div class="row">
                @foreach($contents as $content)
                    <div class="col-md-4">
                      <div class="shadow card mb-4">
                        <div class="d-flex flex-wrap">
                          <img src="{{$content->getThumbnail()}}" alt="{{$content->title}}"
                          class="card-img-top">
                          <h4 class="text-image position-absolute">{{$content->city->name}}</h4>
                        </div>
                        <div class="card-body">
                         <h5 class="card-title">{{$content->title}}</h5>
                         <p class="card-text">{!!Str::words($content->content, 10)!!}</p>
                         <a href="{{route('detailContent',[$content->city->province->slug,
                         $content->city->slug,$content])}}" class="btn btn-primary">Explore</a>
                        </div>
                      </div>
                    </div>
                @endforeach
            </div>
            <div class="row">
              <div class="col-md-12 mb-3">
                <div class="float-right">
                  <a href="{{route('otherContent')}}" class="btn btn-info">
                  >>> Other Content</a>
                </div>
              </div>
            </div>
        </div>
    </main>
@endsection


@push('styles')
 <style>
    img{
        max-height: 200px;
    }
  .text-image{
      font-left: 16pt;
      margin-left: 5px;
      margin-top: 175px;
      color: #ffff;
      background-color: black;
  } 
 </style>
@endpush



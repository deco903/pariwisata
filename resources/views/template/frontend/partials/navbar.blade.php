<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="{{route('homepage')}}">{{config('app.name')}}</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <a class="nav-link" href="{{route('homepage')}}">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{route('getProvince')}}">Direktori Pariwisata Indonesia</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{route('dashboard')}}">Login</a>
        </li>
      </ul>
      <form action="{{route('result')}}" method="get" class="form-inline my-2 my-lg-0">
        <input type="text" class="form-control mr-sm-2" placeholder="cari" name="search">
        <button type="submit" class="btn btn-outline-success my-2">Cari</button>
      </form>
    </div>
</nav>



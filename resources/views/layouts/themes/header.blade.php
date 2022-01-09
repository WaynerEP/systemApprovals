<div class="slim-header">
    <div class="container">
        <div class="slim-header-left">
            <h2 class="slim-logo"><a href="{{ route('home') }}">el valle<span>.</span></a></h2>
            <div class="search-box">
                <input type="text" class="form-control" placeholder="Buscar...">
                <button class="btn btn-primary"><i class="fa fa-search"></i></button>
            </div><!-- search-box -->
        </div><!-- slim-header-left -->
        <div class="slim-header-right">
            <div class="dropdown dropdown-b">
                <a href="" class="header-notification" data-toggle="dropdown">
                    <i class="icon ion-ios-bell-outline"></i>
                    <span class="indicator"></span>
                </a>
                <div class="dropdown-menu">
                    <div class="dropdown-menu-header">
                        <h6 class="dropdown-menu-title">Notifications</h6>
                    </div><!-- dropdown-menu-header -->
                    <div class="dropdown-list">
                        <!-- loop starts here -->
                        <a href="" class="dropdown-link">
                            <div class="media">
                                <img src="http://via.placeholder.com/500x500" alt="">
                                <div class="media-body">
                                    <p><strong>Suzzeth Bungaos</strong> tagged you and 18 others in a post.</p>
                                    <span>October 03, 2017 8:45am</span>
                                </div>
                            </div><!-- media -->
                        </a>
                        <!-- loop ends here -->
                        <div class="dropdown-list-footer">
                            <a href="page-notifications.html"><i class="fa fa-angle-down"></i> Show All
                                Notifications</a>
                        </div>
                    </div><!-- dropdown-list -->
                </div><!-- dropdown-menu-right -->
            </div><!-- dropdown -->
            <div class="dropdown dropdown-c">
                <a href="#" class="logged-user" data-toggle="dropdown">
                    <img src="{{ Auth::user()->avatar ? Auth::user()->avatar : '/storage/avatars/user.png' }}"
                        alt="">
                    <span>{{ Auth::user()->name }}</span>
                    <i class="fa fa-angle-down"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <nav class="nav">
                        <a href="{{ route('profile') }}" class="nav-link"><i class="icon ion-person"></i>
                            {{ __('Ver Perfil') }}</a>
                        {{-- <a href="page-activity.html" class="nav-link"><i class="icon ion-ios-bolt"></i>
                            {{ __('Actividades') }}</a>
                        <a href="page-settings.html" class="nav-link"><i class="icon ion-ios-gear"></i>
                            {{ __('Configuración') }}</a> --}}
                        <a href="{{ route('logout') }}" onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();" class="nav-link"><i
                                class="icon ion-forward"></i> {{ __('Cerrar sesión') }}</a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                            @csrf
                        </form>
                    </nav>
                </div><!-- dropdown-menu -->
            </div><!-- dropdown -->
        </div><!-- header-right -->
    </div><!-- container -->
</div>

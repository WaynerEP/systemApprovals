<div class="slim-navbar">
    <div class="container">
        <ul class="nav">

            <li class="nav-item {{ request()->is('home') ? 'active' : '' }}">
                <a class="nav-link" href="{{ route('home') }}">
                    <i class="icon ion-ios-home-outline"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="nav-item with-sub {{ request()->is('management/*') ? 'active' : '' }}">
                <a class="nav-link" href="#">
                    <i class="icon ion-ios-gear-outline"></i>
                    <span>Usuarios</span>
                </a>
                <div class="sub-item">
                    <ul>
                        <li><a href="{{ route('users') }}">Users</a></li>
                        <li><a href="{{ route('roles') }}">Roles</a></li>
                        <li><a href="{{ route('permissions') }}">Permisos</a></li>
                    </ul>
                </div><!-- sub-item -->
            </li>
            <li class="nav-item with-sub {{ request()->is('contacts/*') ? 'active' : '' }}">
                <a class="nav-link" href="#">
                    <i class="icon ion-ios-filing-outline"></i>
                    <span>Contactos</span>
                </a>
                <div class="sub-item">
                    <ul>
                        <li><a href="{{ url('/personas') }}">Personas</a></li>
                        <li><a href="{{ route('employees') }}">Empleados</a></li>
                        <li><a href="{{ route('providers') }}">Proveedores</a></li>
                    </ul>
                </div><!-- dropdown-menu -->
            </li>
            <li class="nav-item with-sub {{ request()->is('compras-*') ? 'active' : '' }}">
                <a class="nav-link" href="#">
                    <i class="icon ion-ios-book-outline"></i>
                    <span>Compras</span>
                </a>
                <div class="sub-item">
                    <ul>
                        <li><a href="{{ route('pedidos') }}">Pedidos</a></li>
                        <li><a href="{{ route('proformas') }}">Proformas</a></li>
                        <li><a href="{{ route('purchase-request') }}">Solicitud de Compra</a></li>
                        <li><a href="{{ route('new-purchase') }}">Listado de SC</a></li>
                    </ul>
                </div><!-- dropdown-menu -->
            </li>
            <li class="nav-item with-sub">
                <a class="nav-link" href="#" data-toggle="dropdown">
                    <i class="icon ion-ios-gear-outline"></i>
                    <span>Items</span>
                </a>
                <div class="sub-item">
                    <ul>
                        <li><a href="{{ route('productos') }}">Productos</a></li>
                    </ul>
                </div><!-- dropdown-menu -->
            </li>
            <li class="nav-item">
                <a class="nav-link" href="page-messages.html">
                    <i class="icon ion-ios-chatboxes-outline"></i>
                    <span>Messages</span>
                    <span class="square-8"></span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="widgets.html">
                    <i class="icon ion-ios-analytics-outline"></i>
                    <span>Widgets</span>
                </a>
            </li>
        </ul>
    </div><!-- container -->
</div>

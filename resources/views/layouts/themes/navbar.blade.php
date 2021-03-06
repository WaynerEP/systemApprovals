<div class="slim-navbar">
    <div class="container">
        <ul class="nav">

            <li class="nav-item {{ request()->is('home') ? 'active' : '' }}">
                <a class="nav-link" href="{{ route('home') }}">
                    <i class="icon ion-ios-home-outline"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            {{-- @role('Administrador') --}}
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
            {{-- @endrole --}}

            <li class="nav-item with-sub {{ request()->is('contacts/*') ? 'active' : '' }}">
                <a class="nav-link" href="#">
                    <i class="icon ion-ios-filing-outline"></i>
                    <span>Contactos</span>
                </a>
                <div class="sub-item">
                    <ul>
                        <li><a href="{{ url('/personas') }}">Personas</a></li>
                        {{-- <li><a href="{{ route('employees') }}">Empleados</a></li> --}}
                        <li><a href="{{ route('providers') }}">Proveedores</a></li>
                    </ul>
                </div><!-- dropdown-menu -->
            </li>

            <li class="nav-item with-sub mega-dropdown {{ request()->is('compras-*') ? 'active' : '' }}">
                <a class="nav-link" href="#">
                    <i class="icon ion-ios-book-outline"></i>
                    <span>Compras</span>
                </a>
                <div class="sub-item">
                    <div class="row">
                        <div class="col-lg mg-t-30 mg-lg-t-0">
                            <label class="section-label">Pedidos</label>
                            <ul>
                                <li><a href="{{ route('pedidos.list') }}">Listar Pedidos</a></li>
                                <li><a href="{{ route('pedidos.new') }}">Generar Nuevo Pedido</a></li>
                            </ul>
                        </div><!-- col -->
                        <div class="col-lg mg-t-30 mg-lg-t-0">
                            <label class="section-label">Proformas</label>
                            <ul>
                                <li><a href="{{ route('proformas.list') }}">Listar proformas</a></li>
                                <li><a href="{{ route('proformas.new') }}">Registrar proformas</a></li>
                            </ul>
                        </div><!-- col -->
                        <div class="col-lg mg-t-30 mg-lg-t-0">
                            <label class="section-label">Solicitudes</label>
                            <ul>
                                <li><a href="{{ route('purchase-request.list') }}">Listar Solicitudes de Compra</a>
                                </li>
                                <li><a href="{{ route('purchase-request.create') }}">Nueva Solicitud de Compra</a>
                                </li>
                            </ul>
                        </div><!-- col -->

                    </div><!-- row -->
                </div><!-- dropdown-menu -->
            </li>

            <li class="nav-item with-sub">
                <a class="nav-link" href="#">
                    <i class="icon ion-ios-analytics-outline"></i>
                    <span>Items</span>
                </a>
                <div class="sub-item">
                    <ul>
                        <li><a href="{{ route('productos') }}">Productos</a></li>
                    </ul>
                </div><!-- dropdown-menu -->
            </li>

            @hasanyrole('Gerente general|Jefe de Compras|Jefe de ??rea de compras')
                <li class="nav-item {{ request()->is('orders/*') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ route('orders') }}">
                        <i class="icon ion-ios-chatboxes-outline"></i>
                        <span>Solicitudes</span>
                        <span class="square-8"></span>
                    </a>
                </li>
            @endhasanyrole
        </ul>
    </div><!-- container -->
</div>

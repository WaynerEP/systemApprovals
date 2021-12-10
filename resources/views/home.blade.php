@extends('layouts.app')

@section('content')
    <div class="dash-headline-two">
        <div>
            <h4 class="tx-inverse mg-b-5">
                <?php
                $today = getdate();
                $hora = $today['hours'];
                ?>
                @switch($hora)
                    @case($hora<6)
                        Hoy has madrugado mucho..
                    @break
                    @case($hora<12)
                        Buenos días
                    @break
                    @case($hora<=18)
                        Buenas Tardes
                    @break
                    @default
                        Buenas Noches
                @endswitch,
                {{ Auth::user()->name }}!
            </h4>
            <p class="mg-b-0">Hoy es
                <?php
                setlocale(LC_ALL, 'spanish');
                echo strftime('%A %d de %B del %Y');
                ?></p>
        </div>
        <div class="d-h-t-right">
            <div class="summary-item">
                <h1>$1,433</h1>
                <span>Ganancias<br>de hoy</span>
            </div>
            <div class="summary-item">
                <h1>$296</h1>
                <span>Gastos<br>de hoy</span>
            </div>
        </div>
    </div>
    <div class="nav-statistics-wrapper">
        <nav class="nav">
            <a href="" class="nav-link active">Vista General</a>
            <a href="" class="nav-link">EMPLEADOS</a>
            <a href="" class="nav-link">PRODUCTOS</a>
            <a href="" class="nav-link">GASTOS</a>
        </nav>
    </div>

    <div class="row no-gutters dashboard-chart-one">
        <div class="col-md-4 col-lg">
            <div class="card card-total">
                <div>
                    <h1>420</h1>
                    <p>EMPLEADOS TOTALES</p>
                </div>
                <div>
                    <div class="tx-24 mg-b-10 tx-center op-5">
                        <i class="icon ion-man tx-gray-600"></i>
                        <i class="icon ion-man tx-gray-600"></i>
                        <i class="icon ion-man tx-gray-600"></i>
                        <i class="icon ion-man tx-gray-600"></i>
                        <i class="icon ion-man tx-gray-600"></i>
                        <i class="icon ion-man tx-gray-600"></i>
                        <i class="icon ion-man tx-gray-400"></i>
                        <i class="icon ion-man tx-gray-400"></i>
                        <i class="icon ion-man tx-gray-400"></i>
                        <i class="icon ion-man tx-gray-400"></i>
                    </div>
                    <label>Femenino (66%)</label>
                    <div class="progress mg-b-10">
                        <div class="progress-bar bg-primary progress-bar-xs wd-65p" role="progressbar" aria-valuenow="66"
                            aria-valuemin="0" aria-valuemax="100"></div>
                    </div><!-- progress -->

                    <label>Masculino (34%)</label>
                    <div class="progress">
                        <div class="progress-bar bg-danger progress-bar-xs wd-35p" role="progressbar" aria-valuenow="34"
                            aria-valuemin="0" aria-valuemax="100"></div>
                    </div><!-- progress -->
                </div>
            </div><!-- card -->
        </div><!-- col -->
        <div class="col-md-4 col-lg">
            <div class="card card-total">
                <div>
                    <h1>55</h1>
                    <p>PRODUCTOS TOTALES</p>
                </div>
                <div>
                    <div class="tx-16 mg-b-15 tx-center op-5">
                        <i class="icon ion-cube tx-gray-600"></i>
                        <i class="icon ion-cube tx-gray-600"></i>
                        <i class="icon ion-cube tx-gray-600"></i>
                        <i class="icon ion-cube tx-gray-600"></i>
                        <i class="icon ion-cube tx-gray-600"></i>
                        <i class="icon ion-cube tx-gray-600"></i>
                        <i class="icon ion-cube tx-gray-600"></i>
                        <i class="icon ion-cube tx-gray-600"></i>
                        <i class="icon ion-cube tx-gray-400"></i>
                        <i class="icon ion-cube tx-gray-400"></i>
                    </div>
                    <label>Productos digitales (85%)</label>
                    <div class="progress mg-b-10">
                        <div class="progress-bar bg-success progress-bar-xs wd-85p" role="progressbar" aria-valuenow="85"
                            aria-valuemin="0" aria-valuemax="100"></div>
                    </div><!-- progress -->

                    <label>Productos no digitales (15%)</label>
                    <div class="progress">
                        <div class="progress-bar bg-warning progress-bar-xs wd-15p" role="progressbar" aria-valuenow="15"
                            aria-valuemin="0" aria-valuemax="100"></div>
                    </div><!-- progress -->
                </div>
            </div><!-- card -->
        </div><!-- col -->
        <div class="col-md-4 col-lg">
            <div class="card card-total">
                <div>
                    <h1>30</h1>
                    <p>PROVEEDORES TOTALES</p>
                </div>
                <div>
                    <div class="tx-22 mg-b-10 tx-center op-5">
                        <i class="icon ion-location tx-gray-600"></i>
                        <i class="icon ion-location tx-gray-600"></i>
                        <i class="icon ion-location tx-gray-600"></i>
                        <i class="icon ion-location tx-gray-600"></i>
                        <i class="icon ion-location tx-gray-600"></i>
                        <i class="icon ion-location tx-gray-600"></i>
                        <i class="icon ion-location tx-gray-600"></i>
                        <i class="icon ion-location tx-gray-400"></i>
                        <i class="icon ion-location tx-gray-400"></i>
                        <i class="icon ion-location tx-gray-400"></i>
                    </div>
                    <label>Local (75%)</label>
                    <div class="progress mg-b-10">
                        <div class="progress-bar bg-purple progress-bar-xs wd-75p" role="progressbar" aria-valuenow="75"
                            aria-valuemin="0" aria-valuemax="100"></div>
                    </div><!-- progress -->

                    <label>Internacional (25%)</label>
                    <div class="progress">
                        <div class="progress-bar bg-pink progress-bar-xs wd-25p" role="progressbar" aria-valuenow="25"
                            aria-valuemin="0" aria-valuemax="100"></div>
                    </div><!-- progress -->
                </div>
            </div><!-- card -->
        </div><!-- col -->
        <div class="col-md col-lg-4">
            <div class="card card-revenue">
                <h6>Gastos del Mes</h6>
                <p>Calculado cada 15 del mes</p>
                <h1>$32,500 <span class="tx-success">1.4% up</span></h1>
                <div id="rs3" class="ht-50 ht-sm-70 mg-r--1 rickshaw_graph"><svg width="319" height="70">
                        <path class="path"
                            d="M0,41.12211221122112Q21.26666666666667,31.496149614961496,24.53846153846154,29.57095709570957C29.446153846153848,26.683168316831683,44.16923076923077,14.554455445544548,49.07692307692308,12.244224422442237S68.70769230769231,7.623762376237616,73.61538461538461,6.468646864686462S93.24615384615386,0.11551155115510858,98.15384615384616,0.6930693069306859S117.78461538461539,10.511551155115503,122.6923076923077,12.244224422442237S142.3230769230769,16.28712871287129,147.23076923076923,18.01980198019802S166.86153846153846,27.83828382838284,171.76923076923077,29.57095709570957S191.4,35.92409240924093,196.30769230769232,35.34653465346535S215.93846153846152,25.528052805280527,220.84615384615384,23.795379537953796S240.47692307692307,19.174917491749177,245.3846153846154,18.01980198019802S265.0153846153846,11.089108910891081,269.9230769230769,12.244224422442237S289.55384615384617,29.57095709570957,294.46153846153845,29.57095709570957Q297.73333333333335,29.57095709570957,319,12.244224422442237"
                            fill="none" stroke="#1B84E7" stroke-width="2" opacity="1"></path>
                        <path class="stroke"></path>
                    </svg></div>
                <label>Mes pasado: <span>$79,554</span></label>
            </div><!-- card -->
        </div><!-- col-4 -->
    </div>
@endsection

<script>
    window.addEventListener('load', function() {
        $.toast({
            content: "Bienvenido al Sistema!"
        })
    });
</script>

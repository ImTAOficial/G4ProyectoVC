<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modulo Empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!--usados como plugins para crear listas desplegables-->
            <!-- Select2 CSS -->
            <!--<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />-->
            <!-- Select2 JS -->
            <!--<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>-->
            <!-- Bootstrap CSS -->
            <!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />-->
            <!-- jQuery (necesario para Select2) -->
            <!--<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>-->
            <!-- Bootstrap JS -->
            <!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>-->

    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Vino Costero</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Buscar" aria-label="Buscar" aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>     
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Configuraciones</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Cerrar sesion</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Menu Principal</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Panel
                            </a>
                            <div class="sb-sidenav-menu-heading">Interfaces</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCultivos" aria-expanded="false" aria-controls="collapseCultivos">                                                        
                                <div class="sb-nav-link-icon"><i class="fas fa-seedling"></i></div>
                                Cultivos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseCultivos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('vinedo') }}">Viñedos</a>
                                    <a class="nav-link" href="{{ route('enfermedad') }}">Enfermedad</a>
                                    <a class="nav-link" href="{{ route('parcelas') }}">Parcelas</a>
                                    <a class="nav-link" href="{{ route('bombadeagua') }}">Bomba de Agua</a>
                                    <a class="nav-link" href="{{ route('sensores') }}">Sensores</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseProcesos" aria-expanded="false" aria-controls="collapseProcesos">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Procesos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseProcesos" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Produccion</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Puntos de control</a>
                                    <a class="nav-link" href="layout-static.html">Vino</a>
                                    <a class="nav-link" href="layout-static.html">Catas</a>
                                    <a class="nav-link" href="layout-static.html">Bodegas</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseComercial" aria-expanded="false" aria-controls="collapseComercial">
                                <div class="sb-nav-link-icon"><i class="fas fa-dollar-sign"></i></div>
                                Comercial
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseComercial" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Ventas</a>
                                    <a class="nav-link" href="layout-static.html">Clientes</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Embarques</a>
                                    <a class="nav-link" href="layout-static.html">Datos financieros</a>
                                </nav>
                            </div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Empleados
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">                             
                                <nav class="sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('registroempleado') }}">
                                        Registro de empleado
                                    </a>
                                </nav>                               
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="{{ route('login') }}">Login</a>
                                            <a class="nav-link" href="{{ route('register') }}">Register</a>
                                            <a class="nav-link" href="{{ route('password.request') }}">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Integraciones</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                                Google Chat
                            </a>
                            <a class="nav-link" href="tables.blade.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                                Slack
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Sesion iniciada como:</div>
                        Administrador
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                <div class="container-fluid px-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h1 class="mt-4">Modulo - Viñedos</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Registro de Viñedos</li>
                            </ol>
                        </div>
                        <div>
                            <a href="{{ route('dashboard') }}" class="btn btn-primary mt-4">Regresar</a>
                        </div>
                    </div>


                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-leaf me-1"></i>
                                Formulario viñedo
                            </div>
                            <div class="card-body">    
                            @if(session('success'))
                                    <div class="alert alert-success">
                                        {{ session('success') }}
                                    </div>
                                @endif
                                @if($errors->any())
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif 
                                <form method="POST" action="{{ route('vinedo.crear') }}">
                                    @csrf
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="NombreVinedo" name="NombreVinedo" type="text" placeholder="Nombre del Viñedo" required />
                                        <label for="NombreVinedo">Nombre del Viñedo</label>
                                    </div>                                  
            <div class="form-floating mb-3">
                <select class="form-control" id="ID_Parcela" name="ID_Parcela" required>
                    <option value="" disabled selected>Selecciona una parcela</option>
                    @foreach($parcelas as $parcela)
                        <option value="{{ $parcela->ID_Parcela }}">{{ $parcela->NombreParcela }}</option>
                    @endforeach
                </select>
                <label for="ID_Parcela">Nombre de la Parcela</label>
            </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="Variedad_Uva" name="Variedad_Uva" type="text" placeholder="Variedad de Uva" required />
                                        <label for="Variedad_Uva">Variedad de Uva</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="Fecha_Plantacion" name="Fecha_Plantacion" type="date" placeholder="Fecha de Plantación" required />
                                        <label for="Fecha_Plantacion">Fecha de Plantación</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="RiegoVinedo" name="RiegoVinedo" type="number" placeholder="Riego del Viñedo" required />
                                        <label for="RiegoVinedo">Riego del Viñedo</label>
                                    </div>

                                    
                                    <div class="form-floating mb-3">
                                        <select class="form-control" id="ID_Enfermedad" name="ID_Enfermedad" required>
                                            <option value="" disabled selected>Selecciona una enfermedad</option>
                                            @foreach($enfermedades as $enfermedad)
                                                <option value="{{ $enfermedad->ID_Enfermedad }}">{{ $enfermedad->Nombre_Enfermedad }}</option>
                                            @endforeach
                                        </select>
                                        <label for="ID_Enfermedad">Enfermedad</label>
                                    </div>


                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="Estado_Sanitario" name="Estado_Sanitario" type="text" placeholder="Estado Sanitario" required />
                                        <label for="Estado_Sanitario">Estado Sanitario</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="Azucar_Uva" name="Azucar_Uva" type="number" step="0.01" placeholder="Azúcar de Uva" required />
                                        <label for="Azucar_Uva">Azúcar de Uva</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="Punto_Optimo_Cosecha" name="Punto_Optimo_Cosecha" type="date" placeholder="Punto Óptimo de Cosecha" required />
                                        <label for="Punto_Optimo_Cosecha">Fecha de punto óptimo de cosecha</label>
                                    </div>
                                    <button class="btn btn-primary" type="submit">Crear Viñedo</button>
                                </form>
                            </div>
                        </div>

                    <!-- Select2 Initialization -->
                    <!--<script>
                        $(document).ready(function() {
                            $('.select2').select2({
                                placeholder: 'Selecciona una o varias enfermedades',
                                allowClear: true
                            });
                        });
                    </script>-->


                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Detalle Viñedos
                            </div>
                            <div class="card-body">
                                <table id="empleadoTable" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID de Parcela</th>
                                            <th>NombNombre del viñedo</th>
                                            <th>Variedad de Uva</th>
                                            <th>Fecha de plantacion</th>
                                            <th>Riego del viñedo</th>
                                            <th>ID Enfermedad</th>
                                            <th>Estado sanitario</th>
                                            <th>Azucar de uva</th>
                                            <th>Punto optimo de coseña</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Vino Costero 2024</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>

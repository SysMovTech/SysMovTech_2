<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Averías</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="estilos/estiloMenu.css">
        <link rel="stylesheet" href="estilos/general.css">
        <link rel="shortcut icon" href="recursos/logo.png" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    </head>
    <body class="d-flex flex-column vh-100">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="recursos/logo.png" alt="Logo" class="img-fluid" style="max-width: 40px;">
                    AveríaFix
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a href="notificaciones.jsp" class="nav-link">
                                <img src="recursos/campana b.png" alt="Notificaciones" class="icon me-2">
                                Notificaciones
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="averias.jsp" class="nav-link active">
                                <img src="recursos/avrs b.png" alt="Averías" class="icon me-2">
                                Averías
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="VW.jsp" class="nav-link">
                                <img src="recursos/trab b.png" alt="Trabajadores" class="icon me-2">
                                Trabajadores
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="perfil.jsp" class="nav-link">
                                <img src="recursos/per b.png" alt="Perfil" class="icon me-2">
                                Perfil
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="index.html" class="btn btn-danger">Cerrar sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid flex-grow-1 d-flex flex-column">
            <div class="navegador">
                <div class="menu-navegador">
                    <a href="averias.jsp"><button class="avrmen"><img src="recursos/verav b.png" alt="Ver" class="iconoopc"></button></a>
                    <button class="avrmen selected"><img src="recursos/reloj w.png" alt="Pendientes" class="iconoopc"></button>
                    <a href="anadirav.jsp"><button class="avrmen"><img src="recursos/adave b.png" alt="Añadir" class="iconoopc"></button></a>
                </div>
                <div class="titulo-navegador">Pendientes</div>
            </div>

            <div class="row">
                <div class="col-12 d-flex flex-wrap justify-content-center">
                    <div class="card m-2" style="width: 18rem;">
                        <img src="recursos/imp b.png" class="card-img-top img-fluid" alt="Imagen 1">
                        <div class="card-body">
                            <h5 class="card-title">Lugar</h5>
                            <p class="card-text">Descripción detallada y con muchas letras.</p>
                        </div>
                    </div>
                    <div class="card m-2" style="width: 18rem;">
                        <img src="recursos/global b.png" class="card-img-top img-fluid" alt="Imagen 2">
                        <div class="card-body">
                            <h5 class="card-title">Lugar</h5>
                            <p class="card-text">Otra descripción detallada y con muchas letras.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Notificaciones</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos/estiloMenu.css"/>
        <link rel="stylesheet" href="estilos/general.css"/>
        <link rel="shortcut icon" href="recursos/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
        <style>
            .main-container {
                display: flex;
                justify-content: initial;
                padding: 0px;
            }
        </style>
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
            <div class="row my-3">
                <div class="col text-center">
                    <h1>Notificaciones</h1>
                </div>
            </div>
            <div class="main-container flex-fill">
                <div class="container-fluid p-4">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">

                        <div class="col">
                            <div class="mini-contenedor">
                                <img src="recursos/imp b.png" alt="Imagen 1" class="imagen-contenedor img-fluid">
                                <div class="descpendiente">
                                    <div class="titulo-contenedor">
                                        <div class="titulo"><strong>Lugar</strong></div>
                                        <img src="recursos/logo.png" alt="linea" class="mini-linea">
                                    </div>
                                    <div class="desc">
                                        <div class="texto-desc">Descripción detallada y con muchas letras</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col">
                            <div class="mini-contenedor">
                                <img src="recursos/imp b.png" alt="Imagen 2" class="imagen-contenedor img-fluid">
                                <div class="descpendiente">
                                    <div class="titulo-contenedor">
                                        <div class="titulo"><strong>Lugar</strong></div>
                                        <img src="recursos/logo.png" alt="linea" class="mini-linea">
                                    </div>
                                    <div class="desc">
                                        <div class="texto-desc">Descripción detallada y con muchas letras</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

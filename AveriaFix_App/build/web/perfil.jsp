<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Perfil</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos/estiloMenu.css"/>
        <link rel="stylesheet" href="estilos/general.css"/>
        <link rel="shortcut icon" href="recursos/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
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
                    <button class="avrmen selected"><img src="recursos/verav w.png" alt="Ver" class="iconoopc"></button>
                    <a href="editperfil.jsp"><button class="avrmen"><img src="recursos/editar b.png" alt="Añadir trabajador" class="iconoopc"></button></a>
                </div>
                <div class="titulo-navegador">Perfil</div>
            </div>

                <div class="col-lg-12">
                    <div class="contenedorW">
                    <div class="container-fluid p-4 flex-fill">
                        <div class="row">
                            <div class="col-12 col-md-8">

                                <div class="mb-3">
                                    <label class="subtitulo">Nombre</label>
                                    <input type="text" value="Información de la base de datos" readonly class="info-input-add">
                                </div>

                                <div class="mb-3">
                                    <label class="subtitulo">Número de trabajador</label>
                                    <input type="text" value="Información de la base de datos" readonly class="info-input-add">
                                </div>

                                <div class="mb-3">
                                    <label class="subtitulo">Contraseña</label>
                                    <input type="password" value="contraseña" readonly class="info-input-add">
                                </div>

                                <div class="mb-3">
                                    <label class="subtitulo">Rol laboral</label>
                                    <input type="text" value="Información de la base de datos" readonly class="info-input-add">
                                </div>
                            </div>

                            <!-- Columna Derecha -->
                            <div class="col-12 col-md-4 d-flex align-items-center justify-content-center">
                                <img src="recursos/tec b.png" alt="Perfil" class="img-fluid">
                            </div>
                        </div>

                        <!-- Información adicional -->
                        <div class="row mt-4">
                            <div class="col">
                                <label class="subtitulo">Información</label>
                                <div id="info" class="info-div">Aquí va el texto que se saca del if donde dependiendo del tipo de perfil se despliega información diferente sobre lo que pueden hacer y etc</div>
                            </div>
                        </div>
                    </div>
                </div>
                    </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

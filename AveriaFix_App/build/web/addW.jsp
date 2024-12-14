<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Averías</title>
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
                    <a href="VW.jsp"><button class="avrmen"><img src="recursos/verav b.png" alt="Ver" class="iconoopc"></button></a>
                    <button class="avrmen selected"><img src="recursos/adave w.png" alt="Añadir trabajador" class="iconoopc"></button>
                </div>
                <div class="titulo-navegador">Añadir</div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="contenedorW">
                        <div class="contenidoaltaW">
                            <form action="" method="" class="main-container flex-fill">
                                <div class="container-fluid p-4">
                                    <div class="row">
                                        <div class="col-12 col-md-8">
                                            <div class="mb-3">
                                                <br><br>
                                                <label for="nombre" class="subtitulo">Nombre</label>
                                                <input type="text" id="nombre" name="nombre" class="info-input-add" placeholder="Nombre del trabajador">
                                            </div>

                                            <div class="mb-3">
                                                <label for="numero_trabajador" class="subtitulo">Número de trabajador</label>
                                                <input type="text" id="numero_trabajador" name="numero_trabajador" class="info-input-add" placeholder="Número de trabajador">
                                            </div>

                                            <div class="mb-3">
                                                <label for="contrasena" class="subtitulo">Contraseña temporal</label>
                                                <input type="password" id="contrasena" name="contrasena" class="info-input-add" placeholder="Contraseña">
                                            </div>

                                            <div class="mb-3">
                                                <label for="rol" class="subtitulo">Rol laboral</label>
                                                <select id="rol" name="rol" class="info-input-add">
                                                    <option value="" disabled selected>Técnico|Supervisor</option>
                                                    <option value="Tecnico">Técnico</option>
                                                    <option value="Supervisor">Supervisor</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Botones -->
                                    <div class="row mt-4">
                                        <div class="col d-flex justify-content-center gap-3">
                                            <button type="submit" class="confirmar">Confirmar</button>
                                            <button type="button" class="cancelar" onclick="window.location.href = 'VW.jsp'">Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

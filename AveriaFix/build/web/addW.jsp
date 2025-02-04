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
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const menuItems = document.querySelectorAll('.menu-item');

            menuItems.forEach(item => {
                item.addEventListener('click', function () {
                    menuItems.forEach(i => {
                        i.classList.remove('active');
                        const icon = i.querySelector('.icon');
                        if (i.classList.contains('notificaciones')) {
                            icon.src = 'recursos/campana b.png';
                        } else if (i.classList.contains('averias')) {
                            icon.src = 'recursos/avrs b.png';
                        } else if (i.classList.contains('trabajadores')) {
                            icon.src = 'recursos/trab b.png';
                        } else if (i.classList.contains('perfil')) {
                            icon.src = 'recursos/per b.png';
                        }
                    });

                    this.classList.add('active');

                    const icon = this.querySelector('.icon');
                    if (this.classList.contains('notificaciones')) {
                        icon.src = 'recursos/campana w.png';
                    } else if (this.classList.contains('averias')) {
                        icon.src = 'recursos/averia w.png';
                    } else if (this.classList.contains('trabajadores')) {
                        icon.src = 'recursos/trabW.PNG';
                    } else if (this.classList.contains('perfil')) {
                        icon.src = 'recursos/per w.png';
                    }
                });
            });

            const currentPath = window.location.pathname.split('/').pop();
            menuItems.forEach(item => {
                if (item.getAttribute('href') === currentPath) {
                    item.classList.add('active');
                    const icon = item.querySelector('.icon');
                    if (item.classList.contains('notificaciones')) {
                        icon.src = 'recursos/campana w.png';
                    } else if (item.classList.contains('averias')) {
                        icon.src = 'recursos/averia w.png';
                    } else if (item.classList.contains('trabajadores')) {
                        icon.src = 'recursos/trabW.PNG';
                    } else if (item.classList.contains('perfil')) {
                        icon.src = 'recursos/per w.png';
                    }
                }
            });
        });
    </script>

    <body>
        <div class="vertical-menu">
            <div class="logo-section">
                <img src="recursos/logo.png" alt="Logo" class="logo">
                <span class="empresa">AveríaFix</span>
            </div>
            <nav class="menu-section">
                <a href="notificaciones.jsp" class="menu-item notificaciones">
                    <img src="recursos/campana b.png" alt="Notificaciones" class="icon">
                    <span>Notificaciones</span>
                </a>
                <a href="averias.jsp" class="menu-item averias">
                    <img src="recursos/avrs b.png" alt="Averías" class="icon">
                    <span>Averías</span>
                </a>
                <a href="VW.jsp" class="menu-item active">
                    <img src="recursos/trabW.PNG" alt="Trabajadores" class="icon">
                    <span>Trabajadores</span>
                </a>
                <a href="perfil.jsp" class="menu-item perfil">
                    <img src="recursos/per b.png" alt="Perfil" class="icon">
                    <span>Perfil</span>
                </a>
            </nav>
            <div class="logout-section">
                <a href="logout.jsp" class="logout-link">Cerrar sesión</a>
            </div>
        </div>



        <div class="main-container">
            <div class="navegador">
                <div class="menu-navegador">
                    <a href="VW.jsp"><button class="avrmen"><img src="recursos/verav b.png" alt="Ver" class="iconoopc"></button></a>
                    <button class="avrmen selected"><img src="recursos/adave w.png" alt="Anadir" class="iconoopc"><span>Agregar</span></button>
                </div>
                <div class="titulo-navegador">Trabajadores</div>
            </div>

            <form action="" method="">
                <div class="contenedor">
                    <div class="contenido">
                        <div class="izquierda">
                            <h1>Alta de trabajador</h1>
                            <div class="subtitulo">Nombre</div>
                            <input type="text" name="nombre" placeholder="Ingrese el nombre del trabajador" class="info-input">
                            <div class="subtitulo">Número de trabajador</div>
                            <input type="text" name="numero_trabajador" placeholder="Ingrese el numero del trabajador" class="info-input">
                            <div class="subtitulo">Contraseña temporal</div>
                            <input type="password" name="contrasena" class="info-input" placeholder="Contraseña ">
                            <div class="subtitulo">Rol laboral</div>
                            <select name="rol" id="rol" class="info-input">
                                <option value="" disabled selected>Técnico | Supervisor </option>
                                <option value="Tecnico">Técnico</option>
                                <option value="Supervisor">Supervisor</option>
                            </select>
                        </div>
                        <div class="derecha">
                            <!-- acá va la cosa de la bd donde se recupera la dirección de la imagen ok -->
                            <img src="recursos/per b.png" alt="Perfil">
                        </div>
                    </div>
                    <div class="botones">
                        <button type="submit" class="confirmar">Confirmar</button>
                        <button type="button" class="cancelar" onclick="window.location.href = 'VW.jsp'">Cancelar</button>
                    </div>
                </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

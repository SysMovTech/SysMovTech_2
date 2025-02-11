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
                    <button class="avrmen selected"><img src="recursos/verav w.png" alt="Ver" class="iconoopc"><span>Ver</span></button>
                    <a href="addW.jsp"><button class="avrmen"><img src="recursos/adave b.png" alt="Anadir" class="iconoopc"></button></a>
                </div>
                <div class="titulo-navegador">Trabajadores</div>
            </div>


            <div class="contenedor-scroll">
                <div class="contenedor-responsivo">
                <div class="fila-contenedores">
                    <div class="mini-contenedor">
                        <img src="recursos/sup b.png" alt="Imagen 1" class="imagen-contenedor">

                        <div class="descpendiente">
                            <div class="titulo-contenedor">
                                <div class="titulo"><strong>Nombre</strong></div>
                            </div>
                            <div class="desc">
                                <div class="texto-desc">No. Trabajador: </div>
                                <div class="texto-desc">Rol laboral: </div>
                                <div class="texto-desc">Estado: </div>                            
                            </div>
                        </div>
                    </div>


                    <div class="mini-contenedor">
                        <img src="recursos/tec b.png" alt="Imagen 1" class="imagen-contenedor">

                        <div class="descpendiente">
                            <div class="titulo-contenedor">
                                <div class="titulo"><strong>Nombre</strong></div>
                            </div>
                            <div class="desc">
                                <div class="texto-desc">No. Trabajador: </div>
                                <div class="texto-desc">Rol laboral: </div>
                                <div class="texto-desc">Estado: </div>
                            </div>
                        </div>
                    </div>
                </div>          

            </div>
                </div>
        </div>
    </body>
</html>

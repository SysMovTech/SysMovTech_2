<%-- 
    Document   : notificaciones.jsp
    Created on : 9 oct 2024
--%>

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
                <a href="notificaciones.jsp" class="menu-item notificaciones active">
                    <img src="recursos/campana w.png" alt="Notificaciones" class="icon">
                    <span>Notificaciones</span>
                </a>
                <a href="averias.jsp" class="menu-item averias">
                    <img src="recursos/avrs b.png" alt="Averías" class="icon">
                    <span>Averías</span>
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
                    
                </div>
                <div class="titulo-navegador"></div>
            </div>
            
            
            
            
            <div class="contenedor-scroll">
                <div class="fila-contenedores">
                    <div class="mini-contenedor">
                        <img src="recursos/imp b.png" alt="Imagen 1" class="imagen-contenedor">

                        <div class="descpendiente">
                            <div class="titulo-contenedor">
                                <div class="titulo"><strong>Lugar</strong></div>
                                <img src="recursos/logo.png" alt="linea" class="mini-linea">
                            </div>
                            <div class="desc">
                                <div class="texto-desc">Descripción detallada y con muchas letraaaas</div>
                            </div>
                        </div>
                    </div>


                    <div class="mini-contenedor">
                        <img src="recursos/imp b.png" alt="Imagen 1" class="imagen-contenedor">

                        <div class="descpendiente">
                            <div class="titulo-contenedor">
                                <div class="titulo"><strong>Lugar</strong></div>
                                <img src="recursos/logo.png" alt="linea" class="mini-linea">
                            </div>
                            <div class="desc">
                                <div class="texto-desc">Descripción detallada y con muchas letraaaas</div>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>  
                
            </div>
        </div>
    </body>
</html>

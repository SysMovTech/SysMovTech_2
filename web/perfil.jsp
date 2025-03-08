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
        <link rel="stylesheet" href="estilos/mod.css"/>
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

                <a href="VW.jsp" class="menu-item trabajadores">
                    <img src="recursos/trab b.png" alt="Trabajadores" class="icon">
                    <span>Trabajadores</span>
                </a>

                <a href="perfil.jsp" class="menu-item active">
                    <img src="recursos/per w.png" alt="Perfil" class="icon">
                    <span>Perfil</span>
                </a>
            </nav>
            <div class="logout-section">
                <a href="#" class="logout-link" id="logoutLink">Cerrar sesión</a>
            </div>
        </div>
        <div id="logoutModal" class="modal">
            <div class="modal-content">
                <div class="contenedorveravr-print">    
                    <div class="titulo-modal">
                        <h3><b>¿Estás seguro que deseas cerrar sesión?</b></h3>
                    </div>
                    <div class="botonesEstado">
                        <button class="salir" onclick="confirmarLogout()">Sí</button>
                        <button class="seguir" onclick="cerrarModalLogout()">No</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-container">
            <div class="navegador">
                <div class="menu-navegador">
                    <button class="boton selected"><img src="recursos/verav w.png" alt="Ver" class="iconoopc"><span>Ver</span></button>
                    <a href="editperfil.jsp"><button class="boton"><img src="recursos/editar b.png" alt="Editar" class="iconoopc"></button></a>
                </div>
                <div class="titulo-navegador">Perfil</div>
                <div class="logout-sectionP">
                    <a href="#" class="logout-link" id="logoutLinkP">Cerrar sesión</a>
                </div>
            </div>
            <div id="logoutModal" class="modal">
                <div class="modal-content">
                    <div class="contenedorveravr-print">    
                        <div class="titulo-modal">
                            <h3><b>¿Estás seguro que deseas cerrar sesión?</b></h3>
                        </div>
                        <div class="botonesEstado">
                            <button class="salir" onclick="confirmarLogout()">Sí</button>
                            <button class="seguir" onclick="cerrarModalLogout()">No</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="contenedor">
                <div class="contenido">
                    <div class="izquierda">
                        <h1>Ver perfil</h1>
                        <div class="subtitulo">Nombre</div>
                        <input type="text" value="Información de la base de datos" readonly class="info-input">
                        <div class="subtitulo">Número de trabajador</div>
                        <input type="text" value="Información de la base de datos" readonly class="info-input">                     
                        <div class="subtitulo">Contraseña</div>
                        <input type="password" value="contraseña" readonly class="info-input">   
                        <div class="subtitulo">Rol laboral</div>
                        <input type="text" value="Información de la base de datos" readonly class="info-input">   
                    </div>
                    <div class="derecha">
                        <!-- acá va la cosa de la bd donde se recupera la dirección de la imagen ok -->
                        <img src="recursos/tec b.png" alt="Perfil">
                    </div>
                </div>
                <div class="subtituloABAJO">
                    <div class="subtitulo">Información</div>
                    <div id="info" class="info-div">Aquí va el texto que se saca del if donde dependiendo del tipo de perfil se despliega información diferente sobre lo que pueden hacer y etc </div>
                </div>

            </div>
        </div>
        <script>
            document.getElementById('logoutLink').addEventListener('click', function (e) {
                e.preventDefault();
                mostrarModalLogout();
            });

            function mostrarModalLogout() {
                let modal = document.getElementById('logoutModal');
                modal.classList.add('active');
            }

            function cerrarModalLogout() {
                let modal = document.getElementById('logoutModal');
                modal.classList.remove('active');
            }

            function confirmarLogout() {
                window.location.href = "logout.jsp";
            }
            
            document.getElementById('logoutLinkP').addEventListener('click', function (e) {
                e.preventDefault();
                mostrarModalLogout();
            });

        </script>
    </body>
</html>


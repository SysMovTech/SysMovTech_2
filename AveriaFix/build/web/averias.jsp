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
                <a href="notificaciones.jsp" class="menu-item notificaciones">
                    <img src="recursos/campana b.png" alt="Notificaciones" class="icon">
                    <span>Notificaciones</span>
                </a>
                <a href="averias.jsp" class="menu-item averias active">
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
                    <button class="avrmen selected"><img src="recursos/verav w.png" alt="Ver" class="iconoopc">Ver averías</button>
                    <a href="pendientesav.jsp"><button class="avrmen"><img src="recursos/reloj b.png" alt="Pendientes" class="iconoopc"></button></a>
                    <a href="anadirav.jsp"><button class="avrmen"><img src="recursos/adave b.png" alt="Anadir" class="iconoopc"></button></a>              
                </div>
                <div class="titulo-navegador">Averías</div>
            </div>
            <div class="filtroscont">
                <div class="menu-navegador">
                    <a>Filtrar por: &nbsp; &nbsp;</a>
                    <button class="btnfilt"><p class="txtflt"> Último mes </p></button>
                    <button class="btnfilt"><p class="txtflt">2 meses</p></button>
                    <button class="btnfilt"><p class="txtflt">6 meses</p></button>
                    <button class="btnfilt"><p class="txtflt">Resuelta</p></button>
                    <button class="btnfilt"><p class="txtflt">Activa</p></button>
                </div>
            </div>


            <!-- aquí debería estaar eso de insertar n contenedores de acuerdo a la BD-->
            <div class="contenedor-scroll-avr">
                <div class="fila-contenedores-avr">
                    <div class="contenedorveravr">
                        <table class="tabla-contenido">
                            <tr>
                                <td style="width: 7%">No CC <br> No PDC</td>
                                <td style="width: 2%">Reportó PDC</td>                                
                                <td style="width: 7%">Recibió TC</td>
                                <td style="width: 7%">Lugar</td>
                                <td style="width: 30%">Descripción</td>
                                <td style="width: 4%">Línea</td>
                                <td style="width: 1%">Subsis</td>
                                <td style="width: 2%">Intervención<br>ubicación</td>
                                <td style="width: 2%">Código<br>causa</td>
                                <td style="width: 2%">Tipo<br>avería</td>
                            </tr>
                            <tr>
                                <td>1234</td>
                                <td>Elsa Pato</td>
                                <td>Rosa </td>
                                <td>Estación</td>
                                <td>Descripción de la avería y muchas abreviaciones que no entiendo</td>
                                <td>
                                    <div class="folinea">
                                        <img src="metro/linea.png" alt="Perfil">
                                    </div>
                                </td>
                                <td>AB</td>
                                <td>ABCD </td>
                                <td>PQRS </td>
                                <td>XY </td>
                            </tr>
                        </table>
                        <div class="informacion-adicional">
                            <div class="info-col">Fecha</div>
                            <div class="info-col">Hora</div>
                            <div class="info-col">Reparación</div>
                            <div class="info-col">Estado</div>
                        </div>
                    </div>

                </div>
                <div class="fila-contenedores-avr">
                    <div class="contenedorveravr">
                        <table class="tabla-contenido">
                            <tr>
                                <td style="width: 7%">No CC <br> No PDC</td>
                                <td style="width: 2%">Reportó PDC</td>                                
                                <td style="width: 7%">Recibió TC</td>
                                <td style="width: 7%">Lugar</td>
                                <td style="width: 30%">Descripción</td>
                                <td style="width: 4%">Línea</td>
                                <td style="width: 1%">Subsis</td>
                                <td style="width: 2%">Intervención<br>ubicación</td>
                                <td style="width: 2%">Código<br>causa</td>
                                <td style="width: 2%">Tipo<br>avería</td>
                            </tr>
                            <tr>
                                <td>5678</td>
                                <td>Esteban Quito</td>
                                <td>Nombre</td>
                                <td>Estación</td>
                                <td>Descripción de la avería y muchas abreviaciones que no entiendo</td>
                                <td>
                                    <div class="folinea">
                                        <img src="metro/linea.png" alt="Perfil">
                                    </div>
                                </td>
                                <td>AB</td>
                                <td>ABCD </td>
                                <td>PQRS </td>
                                <td>XY </td>
                            </tr>
                        </table>
                        <div class="informacion-adicional">
                            <div class="info-col">Fecha</div>
                            <div class="info-col">Hora</div>
                            <div class="info-col">Reparación</div>
                            <div class="info-col">Estado</div>
                        </div>
                    </div>

                </div>
                <div class="fila-contenedores-avr">
                    <div class="contenedorveravr">
                        <table class="tabla-contenido">
                            <tr>
                                <td style="width: 7%">No CC <br> No PDC</td>
                                <td style="width: 2%">Reportó PDC</td>                                
                                <td style="width: 7%">Recibió TC</td>
                                <td style="width: 7%">Lugar</td>
                                <td style="width: 30%">Descripción</td>
                                <td style="width: 4%">Línea</td>
                                <td style="width: 1%">Subsis</td>
                                <td style="width: 2%">Intervención<br>ubicación</td>
                                <td style="width: 2%">Código<br>causa</td>
                                <td style="width: 2%">Tipo<br>avería</td>
                            </tr>
                            <tr>
                                <td>9012</td>
                                <td>Juan Martinez</td>
                                <td>Nombre</td>
                                <td>Estación</td>
                                <td>Descripción de la avería y muchas abreviaciones que no entiendo</td>
                                <td>
                                    <div class="folinea">
                                        <img src="metro/linea.png" alt="Perfil">
                                    </div>
                                </td>
                                <td>AB</td>
                                <td>ABCD </td>
                                <td>PQRS </td>
                                <td>XY </td>
                            </tr>
                        </table>
                        <div class="informacion-adicional">
                            <div class="info-col">Fecha</div>
                            <div class="info-col">Hora</div>
                            <div class="info-col">Reparación</div>
                            <div class="info-col">Estado</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

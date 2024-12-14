<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Averías</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos/estiloMenu.css"/>
        <link rel="stylesheet" href="estilos/general.css"/>
        <<link rel="stylesheet" href="estilos/modal-resuelta.css"/>
        <link rel="shortcut icon" href="recursos/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="estilos/mod.css"/>
        <link rel="stylesheet" href="estilos/modal-secundario.css">
        
        
        <script src="modal-secundario.js"></script>
        


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
                        }else if (i.classList.contains('perfil')) {
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
                    }else if (this.classList.contains('perfil')) {
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
                    }else if (item.classList.contains('trabajadores')) {
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
                <a href="averias.jsp" class="menu-item averias active">
                    <img src="recursos/avrs b.png" alt="Averías" class="icon">
                    <span>Averías</span>
                </a>
                
                <!--Este botón se insertará dependiendo del tipo de usuario (solo el "Jefe" tendrá este botón) -->
                <a href="VW.jsp" class="menu-item trabajadores">
                    <img src="recursos/trab b.png" alt="Trabajadores" class="icon">
                    <span>Trabajadores</span>
                </a>
                <!--Le pregunté a chat y si se puede waza -->
                
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
                                <td>Nombre</td>
                                <td>Nombre</td>
                                <td>Estación</td>
                                <td>Descripción de la avería y muchas abreviaciones que no entiendo</td>
                                <td>
                                    <div class="folinea">
                                        <img src="recursos/logo.png" alt="Perfil">
                                    </div>
                                </td>
                                <td>AB</td>
                                <td>ABCD</td>
                                <td>PQRS</td>
                                <td>XY</td>
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
                                <td>1234</td>
                                <td>Nombre</td>
                                <td>Nombre</td>
                                <td>Estación</td>
                                <td>Descripción de la avería y muchas abreviaciones que no entiendo</td>
                                <td>
                                    <div class="folinea">
                                        <img src="metro/linea.png" alt="Perfil">
                                    </div>
                                </td>
                                <td>AB</td>
                                <td>ABCD</td>
                                <td>PQRS</td>
                                <td>XY</td>
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
                                <td>1234</td>
                                <td>Nombre</td>
                                <td>Nombre</td>
                                <td>Estación</td>
                                <td>Descripción de la avería y muchas abreviaciones que no entiendo</td>
                                <td>
                                    <div class="folinea">
                                        <img src="metro/linea.png" alt="Perfil">
                                    </div>
                                </td>
                                <td>AB</td>
                                <td>ABCD</td>
                                <td>PQRS</td>
                                <td>XY</td>
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





        <div id="modal" class="modal">
            <div class="modal-content">
                <div class="titulo-modal">
                    <h3><b>Opciones de avería</b></h3>
                </div>
                <div class="modal-button-wrapper" id="button1Wrapper">
                    <img src="recursos/verav b.png" class="modal-button" id="button1">
                    <h3 class="modal-text">Ver avería</h3>
                </div>
                <div class="modal-button-wrapper" id="button2Wrapper">
                    <img src="recursos/editar b.png" class="modal-button" id="button2">
                    <h3 class="modal-text">Editar avería</h3>
                </div>
                <div class="modal-button-wrapper" id="button3Wrapper">
                    <img src="recursos/imp b.png" class="modal-button" id="button3">
                    <h3 class="modal-text">Imprimir reporte</h3>
                </div>
            </div>
        </div>



        <script>

        const modal = document.getElementById('modal');
        const modalContent = document.querySelector('.modal-content');
        const contenedorVerAvr = document.querySelector('.contenedorveravr');
        const originalModalContent = modalContent.innerHTML;
        function restoreOriginalContent() {
        modalContent.innerHTML = originalModalContent;
        const button1Wrapper = document.getElementById('button1Wrapper');
        button1Wrapper.addEventListener('click', () => {
        modalContent.innerHTML = `
                <div class="contenedor-scroll-avr-ver">
                            <div class="fila-contenedores-avr">
                        <div class="contenedorveravr-ver">
                <h1>Ver avería</h1>
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
                            <td>Nombre</td>
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
</div>`;
        });
        const button2Wrapper = document.getElementById('button2Wrapper');
        button2Wrapper.addEventListener('click', () => {
        modalContent.innerHTML = `
        <div class="contenedor-scroll-avr-edit">
            <div class="contenedor-mod-edit">
                <div class="contenidoeditav">
                    <div class="izquierda">
                        <h1>Editar avería</h1>
                        <form action="" method="">
                            <div class="contOpcAv">
                                Mantenimiento: 
                                <div class="checkbox-contenedor">
                                    <input type="radio" id="check1" name="mantenimiento" class="cuadrocheck">
                                    <label for="check1" class="check-label">
                                        <span class="check-text">Correctivo</span>
                                        <span class="checkmark">x</span>
                                    </label>

                                    <input type="radio" id="check2" name="mantenimiento" class="cuadrocheck">
                                    <label for="check2" class="check-label">
                                        <span class="check-text">Preventivo</span>
                                        <span class="checkmark">x</span>
                                    </label>

                                    <input type="radio" id="check3" name="mantenimiento" class="cuadrocheck">
                                    <label for="check3" class="check-label">
                                        <span class="check-text">Otros</span>
                                        <span class="checkmark">x</span>
                                    </label>
                                </div>
                            </div>
                            <div class="two-column-container">
                                <div class="left-column">
                                    <div class="campocolumna">No PDC: <input type="number" name="pdc" class="info-input-add"></div>
                                    <div class="campocolumna">Fecha de inicio: <input type="date" name="fecha" class="info-input-addB"></div>
                                </div>
                                <div class="right-column">
                                    <div class="campocolumna">Lugar: <input type="text" name="lugar" class="info-input-add"></div>
                                    <div class="campocolumna">Hora de inicio: <input type="time" name="hora" class="info-input-addB"></div>
                                </div>
                            </div>
                            <div class="formadd">
                                <div class="subtitulo">Descripción: <input type="text" name="nombre" class="info-input"></div>
                                <div class="subtitulo">Nombre de quien reporta: <input type="text" name="nombreRep" class="info-input-addF"></div>
                                <div class="subtitulo">Nombre de quien recibe: <input type="text" name="nombreRep" class="info-input-addR"></div>
                                <div class="campocolumna">Hora de observación: <input type="time" name="hora" class="info-input-addR"></div>
                                <div class="subtitulo">Observaciones<textarea name="nombreRep" class="info-input-addF"></textarea></div>
                                <div class="subtitulo">Nombre de quien edita: <input type="text" name="nombreRep" class="info-input-addR"></div>
                                <div class="contOpcAv">
                                    Estado: 
                                    <div class="botonesEstado">
                                        <button class="activa">Activa</button>
                                        <button class="resuelta">Resuelta</button>
                                    </div>   
                                </div>
            
            
                                <!-- Botón de Resuelta -->
<button id="btnResuelta" class="resuelta">Resuelta</button>

<!-- Modal para cargar la nueva página -->
<div id="modalSecundario" class="modal-secundario hidden">
    <div class="modal-secundario-contenido">
        <button id="cerrarModalSecundario" class="btn-cerrar">&times;</button>
        <iframe id="iframeModal" class="iframe-modal" src="" frameborder="0"></iframe>
    </div>
</div>




                                <div class="botonesEstado">
                                    <button type="submit" class="confirmar">Confirmar</button>
                                    <button type="button" class="cancelar" onclick="window.location.href = 'pruebaVentana.jsp'">Cancelar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

`;
                });
                const button3Wrapper = document.getElementById('button3Wrapper');
                button3Wrapper.addEventListener('click', () => {
                    modalContent.innerHTML = `
        <div class="contenedor-scroll-avr-print">
            <div class="fila-contenedores-avr">
                <div class="contenedorveravr-print">
                    <h2>Imprimir reporte</h2>
                    <div class="botones">
                        <button class="confirmar" onclick="descargarArchivo()">Descargar</button>
                        <button class="cancelar" onclick="window.location.href = 'pruebaVentana.jsp'">Cancelar</button>
                    </div>                        
                </div>
            </div>
        </div>`;
                });

            }


            contenedorVerAvr.addEventListener('click', () => {
                modal.classList.add('active');
                setTimeout(() => modalContent.classList.add('active'), 50);
                restoreOriginalContent();
            });
            modal.addEventListener('click', (e) => {
                if (e.target === modal) {
                    modal.classList.remove('active');
                    modalContent.classList.remove('active');
                }
            });

            function descargarArchivo() {
                const enlace = document.createElement("a");
                enlace.href = "ruta/al/archivo.pdf";
                enlace.download = "Comprobante.pdf";
                enlace.click();
            }


        </script>



        
    </body>
</html>

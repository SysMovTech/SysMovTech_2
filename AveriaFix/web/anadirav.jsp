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
                <a href="averias.jsp" class="menu-item averias active">
                    <img src="recursos/averia w.png" alt="Averías" class="icon">
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
                    <a href="averias.jsp"><button class="avrmen"><img src="recursos/verav b.png" alt="Veraverias" class="iconoopc"></button></a>
                    <a href="pendientesav.jsp"><button class="avrmen"><img src="recursos/reloj b.png" alt="Pendientes" class="iconoopc"></button></a>
                    <button class="avrmen selected"><img src="recursos/adave w.png" alt="Ver" class="iconoopc">Añadir</button>
                </div>
                <div class="titulo-navegador">Averías</div>
            </div>


            <div class="contenedor">
                <div class="contenidoaltaav">
                    <div class="izquierda">
                        <h1>Alta de avería</h1>
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
                                    <div class="campocolumna">Linea: 
                                        <select name="rol" id="linea" class="info-input-add" onchange="actualizarEstaciones()">
                                            <option value="" disabled selected>Seleccione la línea</option>
                                            <option value="L-1">Línea 1</option>
                                            <option value="L-2">Línea 2</option>
                                            <option value="L-3">Línea 3</option>
                                            <option value="L-4">Línea 4</option>
                                            <option value="L-5">Línea 5</option>
                                            <option value="L-6">Línea 6</option>
                                            <option value="L-7">Línea 7</option>
                                            <option value="L-8">Línea 8</option>
                                            <option value="L-9">Línea 9</option>
                                            <option value="L-10">Línea 10</option>
                                            <option value="L-A">Línea A</option>
                                            <option value="L-B">Línea B</option>
                                            <option value="L-12">Línea 12</option>
                                        </select>
                                    </div>
                                    <div class="campocolumna">Hora de inicio: <input type="time" name="hora" class="info-input-addB"></div>
                                </div>
                            </div>
                            <div class="formadd">
                                <div class="campocolumna">Estación:
                                    <select id="estaciones" class="info-input">
                                        <option value="" disabled selected>Seleccione una estación</option>
                                    </select>
                                </div>
                                <div class="subtitulo">Descripción: <input type="text" name="nombre" class="info-input"></div>
                                <div class="subtitulo">Nombre de quien reporta: <input type="text" name="nombreRep" class="info-input-addF"></div>
                                <div class="subtitulo">Nombre de quien recibe: <input type="text" name="nombreRep" class="info-input-addR"></div>
                            </div>
                            <div class="botones">
                                <button type="submit" class="confirmar">Agregar avería</button>
                                <button type="button" class="cancelar" onclick="descargarArchivo()"> Imprimir comprobante </button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function descargarArchivo() {
                const enlace = document.createElement("a");
                enlace.href = "ruta/al/archivo.pdf";
                enlace.download = "Comprobante.pdf";
                enlace.click();
            }

            const estacionesPorLinea = {
                "L-1": [
                    {value: "ORO", nombre: "Observatorio"},
                    {value: "TYA", nombre: "Tacubaya"},
                    {value: "JLA", nombre: "Juanacatlán"},
                    {value: "CPE", nombre: "Chapultepec"},
                    {value: "SLA", nombre: "Sevilla"},
                    {value: "ITE", nombre: "Insurgentes"},
                    {value: "CMO", nombre: "Cuauhtemoc"},
                    {value: "BRA", nombre: "Balderas"},
                    {value: "SGA", nombre: "Salto del agua"},
                    {value: "ICA", nombre: "Isabel la católica"},
                    {value: "PRE", nombre: "Pino Suárez"},
                    {value: "MCE", nombre: "Merced"},
                    {value: "CRA", nombre: "Candelaria"},
                    {value: "SRO", nombre: "San Lázaro"},
                    {value: "MMA", nombre: "Moctezuma"},
                    {value: "BNA", nombre: "Balbuena"},
                    {value: "BRO", nombre: "Boulevard Puerto Aéreo"},
                    {value: "GRA", nombre: "Gomez Farías"},
                    {value: "ZZA", nombre: "Zaragoza"},
                    {value: "PLA", nombre: "Pantitlán"},
                ],
                "L-2": [
                    {value: "C4C", nombre: "Cuatro Caminos"},
                    {value: "TAC", nombre: "Tacuba"},
                    {value: "HID", nombre: "Hidalgo"}
                ],
                "L-3": [
                    {value: "IND", nombre: "Indios Verdes"},
                    {value: "D18", nombre: "Deportivo 18 de Marzo"},
                    {value: "BAL", nombre: "Balderas"}
                ]
            };

            function actualizarEstaciones() {
                const lineaSeleccionada = document.getElementById("linea").value;
                const estacionesSelect = document.getElementById("estaciones");

                estacionesSelect.innerHTML = '<option value="" disabled selected>Seleccione una estación</option>';

                if (estacionesPorLinea[lineaSeleccionada]) {
                    estacionesPorLinea[lineaSeleccionada].forEach(estacion => {
                        const opcion = document.createElement("option");
                        opcion.value = estacion.value; 
                        opcion.textContent = estacion.nombre; 
                        estacionesSelect.appendChild(opcion);
                    });
                }
            }
        </script>
    </body>
</html>

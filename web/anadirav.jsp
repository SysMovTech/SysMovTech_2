<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Averías</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos/estiloMenu.css"/>
        <link rel="stylesheet" href="estilos/general.css"/>
        <link rel="stylesheet" href="estilos/forms.css"/>
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
                <a href="averias.jsp" class="menu-item active">
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
                    <button class="avrmen selected"><img src="recursos/adave w.png" alt="Ver" class="iconoopc"><span>Añadir</span></button>
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
                                    <input type="radio" id="check1" name="mantenimiento" class="cuadrocheck" checked>
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
                            
                            <div class="formadd">
                                
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
                                            <option value="L-A">Línea A</option>
                                            <option value="L-B">Línea B</option>
                                            <option value="L-12">Línea 12</option>
                                        </select>
                                    </div>
                                    <div class="campocolumna">Hora de inicio: <input type="time" name="hora" class="info-input-addB"></div>
                                </div>
                            </div>
                                
                                
                                <div class="campo">
                                    <span class="campo-label">Estación: </span>
                                    <select id="estaciones" class="info-input">
                                        <option value="" disabled selected>Seleccione una estación</option>
                                    </select>
                                </div>
                                <div class="campo">
                                    <span class="campo-label">Descripción: </span>
                                    <input type="text" name="nombre" class="info-input">
                                </div>
                                <div class="campo">
                                    <span class="campo-label">Nombre de quien reporta: </span>
                                    <input type="text" name="nombre" class="info-input">
                                </div>
                                <div class="campo">
                                    <span class="campo-label">Nombre de quien recibe: </span>
                                    <input type="text" name="nombre" class="info-input">
                                </div>
                                
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
                    {value: "PLA", nombre: "Pantitlán"}
                ],
                "L-2": [
                    {value: "CSO", nombre: "Cuatro Caminos"},
                    {value: "PNE", nombre: "Panteones"},
                    {value: "TBA", nombre: "Tacuba"},
                    {value: "CCA", nombre: "Cuitláhuac"},
                    {value: "PLA", nombre: "Popotla"},
                    {value: "CAR", nombre: "Colegio Militar"},
                    {value: "NLA", nombre: "Normal"},
                    {value: "SME", nombre: "San Cosme"},
                    {value: "RNO", nombre: "Revolución"},
                    {value: "HGO", nombre: "Hidalgo"},
                    {value: "BSE", nombre: "Bellas Artes"},
                    {value: "ADE", nombre: "Allende"},
                    {value: "ZLO", nombre: "Zócalo"},
                    {value: "PRE", nombre: "Pino Suárez"},
                    {value: "SDA", nombre: "San Antonio Abad"},
                    {value: "CNO", nombre: "Chabacano"},
                    {value: "VTO", nombre: "Viaducto"},
                    {value: "XLA", nombre: "Xola"},
                    {value: "VSE", nombre: "Villa de Cortés"},
                    {value: "NSA", nombre: "Nativitas"},
                    {value: "PLE", nombre: "Portales"},
                    {value: "ETA", nombre: "Ermita"},
                    {value: "GYA", nombre: "General Anaya"},
                    {value: "TNA", nombre: "Taxqueña"},
                ],
                "L-3": [
                    {value: "ISE", nombre: "Indios Verdes"},
                    {value: "DZO", nombre: "Deportivo 18 de marzo"},
                    {value: "PRO", nombre: "Potrero"},
                    {value: "LZA", nombre: "La Raza"},
                    {value: "TCO", nombre: "Tlatelolco"},
                    {value: "GRO", nombre: "Guerrero"},
                    {value: "HGO", nombre: "Hidalgo"},
                    {value: "JZE", nombre: "Juárez"},
                    {value: "BRA", nombre: "Balderas"},
                    {value: "NSE", nombre: "Niños Héroes / Poder Judicial CDMX"},
                    {value: "HLA", nombre: "Hospital General"},
                    {value: "CCO", nombre: "Centro Médico"},
                    {value: "EPA", nombre: "Etiopía / Plaza de la Transparencia"},
                    {value: "ENI", nombre: "Eugenia"},
                    {value: "DTE", nombre: "División del Norte"},
                    {value: "ZTA", nombre: "Zapata"},
                    {value: "CNA", nombre: "Coyoacán"},
                    {value: "VSO", nombre: "Viveros / Derechos Humanos"},
                    {value: "MDO", nombre: "Miguel Ángel de Quevedo"},
                    {value: "CLO", nombre: "Copilco"},
                    {value: "UDA", nombre: "Universidad"}
                ],
                "L-4": [
                    {value: "MRA", nombre: "Martín Carrera"},
                    {value: "TAN", nombre: "Talisman"},
                    {value: "BTO", nombre: "Bondojito"},
                    {value: "CDO", nombre: "Consulado"},
                    {value: "CTE", nombre: "Canal del Norte"},
                    {value: "MSO", nombre: "Morelos"},
                    {value: "CRA", nombre: "Candelaria"},
                    {value: "FDO", nombre: "Fray Servando"},
                    {value: "JCA", nombre: "Jamaica"},
                    {value: "STA", nombre: "Santa Anita"}
                ],
                "L-5": [
                    {value: "PLA", nombre: "Pantitlán"},
                    {value: "HES", nombre: "Hangares"},
                    {value: "TRA", nombre: "Terminal Aerea"},
                    {value: "ONA", nombre: "Oceanía"},
                    {value: "AGO", nombre: "Aragon"},
                    {value: "ENA", nombre: "Eduardo Molina"},
                    {value: "CDO", nombre: "Consulado"},
                    {value: "VME", nombre: "Valle Gómez"},
                    {value: "MRO", nombre: "Misterios"},
                    {value: "LZA", nombre: "La Raza"},
                    {value: "ATE", nombre: "Autobuses del Norte"},
                    {value: "ILO", nombre: "Instituto del Petróleo"},
                    {value: "PCO", nombre: "Politécnico"}
                ],
                "L-6": [
                    {value: "RRO", nombre: "El Rosario"},
                    {value: "TOC", nombre: "Tezozomoc"},
                    {value: "ACO", nombre: "UAM - Azcapotzalco"},
                    {value: "FRA", nombre: "Ferrería / Arena CDMX"},
                    {value: "N45", nombre: "Norte 45"},
                    {value: "VJO", nombre: "Vallejo"},
                    {value: "ILO", nombre: "Instituto del Petróleo"},
                    {value: "LTA", nombre: "Lindavista"},
                    {value: "DZO", nombre: "Deportivo 18 de marzo"},
                    {value: "LCA", nombre: "La Villa - Basílica"},
                    {value: "MRA", nombre: "Martín Carrera"}
                ],
                "L-7": [
                    {value: "RRO", nombre: "El Rosario"},
                    {value: "AAN", nombre: "Aquíles Serdán"},
                    {value: "CES", nombre: "Camarones"},
                    {value: "RRA", nombre: "Refinería"},
                    {value: "TBA", nombre: "Tacuba"},
                    {value: "SIN", nombre: "San Joaquín"},
                    {value: "PLO", nombre: "Polanco"},
                    {value: "ARO", nombre: "Auditorio"},
                    {value: "CTS", nombre: "Constituyentes"},
                    {value: "TYA", nombre: "Tacubaya"},
                    {value: "SOS", nombre: "San Pedro de los Pinos"},
                    {value: "SNO", nombre: "San Antonio"},
                    {value: "MAC", nombre: "Mixcoac"},
                    {value: "BMO", nombre: "Barranca del Muerto"}
                ],
                "L-8": [
                    {value: "GDI", nombre: "Garibaldi"},
                    {value: "BSE", nombre: "Bellas Artes"},
                    {value: "SAN", nombre: "San Juan de Letrán"},
                    {value: "SGA", nombre: "Salto del agua"},
                    {value: "DES", nombre: "Doctores"},
                    {value: "ORA", nombre: "Obrera"},
                    {value: "CNO", nombre: "Chabacano"},
                    {value: "LGA", nombre: "La Viga"},
                    {value: "STA", nombre: "Santa Anita"},
                    {value: "CYA", nombre: "Coyuya"},
                    {value: "ICO", nombre: "Iztacalco"},
                    {value: "APO", nombre: "Apatlaco"},
                    {value: "ALO", nombre: "Aculco"},
                    {value: "E01", nombre: "Escuadron 201"},
                    {value: "ALI", nombre: "Atlalilco"},
                    {value: "IPA", nombre: "Iztapalapa"},
                    {value: "CLA", nombre: "Cerro de la Estrella"},
                    {value: "UAM", nombre: "UAM-I"},
                    {value: "C17", nombre: "Constitución de 1917"}
                ],
                "L-9": [
                    {value: "TYA", nombre: "Tacubaya"},
                    {value: "PMO", nombre: "Patriotismo"},
                    {value: "CGO", nombre: "Chilpancingo"},
                    {value: "CCO", nombre: "Centro Médico"},
                    {value: "LAS", nombre: "Lázaro Cardenas"},
                    {value: "CNO", nombre: "Chabacano"},
                    {value: "JCA", nombre: "Jamaica"},
                    {value: "MCA", nombre: "Mixiuhca"},
                    {value: "VMO", nombre: "Velódromo"},
                    {value: "CVA", nombre: "Ciudad Deportiva"},
                    {value: "PBA", nombre: "Puebla"},
                    {value: "PLA", nombre: "Pantitlán"}
                    
                ],
                "L-A": [
                    {value: "PLA", nombre: "Pantitlán"},
                    {value: "AAL", nombre: "Agrícola Oriental"},
                    {value: "CSJ", nombre: "Canal de San Juan"},
                    {value: "TTS", nombre: "Tepalcates"},
                    {value: "GTO", nombre: "Guelatao"},
                    {value: "PJO", nombre: "Peñón Viejo"},
                    {value: "ALA", nombre: "Acatitla"},
                    {value: "SMA", nombre: "Santa Marta"},
                    {value: "LYE", nombre: "Los Reyes"},
                    {value: "LPZ", nombre: "La Paz"}
                ],
                "L-B": [
                    {value: "CAZ", nombre: "Ciudad Azteca"},
                    {value: "PON", nombre: "Plaza Aragón"},
                    {value: "OCA", nombre: "Olímpica"},
                    {value: "EEC", nombre: "Ecatepec"},
                    {value: "MIZ", nombre: "Múzquiz"},
                    {value: "RIO", nombre: "Río de los remedios"},
                    {value: "IRA", nombre: "Impulsora"},
                    {value: "NZA", nombre: "Nezahualcóyotl"},
                    {value: "VON", nombre: "Villa de Aragón"},
                    {value: "BON", nombre: "Bosque de Aragón"},
                    {value: "DIA", nombre: "Deportivo Oceanía"},
                    {value: "ONA", nombre: "Oceanía"},
                    {value: "RUO", nombre: "Romero Rubio"},
                    {value: "RFM", nombre: "Ricardo Flores Magón"},
                    {value: "SRO", nombre: "San Lázaro"},
                    {value: "MSO", nombre: "Morelos"},
                    {value: "TTO", nombre: "Tepito"},
                    {value: "LGU", nombre: "Lagunilla"},
                    {value: "GDI", nombre: "Garibaldi"},
                    {value: "GRO", nombre: "Guerrero"},
                    {value: "BTA", nombre: "Buenavista"},
                    {value: "", nombre: ""}
                ],
                "L-12": [
                    {value: "MAC", nombre: "Mixcoac"},
                    {value: "IUR", nombre: "Insurgentes Sur"},
                    {value: "HRE", nombre: "Hospital 20 de Noviembre"},
                    {value: "ZTA", nombre: "Zapata"},
                    {value: "PDO", nombre: "Parque de los Venados"},
                    {value: "EAL", nombre: "Eje Central"},
                    {value: "ETA", nombre: "Ermita"},
                    {value: "MGO", nombre: "Mexicaltzingo"},
                    {value: "ALI", nombre: "Atlalilco"},
                    {value: "CAN", nombre: "Culhuacan"},
                    {value: "SAT", nombre: "San Andrés Tomalán"},
                    {value: "LLA", nombre: "Lomas Estrella"},
                    {value: "C11", nombre: "Calle 11"},
                    {value: "POT", nombre: "Periférico Oriente"},
                    {value: "TZO", nombre: "Tezonco"},
                    {value: "OVO", nombre: "Olivos"},
                    {value: "NRA", nombre: "Nopalera"},
                    {value: "ZAN", nombre: "Zapotitlan"},
                    {value: "TGO", nombre: "Tlaltengo"},
                    {value: "TAC", nombre: "Tlahuac"}
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

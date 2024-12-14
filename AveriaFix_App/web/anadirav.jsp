<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="es">
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
                    <a href="averias.jsp"><button class="avrmen"><img src="recursos/verav b.png" alt="Ver" class="iconoopc"></button></a>
                    <a href="pendientesav.jsp"><button class="avrmen"><img src="recursos/reloj b.png" alt="Pendientes" class="iconoopc"></button></a>
                    <button class="avrmen selected"><img src="recursos/adave w.png" alt="Añadir" class="iconoopc"></button>
                </div>
                <div class="titulo-navegador">Añadir</div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="contenedor">
                        <div class="contenidoaltaav">
                            <div class="izquierda">
                                <h1>Alta de avería</h1>
                                <form action="" method="">
                                    <div class="contOpcAv">
                                        <label>Mantenimiento:</label>
                                        <span class="check-text">Correctivo</span>
                                    </div>
                            </div>

                            <div class="two-column-container">
                                <div class="left-column">
                                    <div class="campocolumna">No PDC:
                                        <input type="number" name="pdc" class="info-input-add">
                                    </div>
                                    <div class="campocolumna">Fecha de inicio:
                                        <input type="date" name="fecha" class="info-input-addB">
                                    </div>
                                </div>
                                <div class="right-column">
                                    <div class="campocolumna">Lugar:
                                        <input type="text" name="lugar" class="info-input-add">
                                    </div>
                                    <div class="campocolumna">Hora de inicio:
                                        <input type="time" name="hora" class="info-input-addB">
                                    </div>
                                </div>
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
                            </div>

                            <div class="campocolumna">Estación:
                                <select id="estaciones" class="info-input-add">
                                    <option value="" disabled selected>Seleccionar</option>
                                </select>
                            </div>

                            <div class="formadd">
                                <div class="subtitulo">Descripción:
                                    <input type="text" name="descripcion" class="info-input">
                                </div>
                                <div class="subtitulo">Nombre de quien reporta:
                                    <input type="text" name="nombreRep" class="info-input-addF">
                                </div>
                                <div class="subtitulo">Nombre de quien recibe:
                                    <input type="text" name="nombreRecibe" class="info-input-addR">
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
                    {value: "RNO", nombre: "Revolución"},
                    {value: "HGO", nombre: "Hidalgo"},
                    {value: "BSE", nombre: "Bellas Artes"},
                    {value: "ADE", nombre: "Allende"},
                    {value: "ZLO", nombre: "Zócalo"},
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
                    {value: "PRE", nombre: "Pino Suárez"}
                ],
                "L-3": [
                    {value: "BRA", nombre: "Balderas"},
                    {value: "ISE", nombre: "Indios Verdes"},
                    {value: "DZO", nombre: "Deportivo 18 de marzo"},
                    {value: "PRO", nombre: "Potrero"},
                    {value: "LZA", nombre: "La Raza"},
                    {value: "TCO", nombre: "Tlatelolco"},
                    {value: "GRO", nombre: "Guerrero"},
                    {value: "HGO", nombre: "Hidalgo"},
                    {value: "JZE", nombre: "Juárez"},
                    {value: "NSE", nombre: "Niños Héroes"},
                    {value: "HLA", nombre: "Hospital General"},
                    {value: "CCO", nombre: "Centro Médico"},
                    {value: "EPA", nombre: "Etiopía/Plaza de la Transparencia"},
                    {value: "DTE", nombre: "División del Norte"},
                    {value: "ZTA", nombre: "Zapata"},
                    {value: "CNA", nombre: "Coyoacán"},
                    {value: "VSO", nombre: "Viveros"},
                    {value: "MDO", nombre: "Miguel Ángel de Quevedo"},
                    {value: "CLO", nombre: "Copilco"},
                    {value: "UDA", nombre: "Universidad"}
                ],
                "L-4": [
                    {value: "CRA", nombre: "Candelaria"},
                    {value: "MRA", nombre: "Martín Carrera"},
                    {value: "TAN", nombre: "Talisman"},
                    {value: "BTO", nombre: "Bondojito"},
                    {value: "CDO", nombre: "Consulado"},
                    {value: "CTE", nombre: "Canal del Norte"},
                    {value: "MSO", nombre: "Morelos"},
                    {value: "FDO", nombre: "Fray Servando"},
                    {value: "JCA", nombre: "Jamaica"},
                    {value: "STA", nombre: "Santa Anita"}
                ],
                "L-5": [
                    {value: "PLA", nombre: "Pantitlán"},
                    {value: "CDO", nombre: "Consulado"},
                    {value: "LZA", nombre: "La Raza"},
                    {value: "HES", nombre: "Hangares"},
                    {value: "TRA", nombre: "Terminal Aerea"},
                    {value: "ONA", nombre: "Oceanía"},
                    {value: "AGO", nombre: "Aragon"},
                    {value: "ENA", nombre: "Eduardo Molina"},
                    {value: "VME", nombre: "Valle Gómez"},
                    {value: "MRO", nombre: "Misterios"},
                    {value: "ATE", nombre: "Autobuses del Norte"},
                    {value: "ILO", nombre: "Instituto del Petróleo"},
                    {value: "PCO", nombre: "Politécnico"}
                ],
                "L-6": [
                    {value: "IND", nombre: "Indios Verdes"},
                    {value: "D18", nombre: "Deportivo 18 de Marzo"},
                    {value: "BAL", nombre: "Balderas"}
                ],
                "L-7": [
                    {value: "IND", nombre: "Indios Verdes"},
                    {value: "D18", nombre: "Deportivo 18 de Marzo"},
                    {value: "BAL", nombre: "Balderas"}
                ],
                "L-8": [
                    {value: "IND", nombre: "Indios Verdes"},
                    {value: "D18", nombre: "Deportivo 18 de Marzo"},
                    {value: "BAL", nombre: "Balderas"}
                ],
                "L-9": [
                    {value: "IND", nombre: "Indios Verdes"},
                    {value: "D18", nombre: "Deportivo 18 de Marzo"},
                    {value: "BAL", nombre: "Balderas"}
                ],
                "L-A": [
                    {value: "IND", nombre: "Indios Verdes"},
                    {value: "D18", nombre: "Deportivo 18 de Marzo"},
                    {value: "BAL", nombre: "Balderas"}
                ],
                "L-B": [
                    {value: "IND", nombre: "Indios Verdes"},
                    {value: "D18", nombre: "Deportivo 18 de Marzo"},
                    {value: "BAL", nombre: "Balderas"}
                ],
                "L-12": [
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Avería Resuelta</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos/estiloMenu.css"/>
        <link rel="stylesheet" href="estilos/general.css"/>
        <link rel="shortcut icon" href="recursos/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="estilos/mod_editar.css"/>
        <link rel="stylesheet" href="estilos/forms.css"/>
        <style>
            body, html {
                overflow: hidden;
                height: 100%;
                margin: 0;
                padding: 0;
            }

            .contenedor-scroll-avr-obs {
                overflow: hidden;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .info-inputFinAv {
                width: 100%;
                max-height: 100%;
                overflow-y: auto;
                resize: none;
                white-space: pre-wrap;
                word-wrap: break-word;
                font-size: 16px;
                padding: 10px;
                border: 1px ;
                border-radius: 0 30px 30px 30px;
                background-color: #f9f9f9;
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="contenedor-scroll-avr-edit">
            <div class="contenedor-mod-editF">
                <div class="contenidoeditav">
                    <div class="izquierda">
                        <h1>Avería resuelta</h1>
                        <form action="" method="">
                            <div class="formadd">
                                <div class="campo">
                                    <span class="campo-label">Nombre de quien reporta fin de avería</span>
                                    <input type="text" name="nombre" class="info-input">
                                </div>

                                <div class="campo">
                                    <span class="campo-label">Nombre de quien recibió el reporte:</span>
                                    <input type="text" name="nombreRecRep" class="info-input">
                                </div>

                                <div class="campo">
                                    <span class="campo-label">Reparación: </span>
                                    <input type="text" name="nombreRep" class="info-input">
                                </div>

                                <div class="campo">
                                    <span class="campo-label">Fecha: </span>
                                    <input type="date" name="fechaRes" class="info-input">
                                </div>

                                <div class="two-column-container">
                                    <div class="left-column">
                                        <div class="titulocampo"> 
                                            <div class="campocolumna">Observaciones finales</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="j1">
                                    <textarea name="nombre" class="info-inputFinAv"></textarea>
                                </div>
                                <div class="two-column-container">
                                    <div class="left-column">
                                        <div class="titulocampo"> 
                                            <div class="campocolumna">Calificación</div>
                                        </div>
                                    </div>
                                    <div class="right-column">
                                        <div class="campocolumna">
                                            <div class="contenedor">
                                                <span class="campo-label"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <div class="j2">
                                    <div class="contenedorResuelta">
                                        <div class="campo">
                                            <span class="campo-label">Subsistema: </span>
                                            <input type="text" name="fechaRes" class="info-inputSub">
                                        </div>
                                        <div class="campo">
                                            <span class="campo-label">Tipo de avería: </span>
                                            <input type="text" name="fechaRes" class="info-inputSub">
                                        </div>
                                        <div class="campo">
                                            <span class="campo-label">Código causa: </span>
                                            <input type="text" name="fechaRes" class="info-inputSub">
                                        </div>
                                        <div class="campo">
                                            <span class="campo-label">Intervención ubicación: </span>
                                            <input type="text" name="fechaRes" class="info-inputSub">
                                        </div>
                                        <div class="campo">
                                            <span class="campo-label">Lugar: </span>
                                            <input type="text" name="fechaRes" class="info-inputSub">
                                        </div>
                                    </div>
                                </div>
                                <div class="botonesEstado">
                                    <button type="submit" class="confirmar">Guardar</button>
                                    <a href="editPage.jsp">
                                        <button type="button" class="cancelar">
                                            Cancelar
                                        </button>
                                    </a>
                                </div>

                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            window.parent.postMessage("resPage.jsp", "*");
        </script>



    </body>
</html>

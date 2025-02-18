<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Avería</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos/estiloMenu.css"/>
        <link rel="stylesheet" href="estilos/general.css"/>
        <link rel="shortcut icon" href="recursos/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="estilos/mod_editar.css"/>
        <link rel="stylesheet" href="estilos/forms.css"/>
    </head>
    <body>
        <div class="contenedor-scroll-avr-edit">
            <div class="contenedor-mod-edit">
                <div class="contenidoeditav">
                    <div class="izquierda">
                        <h1>Editar avería</h1>
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
                                        <div class="campocolumna">Lugar: <input type="text" name="lugar" class="info-input-add"></div>
                                        <div class="campocolumna">Hora de inicio: <input type="time" name="hora" class="info-input-addB"></div>
                                    </div>
                                </div>

                                <div class="campo">
                                    <span class="campo-label">Descripción:</span>
                                    <input type="text" name="nombre" class="info-input">
                                </div>

                                <div class="campo">
                                    <span class="campo-label">Nombre de quien reporta:</span>
                                    <input type="text" name="nombreRep" class="info-input">
                                </div>

                                <div class="campo">
                                    <span class="campo-label">Nombre de quien recibe:</span>
                                    <input type="text" name="nombreRep" class="info-input">
                                </div>

                                <div class="campo">
                                    <span class="campo-label">Hora de observación:</span>
                                    <input type="time" name="hora" class="info-input">
                                </div>

                                <div class="campo">
                                    <span class="campo-label">Observaciones:</span>
                                    <div class="input-group">
                                        <input type="text" name="observaciones" class="info-input">
                                        <a href="obs.jsp">
                                            <button type="button" class="avrmen">
                                                <img src="recursos/adave b.png" alt="Añadir" class="iconoopc">
                                            </button>
                                        </a>
                                    </div>
                                </div>

                                <div class="campo">
                                    <span class="campo-label">Nombre de quien edita:</span>
                                    <input type="text" name="nombreRep" class="info-input">
                                </div>

                                <div class="contOpcAv">
                                    Estado:
                                    <div class="botonesEstado">
                                        <button class="activa">Activa</button>
                                        <button class="resuelta">Resuelta</button>
                                    </div>   
                                </div>
                                <div class="botonesEstado">
                                    <button type="submit" class="confirmar">Confirmar</button>
                                    <button type="button" class="cancelar" onclick="cerrarModal()">Cancelar</button>
                                    

                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function cerrarModal() {
                window.parent.postMessage('cerrarModal', '*');
            }
            
        </script>

    </body>
</html>

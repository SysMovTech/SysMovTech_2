<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Observaciones de Avería</title>
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

            .info-inputOBS {
                width: 100%; 
                max-height: 100%; 
                overflow-y: auto; 
                resize: none; 
                white-space: pre-wrap; 
                word-wrap: break-word; 
                font-size: 16px; 
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
                font-family: 'Poppins', sans-serif;
            }


        </style>
    </head>
    <body>
        <div class="contenedor-scroll-avr-obs">
            <div class="contenedor-mod-obs">
                <div class="contenidoeditav">
                    <div class="izquierda">
                        <h1>Observaciones</h1>
                        <form action="" method="">
                            <div class="formadd">
                                <div class="campo">
                                    <textarea name="nombre" class="info-inputOBS"></textarea>
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
    </body>
</html>

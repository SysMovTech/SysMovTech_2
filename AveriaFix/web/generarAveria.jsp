<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="conexion.Base" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Procesar Avería</title>
    </head>
    <body>
        <%
            // Obtener los parámetros del formulario
            String noPdcStr = request.getParameter("pdc");
            String lugar = request.getParameter("lugar");
            String fechaStr = request.getParameter("fecha");
            String horaStr = request.getParameter("hora");
            String descripcion = request.getParameter("descripcion");
            String nombreReporte = request.getParameter("nombreReporte");
            String nombreRecibe = request.getParameter("nombreRecibe");
            int noPdc = Integer.parseInt(noPdcStr);
                Date fecha = Date.valueOf(fechaStr);
                if (horaStr.length() == 5) {
                    horaStr += ":00";
                }
                Time hora = Time.valueOf(horaStr);

            // Validar que los parámetros no sean nulos o vacíos
            if (noPdcStr == null || lugar == null || fechaStr == null || horaStr == null
                    || descripcion == null || nombreReporte == null || nombreRecibe == null
                    || noPdcStr.isEmpty() || lugar.isEmpty() || fechaStr.isEmpty() || horaStr.isEmpty()
                    || descripcion.isEmpty() || nombreReporte.isEmpty() || nombreRecibe.isEmpty()) {
                out.println("Error: Todos los campos son obligatorios.");
                response.sendRedirect("anadirav.jsp");
                return;
            }

            try {
                // Convertir parámetros a los tipos requeridos
                

                // Si la hora está en formato "HH:mm", añadir ":00"
                

                // Conectar con la base de datos
                Base bd = new Base();
                bd.conectar();

                // Llamar al procedimiento almacenado
                int rowsAffected = bd.altaAveria(noPdc, lugar, fecha, hora, descripcion, nombreReporte, nombreRecibe);

                // Verificar si se realizó alguna inserción
                if (rowsAffected > 0) {
                    response.sendRedirect("notificaciones.jsp");
                } else {
                    out.println("Error: No se pudo registrar la avería.");
                    //response.sendRedirect("anadirav.jsp");
                }
            } catch (NumberFormatException e) {
                out.println("Error: Formato inválido en los campos numéricos o de fecha.");
                e.printStackTrace();
                //response.sendRedirect("anadirav.jsp");
            } catch (SQLException e) {
                out.println("Error: Problema con la base de datos. " + e.getMessage());
                out.println(noPdcStr);
                out.println(lugar);
                out.println(fecha);
                out.println(hora);
                out.println(descripcion);
                out.println(nombreReporte);
                out.println(nombreRecibe);
                
                e.printStackTrace();
                //response.sendRedirect("anadirav.jsp");
            }
        %>
    </body>
</html>
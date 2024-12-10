<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="conexion.Base"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Procesar Avería</title>
    </head>
    <%
            // Obtener los parámetros del formulario
            String noPdcStr = request.getParameter("pdc");
            String linea = request.getParameter("linea");
            String estacion = request.getParameter("estacion");
            String fechaStr = request.getParameter("fecha");
            String horaStr = request.getParameter("hora");
            String descripcion = request.getParameter("descripcion");
            String nombreReporte = request.getParameter("nombreReporte");
            String nombreRecibe = request.getParameter("nombreRecibe");

            // Validar que los parámetros no sean nulos o vacíos
            if (noPdcStr == null || linea == null || estacion == null || fechaStr == null || horaStr == null
                    || descripcion == null || nombreReporte == null || nombreRecibe == null
                    || noPdcStr.isEmpty() || linea.isEmpty() || estacion.isEmpty() || fechaStr.isEmpty() || horaStr.isEmpty()
                    || descripcion.isEmpty() || nombreReporte.isEmpty() || nombreRecibe.isEmpty()) {
                out.println("Error: Todos los campos son obligatorios.");
                out.println(noPdcStr);
                out.println(estacion);
                out.println(linea);
                out.println(fechaStr);
                out.println(horaStr);
                out.println(descripcion);
                out.println(nombreReporte);
                out.println(nombreRecibe);
                //response.sendRedirect("anadirav.jsp");
                return;
            }

            // Convertir parámetros a los tipos requeridos
            int noPdc = Integer.parseInt(noPdcStr);
            Date fecha = Date.valueOf(fechaStr);

            // Si la hora está en formato "HH:mm", añadir ":00"
            if (horaStr.length() == 5) {
                horaStr += ":00";
            }
            Time hora = Time.valueOf(horaStr);

            try {
                // Código que puede lanzar excepciones
                Base bd = new Base();
                bd.conectar();

                ResultSet rsAgregarAveria = bd.altaAveria(noPdc, estacion, linea, fecha, hora, descripcion, nombreReporte, nombreRecibe);

                if (rsAgregarAveria.next()) {

                    if (rsAgregarAveria.getString("@mensaje").equals("Insercion Exitosa") && rsAgregarAveria.getString("@no_Insercion").equals(noPdc)) {
                        response.sendRedirect("notificaciones.jsp");
                    }

                }
            } catch (Exception e) {
                response.sendRedirect("notificaciones.jsp");
            }
    %>
    <body>
    </body>
</html>
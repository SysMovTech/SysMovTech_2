<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="conexion.Base" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <%
        String noPdcStr = request.getParameter("pdc");
        String lugar = request.getParameter("lugar");
        String fechaStr = request.getParameter("fecha");
        String horaStr = request.getParameter("hora");
        String descripcion = request.getParameter("descripcion");
        String nombreReporte = request.getParameter("nombreReporte");
        String nombreRecibe = request.getParameter("nombreRecibe");

        if (noPdcStr == null || lugar == null || fechaStr == null || horaStr == null
                || descripcion == null || nombreReporte == null || nombreRecibe == null
                || noPdcStr.isEmpty() || lugar.isEmpty() || fechaStr.isEmpty() || horaStr.isEmpty()
                || descripcion.isEmpty() || nombreReporte.isEmpty() || nombreRecibe.isEmpty()) {
            response.sendRedirect("anadirav.jsp");
        } else {
            try {
                int noPdc = Integer.parseInt(noPdcStr);
                Date fecha = Date.valueOf(fechaStr);
                
                if (horaStr.length() == 5) { 
                    horaStr += ":00";      
                }
                Time hora = Time.valueOf(horaStr);

                Base bd = new Base();
                bd.conectar();

                int rowsAffected = bd.altaAveria(noPdc, lugar, fecha, hora, descripcion, nombreReporte, nombreRecibe);

                if (rowsAffected > 0) {
                    response.sendRedirect("notificaciones.jsp");
                } else {
                    response.sendRedirect("anadirav.jsp");
                }

            } catch (NumberFormatException e) {
                response.sendRedirect("anadirav.jsp");
            } catch (SQLException e) {
                response.sendRedirect("anadirav.jsp");
            }
        }
    %>
    <body>
    </body>
</html>

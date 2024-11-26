<%@page import="conexion.Base"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Perfil</title>
    </head>
    <body>
        <%
            HttpSession miSesion = request.getSession(false); // No crear una nueva sesión si no existe

            if (miSesion == null) {
                response.sendRedirect("index.html"); // Redirigir si no hay sesión
                return;
            }

            Integer idUsr = (Integer) miSesion.getAttribute("idUsr");
            String psw = (String) miSesion.getAttribute("psw");
            String password = request.getParameter("contrasena");
            String confPassword = request.getParameter("confirmar_contrasena");

            if (idUsr == null || password == null || confPassword == null) {
                response.sendRedirect("index.html"); // Redirigir si faltan datos
                return;
            }

            if (password.isEmpty() || confPassword.isEmpty() || !password.equals(confPassword)) {
                out.println("<p>Error: Las contraseñas no coinciden o están vacías.</p>");
            } else {
                try {
                    Base bd = new Base();
                    bd.conectar();

                    // Llamar al método para actualizar el perfil
                    int filasActualizadas = bd.editaPerfil(idUsr, psw, confPassword);

                    if (filasActualizadas > 0) {
                        response.sendRedirect("index.html"); // Redirigir si la actualización fue exitosa
                    } else {
                        out.println("<p>Error: No se pudo actualizar el perfil. Verifica tu contraseña actual.</p>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace(); // Para depuración en el servidor
                    out.println("<p>Error al actualizar el perfil: " + e.getMessage() + "</p>");
                }
            }
        %>
    </body>
</html>
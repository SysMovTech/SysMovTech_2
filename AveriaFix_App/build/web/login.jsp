<%@page import="conexion.Base"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%

        String user = request.getParameter("user");
        String password = request.getParameter("password");

        if (user == null) {
            user = "0";
        } else {
            if (user.equals("")) {
                user = "0";
            }
        }

        if (password == null) {
            password = "0";
        } else {
            if (password.equals("")) {
                password = "0";
            }
        }

        if (user.equals("0") || password.equals("0")) {
            response.sendRedirect("index.html");
        }

        if (!user.equals("0") && !password.equals("0")) {
            Base bd = new Base();
            int usuario = Integer.parseInt(user);

            bd.conectar();

            if (user.matches("\\d+")) {

                try {
                    ResultSet rsValUser = bd.consultaUser(usuario, password);

                    if (rsValUser.next()) {

                        HttpSession miSesion = (HttpSession) request.getSession();

                        int idUser = rsValUser.getInt("@no_Trabajador");
                        String contrasena = rsValUser.getString("@contrasenia");
                        miSesion.setAttribute("idUsr", idUser);
                        miSesion.setAttribute("psw", contrasena);
                        response.sendRedirect("notificaciones.jsp");
                    }
                    
                } catch (Exception ex) {
                    response.sendRedirect("index.html");
                }
            }
        }
    %>
    <body>
    </body>
</html>

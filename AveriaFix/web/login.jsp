<%-- 
    Document   : login
    Created on : 27 oct. 2024, 19:49:04
    Author     : Admin
--%>

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

            bd.conectar();

            if (user.matches("\\d+")) {

                int usuario = Integer.parseInt(user);
                ResultSet rsValUser = bd.consultaUser(usuario, password);

                if (rsValUser.next()) {

                    HttpSession miSesion = (HttpSession) request.getSession();

                    int idUser = rsValUser.getInt("no_Trabajador");
                    String nombreUsr = rsValUser.getString("nombre");
                    String cont = rsValUser.getString("contrasena");
                    miSesion.setAttribute("idUsr", idUser);
                    miSesion.setAttribute("nombreUsr", nombreUsr);
                    miSesion.setAttribute("psw", cont);
                    response.sendRedirect("perfil.jsp");
                } else {
                    response.sendRedirect("index.html");
                }

            }
        }

    %>
    <body>

    </body>
</html>

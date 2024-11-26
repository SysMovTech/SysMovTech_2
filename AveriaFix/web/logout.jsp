<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@ page import="javax.servlet.http.HttpSession" %>
    <%
        HttpSession miSesion = request.getSession(false);
        if (miSesion == null || miSesion.getAttribute("idUsr") == null) {
            response.sendRedirect("index.html");
            return;
        }

        if (miSesion != null) {
            miSesion.invalidate();
        }

        response.sendRedirect("index.html");
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

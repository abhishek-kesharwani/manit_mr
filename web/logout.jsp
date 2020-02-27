<%-- 
    Document   : logout
    Created on : Feb 27, 2020, 10:49:46 PM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Logout</h1>
        <%
            session.removeAttribute("loggedin");
            out.println("<b>session time expired</b>");
            response.sendRedirect("login2.jsp");
            
        %>
    </body>
</html>

<%-- 
    Document   : removesession
    Created on : Feb 27, 2020, 10:51:57 PM
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
        <h1>Remove Session</h1>
        <%
        session.invalidate();
        session=null;
        response.sendRedirect("reg.jsp");
        %>
    </body>
</html>

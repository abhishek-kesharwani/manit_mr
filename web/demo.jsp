<%-- 
    Document   : demo
    Created on : Feb 18, 2020, 11:54:48 PM
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
        <a href="myservlet">click to open the link</a>
        
        <form action="myservlet" method="get">
            <input type ="submit" value="get request"/>
        </form>
        
        <form action="myservlet" method="post">
            <input type ="submit" value="post request"/>
        </form>
    </body>
</html>

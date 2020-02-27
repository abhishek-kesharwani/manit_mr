<%-- 
    Document   : page1
    Created on : Feb 27, 2020, 9:25:53 PM
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
        <%
            String n1=request.getParameter("n1")!=null?request.getParameter("n1"):"";
              String n2=request.getParameter("n2")!=null?request.getParameter("n2"):"";
        %>
        <form method="post"action="page2.jsp">
            <input type="text" name="n1" value="<%=n1%>" placeholder="n1"/>
             <input type="text" name="n2" value="<%=n2%>" placeholder="n2"/>
             <input type="submit" value="next"/>
        </form>
    </body>
</html>

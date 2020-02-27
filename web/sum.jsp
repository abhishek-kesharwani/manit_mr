<%-- 
    Document   : sum.jsp
    Created on : Feb 27, 2020, 7:38:14 AM
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
        int a=request.getParameter("n1")!=null?Integer.parseInt(request.getParameter("n1")):0;
        int b=request.getParameter("n2")!=null?Integer.parseInt(request.getParameter("n2")):0;
        int c= a+b;
        %>
        <form method="post">
            Enter first No :<input type="text" name="n1" value="<%=a%>" /><br/>
            Enter second no :<input type="text" name="n2" value="<%=b%>" /><br/>
            
            <input type="submit" name="submit"/>
        </form>
            
            <%if(request.getParameter("submit")!=null) {%>
            first no = <%=a%>
            Second no =<%=b%>
            sum= <%=c%>
            <%}%>
    </body>
</html>

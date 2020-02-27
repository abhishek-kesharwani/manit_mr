<%-- 
    Document   : result
    Created on : Feb 27, 2020, 9:34:57 PM
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
        String n1,n2,n3,n4;
        n1=request.getParameter("n1");
        n2=request.getParameter("n2");
        n3=request.getParameter("n3");
        n4=request.getParameter("n4");
        %>
        <a href="page2.jsp?n1=<%=n1%>&n2=<%=n2%>&n3=<%=n3%>&n4=<%=n4%>">Back</a>
        n1=<%=n1%> <br/>
          n2=<%=n2%> <br/>
            n3=<%=n3%> <br/>
              n4=<%=n4%> <br/>
    </body>
</html>

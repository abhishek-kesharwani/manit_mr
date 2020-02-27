<%-- 
    Document   : page2
    Created on : Feb 27, 2020, 9:30:58 PM
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
               String n3=request.getParameter("n3")!=null?request.getParameter("n3"):"";
                String n4=request.getParameter("n4")!=null?request.getParameter("n4"):"";
        %>
        <form method="post"action="result.jsp">
            <input type="hidden" name="n1" value="<%=n1%>" />
            <input type="hidden" name="n2" value="<%=n2%>"/>
            <input type="text" name="n3" value="<%=n3%>" placeholder="n1"/>
             <input type="text" name="n4" value="<%=n4%>" placeholder="n2"/>
             <a href="page1.jsp?n1=<%=n1%>&n2=<%=n2%>">Back</a> <input type="submit" value="next"/>
        </form>
    </body>
</html>

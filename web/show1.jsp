<%-- 
    Document   : show1
    Created on : Feb 27, 2020, 10:29:17 PM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"import="com.first.person"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Person details are</h1>
        <jsp:useBean class="com.first.person" id="person" scope="session"></jsp:useBean>
        <%
            
           // person person=(person)session.getAttribute("person");
            String islogin=(String)session.getAttribute("loggedin");
            if(person==null)
            {
                out.println("<b>please make registration</b>");
                response.sendRedirect("reg.jsp");
                return;
            }
            if(islogin==null|| !islogin.equals("yes"))
            {
                response.sendRedirect("login2.jsp");
                return;
            }
            
            
        %>
        <h3>name=<%=person.getName()%></h3>
        
         <jsp:getProperty name="person" property="name"></jsp:getProperty> <br/>
        <h3>Age=<%=person.getAge()%></h3>
    </body>
</html>

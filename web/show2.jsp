<%-- 
    Document   : show2
    Created on : Feb 27, 2020, 10:37:03 PM
    Author     : abhishek
--%>

<%@page import="com.first.person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Contact Details are: </h1>
         <%
            person  person = (person)session.getAttribute("person");
            String islogin = (String) session.getAttribute("loggedin");
            if (person==null){
                response.sendRedirect("reg.jsp");
                return;
            }
            if (islogin==null ||  !islogin.equals("yes"))
            {
                response.sendRedirect("login2.jsp");
                return;
            }
           
            %>
            
            <h2>contact no.: <%=person.getContact()%> <br/>
            Address : <%= person.getAddress() %> </h2>
    </body>
</html>

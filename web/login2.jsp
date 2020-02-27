<%-- 
    Document   : login2
    Created on : Feb 27, 2020, 9:54:27 PM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import ="com.first.person"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form method="post">
            <input type="text" name="userid" placeholder="Enter userid"/><br/>
            <input type="password" name="password" placeholder="Enter password"/>
            <br/>
            <input type="submit" value="login" name="submit"/>
            
        </form>
        
        <%
            if(request.getParameter("submit")!=null){
            String userid=request.getParameter("userid");
            String password= request.getParameter("password");
            
            person person =(person)session.getAttribute("person");
            if(person==null){
                out.println("<b>No User Found in Session <br/> Plase Make Registration <br/>");
                return;
            }
            if(userid.equals(person.getUserid()) && password.equals(person.getPassword()))
            {
                response.sendRedirect("welcome.jsp");
                session.setAttribute("loggedin", "yes");
            }
            else
              out.println("<script>alert('sorry invalid userid or password');</script>");
               
            }
            %>
    </body>
</html>

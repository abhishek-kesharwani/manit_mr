<%-- 
    Document   : userhome
    Created on : Feb 27, 2020, 10:55:17 PM
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
    <center>
        <h1>User Registration Page using Session</h1>
        <table width="100%">
            <tr>
                <td><a href="reg.jsp" target="f" >Register</a></td><hr>
                 <td><a href="login2.jsp" target="f" >Login</a></td>
                  <td><a href="show1.jsp" target="f" >Person Details</a></td>
                   <td><a href="show2.jsp" target="f" >Person Contacts</a></td>
                    <td><a href="logout.jsp" target="f" >LogOut</a></td>
                     <td><a href="removesession.jsp" target="f" >Remove Session</a></td>
            </tr>
        </table>
        <iframe width="100%" name="f" height="400" style="border: 1px; border-collapse: collapse; border-width: 0px; border-style: none"></iframe>
   </center>
    </body>

</html>

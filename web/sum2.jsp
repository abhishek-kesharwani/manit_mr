<%-- 
    Document   : sum2
    Created on : Mar 1, 2020, 9:58:28 PM
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
        <form method="post">
            Enter first no : <input type="text" name="n1" value="${param.n1}"/><br/>
            Enter Second No :<input type="text" name="n2" value="${param.n2}"/><br/>
            <input type="submit" name="submit" value="go"/>
        </form>
        <%  
            if(request.getParameter("submit")!=null)
            {%>
                
                value of a :${param.n1}<br/>
                value of b :${param.n2}<br/>
                
                sum : ${param.n1 + param.n2}
            <%}
        %>    
    </body>
</html>

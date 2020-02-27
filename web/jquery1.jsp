<%-- 
    Document   : jquery1.jsp
    Created on : Feb 24, 2020, 8:21:48 AM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
        <script type="text/javascript">
            $(document).ready(function(){
                //alert("hello");
                $("button").click(function(){
                   $("#div1").slideToggle(3000);
                });
            });
            
            </script>
    </head>
    <body>
        <button id="b1" >click</button>
        <button id="b2" >push</button>
        
        <div id="div1" style="height:300px ;background-color:orange;"></div>
    </body>
</html>

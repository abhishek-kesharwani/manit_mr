<%-- 
    Document   : ajax
    Created on : Feb 23, 2020, 6:04:12 AM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
             function showtable(x,y){
                y.innerHTML="";
                ajax = new XMLHttpRequest();
                ajax.open("GET","ajaxservlet?op=table&n="+x, true);
                ajax.send();
                
                ajax.onreadystatechange = function(){
                  if(this.readyState ==4 && this.status==200){
                      y.innerHTML = this.responseText;
                  }  
                };
         }
         
         function showSqr(x,y){
             y.innerHTML="";
                ajx = new XMLHttpRequest();
                ajx.open("GET","ajaxservlet?op=sqr&n="+x, true);
                ajx.send();
                
                ajx.onreadystatechange = function(){
                  if(this.readyState ==4 && this.status==200){
                      y.innerHTML = this.responseText;
                  }  
                };
         }
            </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="ajaxservlet" >
            Enter a number to get Table: <input type="text" name="n" onblur="showtable(this.value,p1)"/><br/>
            Enter a number to get square :<input type="text" name="m" onblur="showSqr(this.value,p1)"/><br/>
            <p id="p1"></p>
        </form>
    </body>
</html>

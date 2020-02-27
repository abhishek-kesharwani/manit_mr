<%-- 
    Document   : index
    Created on : Feb 18, 2020, 8:30:36 AM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <h1>Hello World!</h1>
        
        <hr/>
        <h1>this is my first jsp page<h1/>
        <%
            //scriptlet
            int a=20;
            System.out.println("a="+ a);
            
            out.println(a);
            %>
            
            <b> value of a =<%=a%>    
                
        <table width="300" border="2">
            <% for(int i=1;i<5;i++)
            {
                out.println("<tr><td>hello</td><tr/>");
            }
            %>
            <br/>
            <br/>
        </table>
            <table width="300" border="1">
                <%for(int i=0;i<5;i++){%>
                <tr>
                    <td>number</td>
                    <td>
                        square</td>
                </tr>
                <tr>
                    <td><%=i%></td>
                    <td><%=i*i%></td>
                            </tr>
                <% } %>
            </table>
            
         <%-- 
            multiline comment
        --%>
        
        <%--
        <%= >   expression
        <%! %> jsp declaration
        --%>
    
</html>

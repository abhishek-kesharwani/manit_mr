<%-- 
    Document   : reg
    Created on : Feb 27, 2020, 9:45:53 PM
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
        <form method="post">
             <input type="text" name="name" placeholder="enter name"/><br/>
            <input type="number" name="age" placeholder="enter age"/><br/>
            <input type="text" name="userid" placeholder="Enter userid"/><br/>
            <input type="password" name="password" placeholder="enter password"/><br/>
            <input type="text" name="contact" placeholder="enter contact no"/><br/>
            <input type="text" name="address" placeholder="Enter address"/><br/>
            <input type="submit" value="Register" name="submit"/> 
        </form>
        
        <%if(request.getParameter("submit")!=null){%>
        <jsp:useBean class="com.first.person" id="person" scope="session"></jsp:useBean>
        <jsp:setProperty name="person" property="*" ></jsp:setProperty>
        <%   
         response.sendRedirect("login2.jsp"); }
             %>
        <%--
        <jsp:setProperty name="person" property="name" value="${param.name}"></jsp:setProperty> 
        <jsp:setProperty name="person" property="age" value="${param.age}"></jsp:setProperty>
        <jsp:setProperty name="person" property="contact" value="${param.contact}"></jsp:setProperty>
        <jsp:setProperty name="person" property="address" value="${param.address}"></jsp:setProperty>
        <jsp:setProperty name="person" property="userid" value="${param.userid}"></jsp:setProperty>
        <jsp:setProperty name="person" property="password" value="${param.password}"></jsp:setProperty>
          <%response.sendRedirect("login2.jsp");}%>   
        <%--
        <% if(request.getParameter("submit")!=null){
            person person = new person();
            person.setName(request.getParameter("name"));
            person.setAge(Integer.parseInt(request.getParameter("age")));
            person.setContact(request.getParameter("contact"));
            person.setAddress(request.getParameter("address"));
            person.setUserid(request.getParameter("userid"));
            person.setPassword(request.getParameter("password"));
            
            session.setAttribute("person", person); 
            response.sendRedirect("login2.jsp");
        }
            
            %>
        --%>
         
    </body>
</html>

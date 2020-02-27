<%-- 
    Document   : citystate
    Created on : Feb 23, 2020, 9:20:37 PM
    Author     : abhishek
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
        <script>
           <%-- function loadcity(x,y)
            {
                y.innerHTML="";
                ajax=new XMLHttpRequest();
                ajax.open("GET","ajaxservlet?op=loadcity&state_id="+x,true);
                ajax.send();
                
                ajax.onreadystatechange=function()
                {
                    if(this.readyState==4&&this.status==200)
                        y.innerHTML=this.responseText;
                };
               
            } --%>
                $(document).ready(function(){
                    $("#state").change(function(){
                        $("#city").load("ajaxservlet?op=loadcity&state_id="+$(this).val());
                    });
                });
            </script>
    </head>
    <body>
        <h1></h1>
        <div class="container">
            <div class="row">
                <div class="col col-md-6">
                    <select id="state" class="dropdown-header bg-light">
                        <option value="-1" >select state</option>
                        <%
                            Connection con=null;
                            PreparedStatement smt=null;
                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining", "root", "123456");
                                String sql="select * from state";
                                smt=con.prepareStatement(sql);
                                ResultSet rs=smt.executeQuery();
                               while (rs.next()) { %>
                                <option value="<%= rs.getInt("id")%>"> <%= rs.getString("state")%> </option> 
                                <% } 
                                smt.close();
                                 con.close();
                                 
                            }
                                catch(Exception e)
                            {
                                System.out.println("Error :" +e.getMessage());
                            }
                            %>
                      <br/>
                    </select>
                      <select id="city" class="dropdown-header bg-light">
                          <option value="-1">select city</option>
                      </select> 
                    
                </div>
                     
            </div>
            
        </div>
    </body>
</html>

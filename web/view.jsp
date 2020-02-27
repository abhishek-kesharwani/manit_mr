<%-- 
    Document   : view
    Created on : Feb 20, 2020, 7:46:24 AM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <jsp:include page="base.jsp"></jsp:include>
    <script type="text/javascript"> 
            function confirmation(){
               if(confirm("Do you Really want to Remove this record ??"))
               {
                   return true;
               }
               else{
                   return false;
               }
            }
     </script>       
    </head>
    <body>
        <div class="container-fluid " >
            <div class="row">
                <div class="col col-md-12">
    <center>
        <h1>list of users</h1>
        
        <table class="table table-hover">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>Father'name</th>
                <th>Userid</th>
                <th> DOB</th>
                <th>GENDER</th>
                <th>HOBBIES</th>
                <th>PHOTO</th>
                <th>Update</th>
            </tr>
            <%
                Connection con=null;
                PreparedStatement smt=null;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining","root","123456");
                String sql = "select * from user";
                smt = con.prepareStatement(sql);
                ResultSet rs=smt.executeQuery();
                while(rs.next()){%>
                <tr>
                    <td><%= rs.getString("id")%></td>
                    <td><%= rs.getString("name")%></td>
                    <td><%= rs.getString("fname")%></td>
                    <td><%= rs.getString("userid")%></td>
                    <td><%= rs.getString("dob")%></td>
                    <td><%= rs.getString("gender")%></td>
                    <td><%= rs.getString("hobbies")%></td>
                    <td><img src="<%= rs.getString("photo")%>" style="width:64px; height: 64px;" class="img img-thumbnail"/></td>
                    <td><a class="btn btn-success"href="edit.jsp?id=<%=rs.getString("id")%>"><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a> || <a class="btn btn-danger" href="UserController?op=delete&id=<%=rs.getString("id")%>" onclick="return confirmation()"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
                    
                </tr>
                
                <%}
                smt.close();
                con.close();
                
                }
                catch(Exception e){
            System.out.println("Error : + "+ e.getMessage());
                }
            
             %> 
        </table>
        <br/>
        
        <a href="register.jsp" class="btn btn-primary" ><i class="fa fa-plus" aria-hidden="true"></i>Add more record
        
        </a>  
    </center>
                </div>
            </div>
        </div>
    </body>
</html>

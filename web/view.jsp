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
        <%
        int start=1,end=3,total=0;
        %>
        <div class="container-fluid " >
            <div class="row">
                <div class="col col-md-12">
    <center>
        <h1>list of users</h1>
        <br/>
        <br/>
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
                if(request.getParameter("start")!=null)
                    start=Integer.parseInt(request.getParameter("start"));
                
                
                Connection con=null;
                PreparedStatement smt=null;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining","root","123456");
                   String sql="select count(*) from user";
                   smt = con.prepareStatement(sql);
                   ResultSet rs=smt.executeQuery();
                   if(rs.next())
                       total=rs.getInt(1);
                 
                   sql = "select * from user limit ?,?";
                    smt = con.prepareStatement(sql);
                    smt.setInt(1, start);
                    smt.setInt(2,end);
                     rs=smt.executeQuery();
                     
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
                    <td><a class="btn btn-success"href="edit2.jsp?id=<%=rs.getString("id")%>"><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a> || <a class="btn btn-danger" href="UserController?op=delete&id=<%=rs.getString("id")%>" onclick="return confirmation()"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
                    
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
        <span>
            <center>
                <a href="view.jsp?start=<%=start-end%>" class="btn btn-primary <%if(start==0) out.println("disabled");%>" style="float:left"> << Previous</a>
                <a href="view.jsp?start=<%=start+end%>" class="btn btn-primary <% if(total-start<=end) out.println("disabled");%>" style="float:right">Next>></a>
                <% for(int i=0;total%end==0?i<total/end:i<=total/end;i++){%>
                 <a href="view.jsp?start=<%=(i)*end%>" class="btn btn-success <%if(i==Math.floor(start/end))out.println(" btn-dark");%>">Page<%=i+1%></a>
                 <%}%>
            </center>
        </span>
        <br/>
        <br/>
        <br/>
        <a href="register.jsp" class="btn btn-primary" ><i class="fa fa-plus" aria-hidden="true"></i>Add more record
        
        </a>  
    </center>
                </div>
            </div>
        </div>
    </body>
</html>

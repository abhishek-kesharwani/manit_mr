<%-- 
    Document   : edit3
    Created on : Mar 3, 2020, 12:40:11 AM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
         <script>
             function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                   pic.src= e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
            </script>
             <style>
                img{
                max-width:180px;
                 }
                input[type=file]{
                padding:10px;
                background:#2d2d2d;}
            </style>
    </head>
    <body>
         <%
           int id = Integer.parseInt(request.getParameter("id"));
            Connection con=null;
            PreparedStatement smt=null;
            try{
                 Class.forName("com.mysql.jdbc.Driver");
                 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining","root","123456");
                String sql="select * from user where id=?";
                smt=con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs=smt.executeQuery();
                if(rs.next()){%>
             <form action="#" method="get" enctype="multipart/form-data"> 
                 <center>
                     <br/>
                     <br/>
                       <img src="<%=rs.getString("photo")%>" class="img img-thumbnail" style="height:170px; width:170px" id="pic"/><br/>
                    Change profile Image <br/><input type="file" name="photo" onchange="readURL(this)"/>
                            <input type="submit" value="Update"/>
                 </center>
               </form>
          <%}
           smt.close();
           con.close();
        }
            catch(Exception e)
            {
                System.out.println("Error :"+e.getMessage());
            }
   
     %>
    </body>
</html>

<%-- 
    Document   : edit2
    Created on : Mar 3, 2020, 12:26:53 AM
    Author     : abhishek
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
       
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
                <form action="edit3.jsp?id=<%=rs.getString("id")%>" method="post" > 
             <center>
              <h1>update user's data </h1>
                 <table width="800" border="2" class="bg-light"> 
               <tr>
                <td>Your Name </td>
                <td><input type="text" name="name" required="required" autocomplete="off" value="<%=rs.getString("name")%>"/> </td>
               
            </tr> <tr>
                <td>Enter your Father's Name </td>
                <td><input type="text" name="fname" required="required" value="<%=rs.getString("fname")%>"/> </td>
            </tr>
             <tr>
                <td>Enter your DOB </td>
                <td><input type="date" name="dob" value="<%=rs.getString("dob")%>"/> </td>
            </tr>
             <tr>
                <td>Select Your Gender </td>
                <td> <input type="radio" name="gender" value="Male" <%if (rs.getString("gender").equalsIgnoreCase("Male")) out.println("checked='checked'");%>/> Male<br/>
                    <input type="radio" name="gender" value="Female"<%if(rs.getString("gender").equalsIgnoreCase("Female"))out.println("checked='checked'"); %>/>Female<br/>
                </td>
            </tr> 
                <td>Select Your Hobbies </td>
                <td>
                    <input type="checkbox" name="hobbies" value="Dancing" <%if (rs.getString("hobbies").contains("Dancing")) out.println("checked='checked'");%>/>Dancing
                     <input type="checkbox" name="hobbies" value="Singing"<%if (rs.getString("hobbies").contains("Singing")) out.println("checked='checked'");%>/>Singing <br/>
                    <input type="checkbox" name="hobbies" value="Cooking"<%if (rs.getString("hobbies").contains("Cooking")) out.println("checked='checked'");%>/>Cooking
                    <input type="checkbox" name="hobbies" value="Drawing" <%if (rs.getString("hobbies").contains("Drawing")) out.println("checked='checked'");%>/>Drawing
                 </td>
            </tr>
            
            <tr>
                 
                <th colspan="2" >
                    <input type="reset" value="Clear" />
                    <input type="submit" value="save and next"/> 
                </th>
            </tr>
            
         </table>
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

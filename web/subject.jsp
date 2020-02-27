<%-- 
    Document   : subject
    Created on : Feb 24, 2020, 7:25:34 AM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col col-md-6">
                    <form method="post" action="SubjectController?op=add">
                        Enter Subject :
                        <input type="text" name="subject" class="form-control"/>
                        <br/>
                        <h3>
                            Select courses</h3>
                        <%
                           Connection con=null;
                           PreparedStatement smt=null;
                           try{
                               Class.forName("com.mysql.jdbc.Driver");
                               con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining","root","123456");
                               String sql="select * from course";
                               smt=con.prepareStatement(sql);
                               ResultSet rs=smt.executeQuery();
                               while(rs.next())
                               {%>
                               <input type="checkbox" name="courseids" value="<%=rs.getString("id")%>"/><%=rs.getString("name")%><br/>
                               <%}
                                smt.close();
                                con.close();
                           }catch(Exception e)
                           {
                               System.out.println("Error : "+e.getMessage());
                           }
                        %>
                         <br/>
                        <input type="submit" value="save"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

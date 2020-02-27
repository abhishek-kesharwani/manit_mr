<%-- 
    Document   : subjectcourse
    Created on : Feb 24, 2020, 10:05:46 PM
    Author     : abhishek
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
        <script>
            $(document).ready(function(){
                
                $("#subject").change(function(){
                    $("#table1").load("ajaxservlet?op=loadcourse&sub_id="+$(this).val());
                });
            });
            </script>
    </head>
    <body>
    <center>  <h3>List of courses and subjects</h3></center>
        <div class="container">
            <div class="row">
                <div class="col col-md-6 text-center mt-5 ml-4">
                    <form class="form" >
                        
                        <center>
                            
                        <select id="subject" class="dropdown-header bg-light">
                            <option value="-1">select subject</option>
                            <%
                                Connection con=null;
                                PreparedStatement smt=null;
                                try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining","root","123456");
                                    String sql="select * from subject";
                                    smt=con.prepareStatement(sql);
                                    ResultSet rs=smt.executeQuery();
                                    while(rs.next())
                                    {%>
                                    <option value="<%=rs.getString("id")%>"><%=rs.getString("name")%></option>
                                    <%}
                                    smt.close();
                                    con.close();
                                }catch(Exception e)
                                {
                                    System.out.println("Error : "+e.getMessage());
                                }
                                
                                
                            %>
                        </select>
                        </center>
                        <br/>
                        <table class="table bg-info text-center text-light" id="table1">
                            <tr>
                                <td>list of courses </td>
                            </tr>
                        </table>
                    </form>
                </div>
        </div>
        </div>
    </body>
</html>

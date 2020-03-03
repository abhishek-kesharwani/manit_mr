<%-- 
    Document   : edit.jsp
    Created on : Feb 20, 2020, 10:46:11 PM
    Author     : abhishek
--%>

<%@page import="com.daos.UserDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import ="java.sql.*"%>
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
                    img1.src= e.target.result;
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
    <jsp:useBean class="com.beans.User" id = "user" scope="session"></jsp:useBean>
        <div class="container">
             <div class="row">
                 <div style="position: fixed; bottom: 0px">
                     <% if (request.getParameter("submit")!=null){%>
                     <jsp:setProperty name="user" property="*"></jsp:setProperty>
                     <%
                         String hobbies[] = request.getParameterValues("hobbies");
                         String hbs="";
                         for (String s : hobbies)
                            hbs += s +",";
                         
                         user.setHobbies(hbs);
                         
                         %>
                     
                     
                     <form action="UserController?op=update&id=${user.id}" method="post" enctype="multipart/form-data">
                     <img src="${user.photo}" id="img1" class="img img-thumbnail" style="width:200px; height: 200px"/> <br/>
                     Change Profile Image<input type="file" name="photo" id="photo" onchange="readURL(this);" />
                     <br/>
                     <input type="submit" value=" Update in Record"/>
                     </form>
                     <%}%>
                 </div>             
             </div>
            
            
            
            <div class="row">
                <div class="col">
                     <%
         int id =request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):-1;
         UserDao ud = new UserDao();
         if(user!=null && user.getId()!=id){
         user  = ud.getById(id);
         session.setAttribute("user", user);
         }
        %> 
         
    
   <form method="post" class="form"> 
    <center>
        <h2> Update User's Data </h2>
        <table class="table bg-info"> 
            <tr>
                <td>Name </td>
                <td><input type="text" name="name" required="required" autocomplete="off" value="${user.name}"/> </td>
               
            </tr> <tr>
                <td>Father's Name </td>
                <td><input type="text" name="fname" required="required" value="${user.fname}"/> </td>
            </tr>
             <tr>
                <td>your DOB  </td>
                <td><input type="date" name="dob" value="${user.dob}" /> </td>
            </tr>
             <tr>
                <td>Your Gender </td>
                <td> <input type="radio" name="gender"  value="Male"  ${user.gender eq "Male"?  " checked":""}/> Male<br/>
                    <input type="radio" name="gender" value="Female" ${user.gender eq "Female"?  " checked":""} />Female<br/>
                </td>
            </tr> 
                <td>Selected Hobbies : </td>
                <td>
                    <input type="checkbox" name="hobbies" value="Dancing"  ${user.hobbies.contains("Dancing")? " checked" :""} />Dancing
                     <input type="checkbox" name="hobbies" value="Singing" ${user.hobbies.contains("Singing")? " checked" :""}/>Singing <br/>
                    <input type="checkbox" name="hobbies" value="Cooking" ${user.hobbies.contains("Cooking")? " checked" :""}/>Cooking
                    <input type="checkbox" name="hobbies" value="Drawing" ${user.hobbies.contains("Drawing")? " checked" :""}  />Drawing
                 </td>
            </tr>
            
            <tr>
                 
                <th colspan="2">
                    <input type="reset" value="Clear" />
                    <input type="submit" name="submit" value="Save and Next "/> 
                </th>
            </tr>
            
         </table>
    </center>
        </form>
    
    </div>
            </div>
                 
                
                 
        </div>
       
    </body>
</html>
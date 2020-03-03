<%-- 
    Document   : reg2
    Created on : Mar 2, 2020, 9:56:35 PM
    Author     : abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
    <%if(request.getParameter("submit")==null){%>
    <h4>please fill registration page-1</h4><br/>
    <br/>
    <a href="reg1.jsp">Go to Registration part-1</a>
    <% return;}%>
    
    <div class="container">
            <div class="row">
                <div class="col col-md-6">
                    <jsp:useBean class="com.beans.User" id="user" scope="session"></jsp:useBean>
                    <jsp:setProperty name="user" property="*"></jsp:setProperty>
                    <%
                        String hobbies[] = request.getParameterValues("hobbies");
                        String hbs ="";
                        for(String s : hobbies)
                        hbs += s +",";
                        user.setHobbies(hbs);
                        %>
                    <form enctype="multipart/form-data" action="UserController?op=add" method="post">
                        <p>Select Your Profile Image <p>
                        <p>
                            <img src="assets/images/nophoto.png" style="width:200px;height: 200px" class="img" id="pic"/><br/>
                            <input type="file" name="photo" id="photoInput" class="form-control"  onchange="readURL(this);" />
                        <p>
                            <input type="submit" value="Register Me"/>
                    </form>
                </div>
            </div>
        </div>
    
    </body>
</html>

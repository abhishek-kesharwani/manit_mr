 
package com.first;

import com.beans.User;
import com.daos.UserDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import  java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import org.apache.commons.lang.StringEscapeUtils;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 
public class UserController extends HttpServlet {

    
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
       String op=request.getParameter("op");
       
       System.out.println(op);
       
        if (op!=null && op.equalsIgnoreCase("delete")){
            
            int id = Integer.parseInt(request.getParameter("id"));
            
          UserDao ud=new UserDao();
          if(ud.remove(id))
              response.sendRedirect("view.jsp");
              }
                    
    }

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op=request.getParameter("op");
        
       if (op != null && op.equals("add")) {

            //check the enctype of the incomming request -
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
              
               String encodedPassword="";
               String photo="",imagePath="";
              HttpSession session = request.getSession();
              User user=(User)session.getAttribute("user");
              
                if (isMultipart) {
                 FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    e.getMessage();
                }

                Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (!item.isFormField()) {
                      try {
                            photo = item.getName();
                            imagePath = "assets/media/user/" + photo ;
                            File savedFile = new File(getServletContext().getRealPath("/") + imagePath);
                            item.write(savedFile);
                            user.setPhoto(imagePath);
                        } catch (Exception e) {
                            out.println("Error  " + e.getMessage());
                        }
                    }
                }
            }
             //JDBC Code 
                encodedPassword = Base64.getEncoder().encodeToString(user.getPassword().getBytes("UTF-8"));
                user.setPassword(encodedPassword);
                UserDao ud=new UserDao();
               if(ud.add(user))
               {
                   session.removeAttribute("user");
                   response.sendRedirect("view.jsp");
               }
        }
        
        
        
         if(op!=null && op.equalsIgnoreCase("update"))
        {
        //check the enctype of the incomming request -
            //System.out.println("helo");
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
               String name ="";
               String fname="";
               String dob="";
               String gender ="";
               String hobbies[]=null;
               String photo="";
               String imagePath="";
               String hbs="";
               String prevPic=request.getParameter("pic");
                int id=Integer.parseInt(request.getParameter("id"));
                int flag=0;
               List<String> checkboxlist = new ArrayList();
               
            if (!isMultipart) {
                 name = StringEscapeUtils.escapeHtml(request.getParameter("name"));
                  fname = StringEscapeUtils.escapeHtml(request.getParameter("fname"));
                  dob = request.getParameter("dob");
                  gender = request.getParameter("gender");
                 
                  hobbies = request.getParameterValues("hobbies");
                  photo = request.getParameter("photo");
                  hbs = "";
                //Rending the Information that has been received ..
                //  out.println("Name : "+ name +"<br/> Fname " + fname + "<br/>"
                //          + "dob : " + dob + "<br/>gender : " + gender +"<br/>Hobbies : <br/>");

                for (String h : hobbies) {
                    hbs += h + ",";
                } 
                
            }
             else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    e.getMessage();
                }

                Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        if (fieldName.equals("name"))  
                            name = fieldValue;
                        else if (fieldName.equals("fname"))  
                            fname = fieldValue;
                         else if (fieldName.equals("dob"))  
                            dob = fieldValue;
                       
                        
                        else if(fieldName.equals("gender"))
                            gender=fieldValue;
                        else if (fieldName.equals("hobbies"))
                            checkboxlist.add(fieldValue);
                        
                    } else {
                        try {
                            photo = item.getName();
                            if(item.getName().isEmpty())
                            {
                                flag=0;
                            }else{
                                flag=1;
                            imagePath = "assets/media/user/" + photo ;
                            File savedFile = new File(getServletContext().getRealPath("/") + imagePath);
                            item.write(savedFile);
                            }
                        } catch (Exception e) {
                            out.println("Error  " + e.getMessage());
                        }
                    }
                    
                    hbs="";
                    for(String s : checkboxlist)
                        hbs += s +",";
                }
            }

                //=============================================//
               

                //JDBC Code 
                Connection con = null;
                PreparedStatement smt = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining", "root", "123456");
                    String sql = "update user set name=?,fname=?,dob=?,gender=?,hobbies=? ,photo=? where id=?";
                    smt = con.prepareStatement(sql);
                    smt.setString(1, name);
                    smt.setString(2, fname);
                    smt.setString(3, dob);
                    smt.setString(4, gender);
                    smt.setString(5, hbs);
                    
                    smt.setInt(7,id);
                    if(flag==0)
                    {
                        smt.setString(6, prevPic);
                    }
                    else
                    {
                        smt.setString(6,imagePath);
                    }
                    
                    
                    //execute the command : executeUpdate()-for insert,update and delete or executeQuery()-for select

                    int n = smt.executeUpdate();

                    smt.close();
                    con.close();
                    if (n > 0) //out.println("Data Inserted to table ...");
                    {
                        response.sendRedirect("view.jsp");
                    }

                } catch (Exception e) {
                    System.out.println("Error : + " + e.getMessage());
                    response.sendRedirect("");
                }
        }
    }
}

     

 
package com.first;

import com.beans.User;
import com.daos.UserDao;
import com.utilities.FileUploader;
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
import javax.servlet.ServletContext;
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
               String imagePath="";
              HttpSession session = request.getSession();
              User user=(User)session.getAttribute("user");
              
                if (isMultipart) {
                imagePath=FileUploader.getUploadedPath(getServletContext(),"assets/media/user" ,request);
                 }
                 user.setPhoto(imagePath);
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
            int id=Integer.parseInt(request.getParameter("id"));
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            String imagePath="";
            if (isMultipart) {
               imagePath=FileUploader.getUploadedPath(getServletContext(),"assets/media/user" , request);
            }
                //=============================================//
              HttpSession session= request.getSession();
              UserDao ud=new UserDao();
              User user=(User)session.getAttribute("user");
              if(!imagePath.equals(""))
                  user.setPhoto(imagePath);
              if(ud.update(user));
              {
                  session.removeAttribute("user");
                  response.sendRedirect("view.jsp");
              }
                //JDBC Code 
               
        }
    }
}

     

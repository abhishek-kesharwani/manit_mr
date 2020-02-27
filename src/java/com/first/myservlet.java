/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.first;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author abhishek
 */
public class myservlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String op=request.getParameter("op");
        if(op!=null && op.equalsIgnoreCase("verify"))
        {
            
            String userid=request.getParameter("userid");
            if(userid==null || userid.equals("")){
                out.print("<b> Plese fillout the userid</b>");
                return;
            }
           // System.out.println("11111111111");
            Connection con =null;
            PreparedStatement smt=null;
           try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining","root","123456");
            String sql = "select * from user where userid=?";
            smt = con.prepareStatement(sql);
            smt.setString(1, userid);
            
            ResultSet rs = smt.executeQuery();
            if(rs.next()){
                out.println("<font color='red' size='4' face='corbel'>Sorry! this userid is not available</font>");
            }
            else{
                out.println("<font color='blue' size='4' face='corbel'> Congrats! this userid is available!</font>");
            }
            smt.close();
            con.close();
             
            
        }catch(Exception e){
            System.out.println("Error : + "+ e.getMessage());
        
        } 
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
        PrintWriter out=response.getWriter();
    }

}

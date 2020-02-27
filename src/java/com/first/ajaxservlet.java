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
import java.sql.*;

public class ajaxservlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op = request.getParameter("op");
        if (op != null && op.equalsIgnoreCase("table")) {
            int n = Integer.parseInt(request.getParameter("n"));
            for (int i = 1; i <= 10; i++) {
                out.println("<br/>" + (n * i));
            }
        }

        if (op != null && op.equalsIgnoreCase("sqr")) {
            int n = Integer.parseInt(request.getParameter("n"));
            out.println("<br/> " + n * n);

        }

        if (op != null && op.equalsIgnoreCase("loadcity")) {

            int cid = Integer.parseInt(request.getParameter("state_id"));

            Connection con = null;
            PreparedStatement smt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining", "root", "123456");
                String sql = "select * from city where id=?";
                smt = con.prepareStatement(sql);
                smt.setInt(1, cid);

                ResultSet rs = smt.executeQuery();
                out.print("<option value='-1'>Select City </option>");
                while (rs.next()) {
                    out.print("<option value=" + rs.getString("cid") + ">" + rs.getString("city") + "</option>");
                }

                con.close();
                smt.close();

            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }
        }
        
        
        
        
        
        if(op!=null&&op.equalsIgnoreCase("loadcourse")){
             int sid=Integer.parseInt(request.getParameter("sub_id"));
        Connection con=null;
        PreparedStatement smt=null;
        
         
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining", "root", "123456");
            String sql="select * from course where id in (select course_id from scr where subject_id=?)";
            smt=con.prepareStatement(sql);
            smt.setInt(1, sid);
           // ResultSet rs = smt.executeQuery();
            
            ResultSet rs = smt.executeQuery();
            String table="<tr class=\"table bg-info text-center text-light \"><td>Courses</td></tr>";
             
            while(rs.next())
            {
                table+="<tr><td>"+ rs.getString("name")+"</td></tr>";             
            }
            out.println(table);
            smt.close();
            con.close();
        }catch(Exception e)
        {
            System.out.println("Error : "+e.getMessage());
        }
    }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        
        String op=request.getParameter("op");
         
       
    }
}

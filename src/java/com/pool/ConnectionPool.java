
package com.pool;
import java.sql.*;
import java.util.*;

public class ConnectionPool {
    static final int Max_connection=30;
    static Vector Connections=null;
    static ConnectionPool instance =null;
    
    public synchronized void initialize()
    {
        if(Connections==null)
        {
            try{
                String username="root",password="123456";
                String url="jdbc:mysql://localhost:3306/gisttraining";
                Class.forName("com.mysql.jdbc.Driver");
                
                Connections =new Vector();
                int count=0;
                while(count<Max_connection)
                {
                    Connection c=DriverManager.getConnection(url,username,password);
                    Connections.addElement(c);
                    count++;
                }
            }catch(Exception e){
                System.out.println("Error :"+ e.getMessage());
            }
        }
    }
    public synchronized Connection getConnection()
    {
        Connection c=null;
        if(Connections==null)
            return null;
        if(Connections.size()>0)
        {
            c= (Connection)Connections.elementAt(0);
            Connections.removeElement(c);
        }
        return c;
    }
    public synchronized void putConnection(Connection c)
    {
        Connections.addElement(c);
        notifyAll();
    }
    public static synchronized ConnectionPool getInstance()
    {
        if(instance==null)
            instance= new ConnectionPool();
        return instance;
    }
    public static synchronized void removeAllConnections()
    {
        try{
            if(Connections==null)
                return ;
            for(int i=0;i<Connections.size();i++)
            {
                Connection c=(Connection)Connections.elementAt(i);
                c.close();
            }
            Connections.removeAllElements();
            Connections=null;
        }catch(SQLException e){
            System.out.println("Error : "+e.getMessage());
        }
    }
}

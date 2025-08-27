package com.MyDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnector 
{
    public static String url = "jdbc:mysql://localhost:3306/XenzKart?useSSL = False";
    public static String user = "root";
    public static String password = "sandeep";
    
    public static Connection connect()
    {
        Connection con = null;
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        }
        catch (SQLException ex)
        {
            System.out.println("Not able to connect to database");
        }
        catch (ClassNotFoundException ex) 
        {
            System.out.println("Not able to connect to database");
        }
        return con;
    }
}

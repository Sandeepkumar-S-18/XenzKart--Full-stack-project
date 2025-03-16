package com.MyDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnector 
{
    public static String url = "jdbc:mysql://localhost:3306/XenzKart";
    public static String user = "root";
    public static String password = "";
    
    public static Connection connect()
    {
        Connection con = null;
        
        try
        {
            con = DriverManager.getConnection(url, user, password);
        }
        catch (SQLException ex)
        {
            System.out.println("Not able to connect to database");
        }
        return con;
    }
}

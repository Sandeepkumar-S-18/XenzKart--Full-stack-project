package com.MyDb;

import com.MyJavaClass.LoginDataBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class UpdateRecord 
{
    Connection con = DbConnector.connect();
    
    public boolean updateProfile(HttpSession session)
    {
        int i = 0;
        
        LoginDataBean userData = (LoginDataBean)session.getAttribute("loginDetails");
        String userType = userData.getUserType();
        int id = userData.getId();
        String name = userData.getName();
        String profileImage = userData.getProfileImage();
        String email = userData.getEmail();
        long mobile = userData.getMobile();
        String address = userData.getAddress();
        String password = userData.getPassword();
        
        try
        {
            String sqlQuery = "";
            
            if(userType.equals("admin"))
            {
                sqlQuery = "update xenzkart_admin set name=?, profile_image=?, email=?, mobile=?, address=?, password=md5(?), profile_updated_time=now() where id=?";
            }
            else if(userType.equals("user"))
            {
                sqlQuery = "update xenzkart_user set name=?, profile_image=?, email=?, mobile=?, address=?, password=md5(?), profile_updated_time=now() where id=?";
            }
            
            PreparedStatement ps1 = con.prepareStatement(sqlQuery);
            ps1.setString(1, name);
            ps1.setString(2, profileImage);
            ps1.setString(3, email);
            ps1.setLong(4, mobile);
            ps1.setString(5, address);
            ps1.setString(6, password);
            ps1.setInt(7, id);
            
            i = ps1.executeUpdate();
        }
        catch(SQLException ex)
        {
            Logger.getLogger(NewRecords.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(i > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}

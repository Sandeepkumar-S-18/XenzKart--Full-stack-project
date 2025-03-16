package com.MyDb;

import com.MyJavaClass.LoginDataBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class NewRecords
{
    Connection con = DbConnector.connect();
    
    public boolean createAccount(HttpSession session)
    {
        int rowCount = 0;
        int i = 0;
        
        LoginDataBean userData = (LoginDataBean)session.getAttribute("userDetails");
        String name = userData.getName();
        String profileImage = userData.getProfileImage();
        String email = userData.getEmail();
        long mobile = userData.getMobile();
        String address = userData.getAddress();
        String password = userData.getPassword();
        
        try
        {
            PreparedStatement ps1 = con.prepareStatement("select * from xenzkart_user where email=? and password=md5(?)");
            ps1.setString(1, email);
            ps1.setString(2, password);
            ResultSet rs1 = ps1.executeQuery();
            
            while(rs1.next())
            {
                rowCount = rs1.getRow();
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(NewRecords.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(rowCount > 0)
        {
            return false;
        }
        else
        {
            try
            {
                PreparedStatement ps2 = con.prepareStatement("insert into xenzkart_user(name, profile_image, email, mobile, address, password, register_time) values(?,?,?,?,?,md5(?),now())");
                ps2.setString(1, name);
                ps2.setString(2, profileImage);
                ps2.setString(3, email);
                ps2.setLong(4, mobile);
                ps2.setString(5, address);
                ps2.setString(6, password);
                
                i = ps2.executeUpdate();
            }
            catch (SQLException ex)
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
}

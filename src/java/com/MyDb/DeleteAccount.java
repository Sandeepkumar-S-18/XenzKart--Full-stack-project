package com.MyDb;

import com.MyJavaClass.LoginDataBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class DeleteAccount 
{
    Connection con = DbConnector.connect();
    
    public boolean deleteRecord(HttpSession session)
    {
        int i = 0;
        
        LoginDataBean userData = (LoginDataBean)session.getAttribute("loginDetails");
        int id = userData.getId();
        String email = userData.getEmail();
        
        try
        {
            PreparedStatement ps1 = con.prepareStatement("delete from xenzkart_user where id=? and email=?");
            ps1.setInt(1, id);
            ps1.setString(2, email);
            
            i = ps1.executeUpdate();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(DeleteAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(i > 0)
        {
            return  true;
        }
        else
        {
            return false;
        }
    }
}

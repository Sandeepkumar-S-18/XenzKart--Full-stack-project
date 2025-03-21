package com.MyDb;

import com.MyJavaClass.LoginDataBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class RetrievingData
{
    Connection con = DbConnector.connect();
    
    public boolean login(HttpSession session)
    {
        LoginDataBean loginDataBean = (LoginDataBean)session.getAttribute("loginCredential");
        String userType = loginDataBean.getUserType();
        String email = loginDataBean.getEmail();
        String password = loginDataBean.getPassword();
        
        int rowCount = 0;
        
        int id = 0;
        String name = "", profilePhoto = "", address  = "", registerTime  = "", status  = "";
        long mobile = 0;
        
        try
        {
            if(userType.equals("admin"))
            {
                PreparedStatement ps1 = con.prepareStatement("select * from xenzkart_admin where email=? and password=md5(?)");
                ps1.setString(1, email);
                ps1.setString(2, password);
                ResultSet rs1 = ps1.executeQuery();

                while(rs1.next())
                {
                    rowCount = rs1.getRow();
                    id = rs1.getInt("id");
                    name = rs1.getString("name");
                    profilePhoto = rs1.getString("profile_image");
                    address = rs1.getString("address");
                    registerTime = rs1.getString("register_time");
                    status = rs1.getString("status");
                    mobile = rs1.getLong("mobile");
                }
            }
            else if(userType.equals("user"))
            {
                PreparedStatement ps1 = con.prepareStatement("select * from xenzkart_user where email=? and password=md5(?)");
                ps1.setString(1, email);
                ps1.setString(2, password);
                ResultSet rs1 = ps1.executeQuery();

                while(rs1.next())
                {
                    rowCount = rs1.getRow();
                    id = rs1.getInt("id");
                    name = rs1.getString("name");
                    profilePhoto = rs1.getString("profile_image");
                    address = rs1.getString("address");
                    registerTime = rs1.getString("register_time");
                    status = rs1.getString("status");
                    mobile = rs1.getLong("mobile");
                }
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(RetrievingData.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(rowCount > 0)
        {
            LoginDataBean loginDetails = new  LoginDataBean();
            loginDetails.setUserType(userType);
            loginDetails.setId(id);
            loginDetails.setName(name);
            loginDetails.setProfileImage(profilePhoto);
            loginDetails.setEmail(email);
            loginDetails.setMobile(mobile);
            loginDetails.setAddress(address);
            loginDetails.setPassword(password);
            loginDetails.setRegisterTime(registerTime);
            loginDetails.setStatus(status);
            
            session.setAttribute("loginDetails", loginDetails);
            return true;
        }
        else
        {
            return false;
        }
    }
}

package com.MyDb;

import com.MyJavaClass.CartBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class AddToCart 
{
    Connection con = DbConnector.connect();
    
    public boolean productAddedToCart(HttpSession session)
    {
        CartBean cartProductDetails = (CartBean)session.getAttribute("cartProductDetails");
        int buyer_id = cartProductDetails.getBuyer_id();
        int product_id = cartProductDetails.getProduct_id();
        int quantity = cartProductDetails.getQuantity();
        double total_price = cartProductDetails.getTotal_price();
        int i = 0;
        try 
        {
            PreparedStatement ps1 = con.prepareStatement("insert into xenzkart_orders(buyer_id, product_id, quantity, total_price, order_date) values(?,?,?,?,now())");
            ps1.setInt(1, buyer_id);
            ps1.setInt(2, product_id);
            ps1.setInt(3, quantity);
            ps1.setDouble(4, total_price);
            
            i = ps1.executeUpdate();
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
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

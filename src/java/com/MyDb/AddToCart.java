package com.MyDb;

import com.MyJavaClass.CartBean;
import com.MyJavaClass.ProductDataBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
    public ProductDataBean retrievingCartProductList(int buyer_id)
    {
        ProductDataBean productDataBean = new ProductDataBean();
        
        try 
        {
            PreparedStatement ps1 = con.prepareStatement("select * from xenzkart_orders where buyer_id=?");
            ps1.setInt(1, buyer_id);
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                ProductDataBean product = new ProductDataBean();
                int product_id = rs1.getInt("product_id");
                
                PreparedStatement ps2 = con.prepareStatement("select * from xenzkart_product where product_id=?");
                ps2.setInt(1, product_id);
                ResultSet rs2 = ps2.executeQuery();
                
                while(rs2.next()) 
                {
                    product.setOrder_id(rs1.getInt("order_id"));
                    product.setProduct_id(rs2.getInt("product_id"));
                    product.setName(rs2.getString("name"));
                    product.setProduct_image(rs2.getString("product_image"));
                    product.setDescription(rs2.getString("description"));
                    product.setCategory(rs2.getString("category"));
                    product.setPrice(rs2.getDouble("price"));
                    product.setDiscount_price(rs2.getDouble("discount_price"));
                    product.setQuantity(rs2.getInt("quantity"));
                    product.setProduct_rating(rs2.getDouble("product_rating"));
                    product.setCreated_at(rs2.getString("created_at"));
                    product.setUpdated_at(rs2.getString("updated_at"));
                    product.setStatus(rs2.getString("status"));

                    productDataBean.addProductToList(product);
                }
            }
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productDataBean;
    }
}

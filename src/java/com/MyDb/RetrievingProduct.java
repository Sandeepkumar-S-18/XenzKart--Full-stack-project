package com.MyDb;

import com.MyJavaClass.ProductDataBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RetrievingProduct 
{
    Connection con = DbConnector.connect();
    
    public ProductDataBean retrievingProductList() 
    {
        ProductDataBean productDataBean = new ProductDataBean();

        try 
        {
            PreparedStatement ps1 = con.prepareStatement("select * from xenzkart_product");
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next()) 
            {
                ProductDataBean product = new ProductDataBean();
                
                product.setProduct_id(rs1.getInt("product_id"));
                product.setName(rs1.getString("name"));
                product.setProduct_image(rs1.getString("product_image"));
                product.setDescription(rs1.getString("description"));
                product.setCategory(rs1.getString("category"));
                product.setPrice(rs1.getDouble("price"));
                product.setDiscount_price(rs1.getDouble("discount_price"));
                product.setQuantity(rs1.getInt("quantity"));
                product.setProduct_rating(rs1.getDouble("product_rating"));
                product.setCreated_at(rs1.getString("created_at"));
                product.setUpdated_at(rs1.getString("updated_at"));
                product.setStatus(rs1.getString("status"));
                
                productDataBean.addProductToList(product);
            }
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(RetrievingProduct.class.getName()).log(Level.SEVERE, null, ex);
        }

        return productDataBean;
    }
}

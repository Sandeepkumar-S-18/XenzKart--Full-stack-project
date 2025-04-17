package com.MyDb;

import com.MyJavaClass.ProductDataBean;
import com.MyJavaClass.UpdateProductBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class RetrievingProduct 
{
    Connection con = DbConnector.connect();
    
    public ProductDataBean retrievingProductList(String name) 
    {
        ProductDataBean productDataBean = new ProductDataBean();

        try 
        {
            PreparedStatement ps1 = null;
            
            if(!name.equalsIgnoreCase(""))
            {
                ps1 = con.prepareStatement("select * from xenzkart_product where name like ? or category like ? ");
                ps1.setString(1, "%"+name+"%");
                ps1.setString(2, "%"+name+"%");
            }
            else
            {
                ps1 = con.prepareStatement("select * from xenzkart_product");
            }
            
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
    
    public boolean updateOrAddProduct(HttpSession session)
    {
        int i = 0;
        
        UpdateProductBean upb = (UpdateProductBean)session.getAttribute("UpdatedProductDetails");
        int product_id = upb.getProduct_id();
        String message = upb.getMessage();
        String name = upb.getProduct_name();
        String product_image = upb.getProduct_image();
        String description = upb.getProduct_description();
        double price = upb.getProduct_price();
        double discount_price = upb.getProduct_discount_price();
        double product_rating = upb.getProduct_rating();
        int quantity = upb.getProduct_quantity();
        String category = upb.getProduct_category();
        String sqlQuery = "";
        
        try 
        {
            if("update".equals(message))
            {
                sqlQuery = "update xenzkart_product set name=?, product_image=?, description=?, price=?, discount_price=?, product_rating=?, quantity=?, category=?, updated_at=now() where product_id=?";
                
                PreparedStatement ps1 = con.prepareStatement(sqlQuery);
                ps1.setString(1, name);
                ps1.setString(2, product_image);
                ps1.setString(3, description);
                ps1.setDouble(4, price);
                ps1.setDouble(5, discount_price);
                ps1.setDouble(6, product_rating);
                ps1.setInt(7, quantity);
                ps1.setString(8, category);
                ps1.setInt(9, product_id);
                
                i = ps1.executeUpdate();
            }
            else if("add".equals(message))
            {
                sqlQuery = "insert into xenzkart_product(name, product_image, description, price, discount_price, product_rating, quantity, category, created_at, updated_at) values(?,?,?,?,?,?,?,?, now(),now())";
                
                PreparedStatement ps1 = con.prepareStatement(sqlQuery);
                ps1.setString(1, name);
                ps1.setString(2, product_image);
                ps1.setString(3, description);
                ps1.setDouble(4, price);
                ps1.setDouble(5, discount_price);
                ps1.setDouble(6, product_rating);
                ps1.setInt(7, quantity);
                ps1.setString(8, category);
                
                i = ps1.executeUpdate();
            }
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(RetrievingProduct.class.getName()).log(Level.SEVERE, null, ex);
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

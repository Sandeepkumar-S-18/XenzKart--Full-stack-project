package com.MyDb;

import com.MyJavaClass.CartBean;
import com.MyJavaClass.ProductDataBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class AddToCart 
{
    Connection con = DbConnector.connect();
    ResultSet resultSet1;
    
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
            PreparedStatement ps1 = con.prepareStatement("insert into xenzkart_orders(buyer_id, product_id, quantity, product_price, total_price, order_date) values(?,?,?,?,?,now())");
            ps1.setInt(1, buyer_id);
            ps1.setInt(2, product_id);
            ps1.setInt(3, quantity);
            ps1.setDouble(4, total_price);
            ps1.setDouble(5, total_price);
            
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
    
    public ProductDataBean retrievingCartProductList(int buyer_id, String type)
    {
        ProductDataBean productDataBean = new ProductDataBean();
        
        try 
        {
            String sqlQuery = "";
            
            if(type.equals("cart"))
            {
                sqlQuery = "select * from xenzkart_orders where buyer_id=? and status='cart'";
                PreparedStatement ps1 = con.prepareStatement(sqlQuery);
                ps1.setInt(1, buyer_id);
                resultSet1 = ps1.executeQuery();
            }
            else if(type.equals("order placed"))
            {
                sqlQuery = "select * from xenzkart_orders where buyer_id=? and not status='cart'";
                PreparedStatement ps1 = con.prepareStatement(sqlQuery);
                ps1.setInt(1, buyer_id);
                resultSet1 = ps1.executeQuery();
            }
            
            while (resultSet1.next())
            {
                ProductDataBean product = new ProductDataBean();
                int product_id = resultSet1.getInt("product_id");
                
                PreparedStatement ps2 = con.prepareStatement("select * from xenzkart_product where product_id=?");
                ps2.setInt(1, product_id);
                ResultSet rs2 = ps2.executeQuery();
                
                while(rs2.next()) 
                {
                    product.setOrder_id(resultSet1.getInt("order_id"));
                    product.setNumber_of_product_order(resultSet1.getInt("quantity"));
                    product.setStatus(resultSet1.getString("status"));
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
    
    public ProductDataBean confirmOrder()
    {
        ProductDataBean productDataBean = new ProductDataBean();
        
        try 
        {
            PreparedStatement ps1 = con.prepareStatement("select * from xenzkart_orders where status='order placed'");
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                ProductDataBean product = new ProductDataBean();
                int product_id = rs1.getInt("product_id");
                int buyer_id = rs1.getInt("buyer_id");
                
                PreparedStatement ps2 = con.prepareStatement("select * from xenzkart_product where product_id=?");
                ps2.setInt(1, product_id);
                ResultSet rs2 = ps2.executeQuery();
                
                PreparedStatement ps3 = con.prepareStatement("select * from xenzkart_user where id=?");
                ps3.setInt(1, buyer_id);
                ResultSet rs3 = ps3.executeQuery();
                
                while(rs2.next() && rs3.next())
                {
                    product.setProduct_id(rs1.getInt("product_id"));
                    product.setName(rs2.getString("name"));
                    product.setDiscount_price(rs2.getDouble("discount_price"));
                    product.setNumber_of_product_order(rs1.getInt("quantity"));
                    product.setOrder_id(rs1.getInt("order_id"));
                    product.setUser_name(rs3.getString("name"));
                    product.setAddress(rs3.getString("address"));
                    product.setMobile(rs3.getString("mobile"));
                }
                
                productDataBean.addProductToList(product);
            }
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productDataBean;
    }
    
    public boolean removeCartProduct(int order_id, String message)
    {
        int i = 0;
        try 
        {
            String sqlQuery = "";
            if(message.equals("removeFromCart"))
            {
                sqlQuery = "delete from xenzkart_orders where order_id=? and status='cart'";
            }
            else if(message.equals("cancelOrder"))
            {
                sqlQuery = "update xenzkart_orders set status='canceled' where order_id=? and status='order placed'";
            }
            
            PreparedStatement ps1 = con.prepareStatement(sqlQuery);
            ps1.setInt(1, order_id);
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
    
    public boolean placeOrder(int[] orderIds, int[] quantityArr,double[] totalProductPrice, String message)
    {
        String sqlQuery = "";
        try 
        {
            if(message.equals("placeOrder"))
            {
                sqlQuery = "update xenzkart_orders set quantity=?, total_price=?, status='order placed', order_date=now() where order_id=?";
            }
            
            PreparedStatement ps1 = con.prepareStatement(sqlQuery);
            
            for (int i = 0; i < orderIds.length; i++)
            {
                int orderId = orderIds[i];
                int quantity = quantityArr[i];
                double totalPrice = totalProductPrice[i];
                
                ps1.setInt(1, quantity);
                ps1.setDouble(2, totalPrice);
                ps1.setInt(3, orderId);
                ps1.addBatch();
            }
            
            int[] updateCounts = ps1.executeBatch();
            return updateCounts.length == orderIds.length;
            
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean confirmOrderByAdmin(int orderId, int productId, int quantity) 
    {
        int i1 = 0, i3 = 0;
        
        try 
        {
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DATE, 2);
            String delivery_date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
            
            PreparedStatement ps1 = con.prepareStatement("update xenzkart_orders set status='order confirmed', delivery_date=? where order_id=? and status='order placed'");
            ps1.setString(1, delivery_date);
            ps1.setInt(2, orderId);
            i1 = ps1.executeUpdate();
            
            if(i1 > 0) 
            {
                PreparedStatement ps2 = con.prepareStatement("select quantity from xenzkart_product where product_id=?");
                ps2.setInt(1, productId);
                ResultSet rs2 = ps2.executeQuery();

                if(rs2.next()) 
                {
                    int currentQty = rs2.getInt("quantity");
                    int updatedQty = currentQty - quantity;
                    
                    if(updatedQty < 0) 
                    {
                        throw new SQLException("Insufficient product quantity.");
                    }

                    PreparedStatement ps3 = con.prepareStatement("update xenzkart_product set quantity=? where product_id=?");
                    ps3.setInt(1, updatedQty);
                    ps3.setInt(2, productId);
                    i3 = ps3.executeUpdate();
                }
            }
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }

        return i3 > 0;
    }
    
    public static void updateDeliveredOrders() 
    {
        Connection con = DbConnector.connect();
        try
        {
            PreparedStatement ps1 = con.prepareStatement("update xenzkart_orders set status='delivered' where delivery_date=? and status='order confirmed'");
            String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            ps1.setString(1, today);
            ps1.executeUpdate();
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

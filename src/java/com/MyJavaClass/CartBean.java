package com.MyJavaClass;

public class CartBean 
{
    private int buyer_id;
    private int product_id;
    private int quantity;
    private double total_price;
    private String status;
    private String order_date;
    private String delivery_date;
    
    public CartBean() 
    {
        super();
    }

    public int getBuyer_id() 
    {
        return buyer_id;
    }

    public void setBuyer_id(int buyer_id) 
    {
        this.buyer_id = buyer_id;
    }

    public int getProduct_id() 
    {
        return product_id;
    }

    public void setProduct_id(int product_id) 
    {
        this.product_id = product_id;
    }

    public int getQuantity() 
    {
        return quantity;
    }

    public void setQuantity(int quantity) 
    {
        this.quantity = quantity;
    }

    public double getTotal_price() 
    {
        return total_price;
    }

    public void setTotal_price(double total_price) 
    {
        this.total_price = total_price;
    }

    public String getStatus() 
    {
        return status;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getOrder_date() 
    {
        return order_date;
    }

    public void setOrder_date(String order_date) 
    {
        this.order_date = order_date;
    }

    public String getDelivery_date() 
    {
        return delivery_date;
    }

    public void setDelivery_date(String delivery_date) 
    {
        this.delivery_date = delivery_date;
    }
}

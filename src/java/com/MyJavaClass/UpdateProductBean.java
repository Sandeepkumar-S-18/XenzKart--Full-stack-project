package com.MyJavaClass;

public class UpdateProductBean 
{
    private int product_id, product_quantity;
    private String message, product_name, product_image, product_description, product_category;
    private double product_price, product_discount_price, product_rating;

    public UpdateProductBean() 
    {
        super();
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getProduct_quantity() 
    {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) 
    {
        this.product_quantity = product_quantity;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getProduct_name() 
    {
        return product_name;
    }

    public void setProduct_name(String product_name) 
    {
        this.product_name = product_name;
    }

    public String getProduct_image() 
    {
        return product_image;
    }

    public void setProduct_image(String product_image) 
    {
        this.product_image = product_image;
    }

    public String getProduct_description() 
    {
        return product_description;
    }

    public void setProduct_description(String product_description) 
    {
        this.product_description = product_description;
    }

    public String getProduct_category() 
    {
        return product_category;
    }

    public void setProduct_category(String product_category) 
    {
        this.product_category = product_category;
    }

    public double getProduct_price() 
    {
        return product_price;
    }

    public void setProduct_price(double product_price) 
    {
        this.product_price = product_price;
    }

    public double getProduct_discount_price() 
    {
        return product_discount_price;
    }

    public void setProduct_discount_price(double product_discount_price) 
    {
        this.product_discount_price = product_discount_price;
    }

    public double getProduct_rating() 
    {
        return product_rating;
    }

    public void setProduct_rating(double product_rating) 
    {
        this.product_rating = product_rating;
    }
}

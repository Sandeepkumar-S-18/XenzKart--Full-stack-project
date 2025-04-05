package com.MyJavaClass;

import java.util.ArrayList;

public class ProductDataBean 
{
    private int product_id, quantity, order_id, number_of_product_order;
    private String name, product_image, description, category, created_at, updated_at, status;
    private double price, discount_price, product_rating;
    
    private String user_name, address, mobile;

    private ArrayList<ArrayList<ProductDataBean>> productList;

    public ProductDataBean() 
    {
        super();
        this.productList = new ArrayList<>();
    }

    public ArrayList<ArrayList<ProductDataBean>> getProductList() 
    {
        return productList;
    }

    public void setProductList(ArrayList<ArrayList<ProductDataBean>> productList) 
    {
        this.productList = productList;
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

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getNumber_of_product_order() 
    {
        return number_of_product_order;
    }

    public void setNumber_of_product_order(int number_of_product_order) 
    {
        this.number_of_product_order = number_of_product_order;
    }

    public String getName() 
    {
        return name;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getProduct_image() 
    {
        return product_image;
    }

    public void setProduct_image(String product_image) 
    {
        this.product_image = product_image;
    }

    public String getDescription() 
    {
        return description;
    }

    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getCategory() 
    {
        return category;
    }

    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCreated_at() 
    {
        return created_at;
    }

    public void setCreated_at(String created_at) 
    {
        this.created_at = created_at;
    }

    public String getUpdated_at() 
    {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) 
    {
        this.updated_at = updated_at;
    }

    public String getStatus() 
    {
        return status;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public double getPrice() 
    {
        return price;
    }

    public void setPrice(double price) 
    {
        this.price = price;
    }

    public double getDiscount_price() 
    {
        return discount_price;
    }

    public void setDiscount_price(double discount_price) 
    {
        this.discount_price = discount_price;
    }

    public double getProduct_rating() 
    {
        return product_rating;
    }

    public void setProduct_rating(double product_rating) 
    {
        this.product_rating = product_rating;
    }

    public String getUser_name() 
    {
        return user_name;
    }

    public void setUser_name(String user_name) 
    {
        this.user_name = user_name;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getMobile() 
    {
        return mobile;
    }

    public void setMobile(String mobile) 
    {
        this.mobile = mobile;
    }
    
    public void addProductToList(ProductDataBean product) 
    {
        if(this.productList.isEmpty()) 
        {
            ArrayList<ProductDataBean> tempList = new ArrayList<>();
            tempList.add(product);
            this.productList.add(tempList);
        } 
        else 
        {
            ArrayList<ProductDataBean> lastList = this.productList.get(this.productList.size() - 1);
            lastList.add(product);
        }
    }
}

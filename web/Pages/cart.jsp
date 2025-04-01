<%@page import="com.MyDb.AddToCart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MyJavaClass.ProductDataBean"%>
<%@page import="com.MyDb.RetrievingProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XenzKart - YOUR CART</title>
        
        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        
        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/cart.css">
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <section id="header_section">
            <div id="header_div">
                <div id="heading1">YOUR CART</div>
                <div id="heading2"><a href="#">Your orders</a></div>
            </div>
        </section>
        
        <section id="cart_section">
            <div id="cart_wrapper">
                <%
                    LoginDataBean loginData = (LoginDataBean)session.getAttribute("loginDetails");
                    int id = loginData.getId();
                    
                    AddToCart retrievingProduct = new AddToCart();
                    ProductDataBean productDataBean = retrievingProduct.retrievingCartProductList(id);

                    ArrayList<ArrayList<ProductDataBean>> productList = productDataBean.getProductList();
                    
                    int count1 = -1;
                    
                    for (ArrayList<ProductDataBean> productGroup : productList) 
                    {
                        for (ProductDataBean product : productGroup) 
                        {
                            count1 += 1;
                            String productArr = "["+ product.getProduct_id() + ", "+ "\"" + product.getName() + "\", "+ "\"" + product.getProduct_image() + "\", "+ "\"" + product.getDescription() + "\", "+ product.getPrice() + ", "+ product.getDiscount_price() + ", "+ product.getProduct_rating() + ", "+ product.getQuantity() + ", "+ "\"" + product.getCategory() + "\"]";
                            %>
                            <div class="cart_div" id="<%= product.getProduct_id() %>">
                                <div class="cart_product_img"> <img src="../Product_images/<%= product.getProduct_image() %>" alt="<%= product.getName() %>" title="PRODUCT PICTURE" /> </div>
                                <div class="cart_product_info">
                                    <div class="cart_product_name" title="PRODUCT NAME"><%= product.getName() %></div>
                                    <div class="cart_product_dis" title="PRODUCT DISCRIPTION"><%= product.getDescription() %></div>
                                    <div class="product_price product_price_custom" title="PRODUCT PRICE">
                                        <span><del>₹ <%= product.getPrice() %> /-</del></span> &nbsp;
                                        <span>₹ <%= product.getDiscount_price() %> /-</span>
                                    </div>
                                    <div class="product_available">Only <%= product.getQuantity() %> product are available.</div>
                                    <div class="cart_product_qty">
                                        Quantity : <input class="product_qty_box" id="product_qty_box_<%= product.getProduct_id() %>" type="number" value="" name="product_qty" title="ENTER THE REQUIREMENT" />
                                        <input class="place_order_btn" type="button" value="PLACE ORDER" />
                                    </div>
                                </div>
                            </div>
                            <%
                        }
                    }
                %>
            </div>
        </section>
            
        <section id="checkout_section">
            <div id="checkout_wrap">
                <div id="payment_heading">PAYMENT</div>
                <div id="payment_table">
                    <table cellspacing="0px" frame="box" rules="rows">
                        <tr>
                            <th>Sl No.</th>
                            <th>Order ID</th>
                            <th>Product name</th>
                            <th>Quantity</th>
                            <th>Product price</th>
                            <th>Confirm order</th>
                        </tr>
                        <div class="product_list">
                            <tr align="center">
                                <td>Sl No.</td>
                                <td>Order ID</td>
                                <td>Product name</td>
                                <td>Quantity</td>
                                <td>Product price</td>
                                <td>Confirm order</td>
                            </tr>
                        </div>
                        <tr>
                            <th colspan="4">iujhgo</th>
                            <th colspan="2">jhg</th>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
        
        <%@include file="footer.html" %>
    </body>
</html>

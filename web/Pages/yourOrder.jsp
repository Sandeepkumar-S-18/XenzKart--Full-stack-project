<%@page import="java.util.ArrayList"%>
<%@page import="com.MyJavaClass.ProductDataBean"%>
<%@page import="com.MyDb.AddToCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XenzKart - YOUR ORDERS</title>
        
        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        
        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/cart.css">
        
        <!--JS FILE-->
        <script src="../js/pageJS.js"></script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <section id="header_section">
            <div id="header_div">
                <div id="heading3"></div>
                <div id="heading2"><a href="cart.jsp">Your cart</a></div>
            </div>
        </section>
        
        <section id="cart_section">
            <div id="cart_wrapper">
                <%
                    LoginDataBean loginData = (LoginDataBean)session.getAttribute("loginDetails");
                    int id = loginData.getId();
                    
                    AddToCart retrievingProduct = new AddToCart();
                    ProductDataBean productDataBean = retrievingProduct.retrievingCartProductList(id, "order placed");

                    ArrayList<ArrayList<ProductDataBean>> productList = productDataBean.getProductList();
                    
                    int count1 = -1;
                    
                    for (ArrayList<ProductDataBean> productGroup : productList) 
                    {
                        for (ProductDataBean product : productGroup) 
                        {
                            count1 += 1;
                            int order_id = product.getOrder_id();
                            int number_of_product_order = product.getNumber_of_product_order();
                            String status = product.getStatus();
                            int product_id = product.getProduct_id();
                            String product_name = product.getName();
                            String product_image = product.getProduct_image();
                            String product_description = product.getDescription();
                            double product_price = product.getPrice();
                            double product_discount_price = product.getDiscount_price();
                            int product_quantity = product.getQuantity();
                            %>
                            <div class="cart_div" id="<%= product_id %>">
                                <div class="cart_product_img"> <img src="../Product_images/<%= product_image %>" alt="<%= product_name %>" title="PRODUCT PICTURE" /> </div>
                                <div class="cart_product_info">
                                    <div class="cart_product_name" title="PRODUCT NAME"><%= product_name %></div>
                                    <div class="cart_product_dis" title="PRODUCT DISCRIPTION"><%= product_description %></div>
                                    <div class="product_price product_price_custom" title="PRODUCT PRICE">
                                        <span><del>₹ <%= product_price %> /-</del></span> &nbsp;
                                        <span>₹ <%= product_discount_price %> /-</span>
                                    </div>
                                    <div class="cart_product_qty">
                                        <div class="product_available"><%= number_of_product_order %> products are order.</div>
                                        <%
                                            if(!status.equals("order confirmed"))
                                            {
                                                %>
                                                <div><%= status %></div>
                                                <div class="remove_product" title="CANCEL ORDER">
                                                    <a href="../RemoveCartProduct?orderId=<%= order_id %>&action=cancelOrder">CANCEL ORDER</a>
                                                </div>
                                                <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                            <%
                        }
                    }
                %>
            </div>
        </section>
            
        <%@include file="footer.html" %>
    </body>
</html>

<%@page import="java.util.ArrayList"%>
<%@page import="com.MyJavaClass.ProductDataBean"%>
<%@page import="com.MyDb.AddToCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XenzKart - ORDERS</title>
        
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
                <div id="heading4"></div>
            </div>
        </section>
        
        <section id="cart_section">
            <div id="cart_wrapper">
                <%
                    LoginDataBean loginData = (LoginDataBean)session.getAttribute("loginDetails");
                    int id = loginData.getId();
                    
                    AddToCart retrievingProduct = new AddToCart();
                    ProductDataBean productDataBean = retrievingProduct.confirmOrder();

                    ArrayList<ArrayList<ProductDataBean>> productList = productDataBean.getProductList();
                    
                    int count1 = -1;
                    
                    for (ArrayList<ProductDataBean> productGroup : productList) 
                    {
                        for (ProductDataBean product : productGroup) 
                        {
                            count1 += 1;
                            int product_id = product.getProduct_id();
                            int order_id = product.getOrder_id();
                            int number_of_product_order = product.getNumber_of_product_order();
                            String product_name = product.getName();
                            double product_discount_price = product.getDiscount_price();
                            
                            String user_name = product.getUser_name();
                            String mobile = product.getMobile();
                            String address = product.getAddress();
                            %>
                            <div class="cart_div" id="<%= order_id %>">
                                <div class="confirm_product_info">
                                    <div class="cart_product_name" title="PRODUCT NAME"><%= product_name %></div>
                                    <div title="PRODUCT PRICE"><b>₹ <%= product_discount_price %> /-</b></div>
                                    <div title="NUMBER OF PRODUCTS OREDERD"><b><%= number_of_product_order %></b> products are ordered.</div>
                                    <div class="user_address">Order by <b><%= user_name %></b>. mobile number <b><%= mobile %></b>.</div>
                                    <div title="ADDRESS"><b>Address :</b> <%= address %>.</div>
                                    <div title="CONFIRM ORDER" class="remove_product"><a href="../RemoveCartProduct?orderId=<%= order_id %>&action=confirm&productId=<%= product_id %>&quantity=<%= number_of_product_order %>">CONFIRM ORDER</a></div>
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

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
                <div class="cart_div">
                    <div class="cart_product_img"> <img src="../Product_images/Backpack.jpg" alt="Backpack.jpg" /> </div>
                    <div class="cart_product_info">
                        <div class="cart_product_name">Backpack</div>
                        <div class="cart_product_dis">Stylish backpack with multiple compartments.</div>
                    </div>
                </div>
                <div class="cart_div"></div>
            </div>
        </section>
        
        <%@include file="footer.html" %>
    </body>
</html>

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
        
        <!--JS FILE-->
        <script src="../js/pageJS.js"></script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <section id="header_section">
            <div id="header_div">
                <div id="heading1"></div>
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
                            int order_id = product.getOrder_id();
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
                                    <div class="product_available">Only <%= product_quantity %> product are available.</div>
                                    <div class="cart_product_qty">
                                        Quantity : <input class="product_qty_box" id="product_qty_box_<%= product_id %>" type="number" value="1" name="product_qty" min="1" max="<%= product_quantity %>" title="ENTER THE REQUIREMENT" />
                                        <input class="place_order_btn" type="button" value="PLACE ORDER" title="PLACE ORDER" onclick="payment(<%= order_id %>,<%= product_id %>, '<%= product_name %>', <%= product_discount_price %>)" />
                                        <div class="remove_product" title="REMOVE PRODUCT FROM CART"><a href="../RemoveCartProduct?order=<%= order_id %>">REMOVE</a></div>
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
                <div id="payment_heading" title="YOUR BILL">PAYMENT</div>
                <div id="payment_table">
                    <form action="../PlaceOrder" method="POST" >
                        <table cellspacing="0px" frame="below" rules="rows">
                            <tr height="40px">
                                <th title="ORDER ID">Order ID</th>
                                <th title="PRODUCT NAME">Product name</th>
                                <th title="QUANTITY">Quantity</th>
                                <th title="PRICE">Product price</th>
                                <th title="TOTAL PRICE">Total price</th>
                                <th></th>
                            </tr>
                            <tbody id="product_list"></tbody>
                            <tr height="30px">
                                <th colspan="4">Total : </th>
                                <th colspan="2" id="total_amount" title="TOTAL AMOUNT"></th>
                            </tr>
                        </table>
                        <div id="confirm_payment_div">
                            <input id="confirm_payment" type="submit" value="CONFIRM PAYMENT" title="MAKE PAYMENT" />
                        </div>
                    </form>
                </div>
            </div>
        </section>
        
        <%@include file="footer.html" %>
    </body>
</html>

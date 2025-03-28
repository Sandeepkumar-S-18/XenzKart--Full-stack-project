<%@page import="java.util.ArrayList"%>
<%@page import="com.MyJavaClass.ProductDataBean"%>
<%@page import="com.MyDb.RetrievingProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XenzKart - PRODUCT</title>
        
        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        
        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/product.css">
        
        <!--JS FILE-->
        <script src="../js/pageJS.js"></script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <%@include file="banner.html" %>
        
        <!-- ====================================== PRODUCT HEADER ====================================== -->
        <section id="product_heading_section">
            <div id="product_heading">
                <div>Shop With Us</div>
                <div>Handpicked Favourites just for you</div>
            </div>
        </section>
        <!-- ====================================== /PRODUCT HEADER ====================================== -->
        
        <!-- ====================================== PRODUCT CONTAINER ====================================== -->
        <section id="product_section">
        <%
            RetrievingProduct retrievingProduct = new RetrievingProduct();
            ProductDataBean productDataBean = retrievingProduct.retrievingProductList();

            ArrayList<ArrayList<ProductDataBean>> productList = productDataBean.getProductList();
            
            int count = 0;
            int maxPerPage = 40;
            int divIndex = 0;
            
            for (ArrayList<ProductDataBean> productGroup : productList) 
            {
                for (ProductDataBean product : productGroup) 
                {
                    String productArr = "["+ product.getProduct_id() + ", "+ "\"" + product.getName() + "\", "+ "\"" + product.getProduct_image() + "\", "+ "\"" + product.getDescription() + "\", "+ product.getPrice() + ", "+ product.getDiscount_price() + ", "+ product.getProduct_rating() + ", "+ product.getQuantity() + ", "+ "\"" + product.getCategory() + "\"]";

                    if (count % maxPerPage == 0) 
                    { 
                        if (count != 0) 
                        { %>
                            </div>
                        <% }
                        divIndex++;
                        %>
                        <div class="product_collection" id="section_<%= divIndex %>">
                    <% }
                    count++;
                    %>
                    <div class="product_item" id="<%= product.getProduct_id() %>">
                        <div class="product_image_div">
                            <img src="../Product_images/<%= product.getProduct_image() %>" alt="<%= product.getName() %>" class="product_image">
                            <div class="product_image_btns">
                                <div class="view_product_div">
                                    <i class="fa fa-eye eye_btn" onclick='productDetailsPanel(<%= productArr %>)'></i>
                                </div>
                                <div class="add_to_cart_div">
                                    <a href="#" class="add_to_cart">Add to Cart</a>
                                </div>
                            </div>
                        </div>
                        <div class="product_name_div">
                            <i class="product_name" onclick='productDetailsPanel(<%= productArr %>)'><%= product.getName() %></i>
                        </div>
                        <div class="product_price">
                            <span><del>₹ <%= product.getPrice() %> /-</del></span> &nbsp;
                            <span>₹ <%= product.getDiscount_price() %> /-</span>
                        </div>
                    </div>
                    <%
                }
            }
            if (count > 0) 
            { %>
                </div>
            <% }
            
            if (count > maxPerPage) { %>
            <div class="product_navigation">
                <button onclick="prevSection()">Previous</button>
                <button onclick="nextSection()">Next</button>
            </div>
        <% } %>
        </section>
        <!-- ====================================== /PRODUCT CONTAINER ====================================== -->
        
        <!-- ====================================== PRODUCT VIEWER ====================================== -->
        <div id="overlay">
            <div id="product_details">
		<button id="cls" onclick="cls()" title="CLOSE"> X </button>
                <div id="product_details_wrapper">
                    <div id="product_header">PRODUCT INFORMATION</div>
                    <div id="product_picture_div" title="PRODUCT PICTURE">
                        <img src="" alt="" />
                    </div>
                    <div id="product_details_div">
                        <div id="product_name_detls" title="PRODUCT NAME"></div>
                        <div id="product_category" title="PRODUCT CATEGORY"></div>
                        <div id="product_rating_detls" title="PRODUCT RATING"></div>
                        <div id="product_discription_detls" title="PRODUCT DISCRIPTION"></div>
                        <div id="product_quantity" title="NUMBER OF PRODUCTS AVAILABLE"></div>
                        <div>
                            <span id="product_price_detls" title="PRODUCT PRICE"></span>
                            <span id="product_discounted_price_detls" title="DISCOUNT PRICE"></span>
                        </div>
                        <div id="add_cart_btn">
                            <a href="#" id="add_cart_btn_anchor">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ====================================== /PRODUCT VIEWER ====================================== -->
        
        <%@include file="footer.html" %>
    </body>
</html>

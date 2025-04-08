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
                <div id="product_heading_wrap">
                    <div>Shop With Us</div>
                    <div>Handpicked Favourites just for you</div>
                </div>
                <div id="add_product_button_div">
                    <%! static String userType1; %>
                    <%
                        LoginDataBean loginDataBean1 = (LoginDataBean)session.getAttribute("loginDetails");
                        userType1 = loginDataBean1.getUserType();
                        if(userType1.equals("admin"))
                        {
                            %><input id="add_btn1" type="button" value="ADD PRODUCT" title="ADD PRODUCT" onclick="addProduct()" /><%
                        }
                    %>
                </div>
            </div>
        </section>
        <!-- ====================================== /PRODUCT HEADER ====================================== -->
        
        <!-- ====================================== PRODUCT CONTAINER ====================================== -->
        <section id="product_section">
        <%! 
            int product_id, product_quantity;
            String product_name, product_image, product_description, product_category, productArr;
            double product_price, product_discount_price, product_rating;
        %>
        <%
            RetrievingProduct retrievingProduct = new RetrievingProduct();
            ProductDataBean productDataBean = retrievingProduct.retrievingProductList();

            ArrayList<ArrayList<ProductDataBean>> productList = productDataBean.getProductList();
            
            int count = 0;
            int count1 = -1;
            int maxPerPage = 24;
            int divIndex = 0;
            
            for (ArrayList<ProductDataBean> productGroup : productList) 
            {
                for (ProductDataBean product : productGroup) 
                {
                    count1 += 1;
                    product_id = product.getProduct_id();
                    product_name = product.getName();
                    product_image = product.getProduct_image();
                    product_description = product.getDescription();
                    product_price = product.getPrice();
                    product_discount_price = product.getDiscount_price();
                    product_rating = product.getProduct_rating();
                    product_quantity = product.getQuantity();
                    product_category = product.getCategory();
                    productArr = "[" + product_id + ", " + "\"" + product_name + "\", " + "\"" + product_image + "\", " + "\"" + product_description + "\", " + product_price + ", " + product_discount_price + ", " + product_rating + ", " + product_quantity + ", " + "\"" + product_category + "\"" + "]";

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
                    <div class="product_item" id="<%= product_id %>">
                        <div class="product_image_div">
                            <img src="../Product_images/<%= product_image %>" alt="<%= product_name %>" class="product_image">
                            <div class="product_image_btns">
                                <div class="view_product_div">
                                    <i class="fa fa-eye eye_btn" onclick='productDetailsPanel(<%= productArr %>)'></i>
                                </div>
                                <div class="add_to_cart_div">
                                    <%
                                    if(product_quantity > 0 && userType1.equals("user"))
                                    {
                                        %><a href="../Cart?id=<%= count1 %>" class="add_to_cart">Add to Cart</a><%
                                    }
                                    else if(userType1.equals("admin"))
                                    {
                                        %><button class="update_product" onclick='updateProduct(JSON.parse(`<%= productArr %>`))'>Update product details</button><%
                                    }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="product_name_div">
                            <i class="product_name" onclick='productDetailsPanel(<%= productArr %>)'><%= product_name %></i>
                        </div>
                        <div class="product_price">
                            <span><del>₹ <%= product_price %> /-</del></span> &nbsp;
                            <span>₹ <%= product_discount_price %> /-</span>
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
        
        <!-- ====================================== CUSTOM DIV ====================================== -->
        <div id="overlay">
            <div id="product_details">
		<button id="cls" onclick="cls()" title="CLOSE"> X </button>
                
                <!-- ====================================== PRODUCT VIEWER ====================================== -->
                <div id="product_details_wrapper">
                    <div class="product_header">PRODUCT INFORMATION</div>
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
                        <%
                        if(product_quantity > 0 && userType1.equals("user"))
                        {%>
                            <div id="add_cart_btn">
                                <a href="../Cart?id=<%= count1 %>" id="add_cart_btn_anchor">Add to Cart</a>
                            </div>
                        <%}%>
                    </div>
                </div>
                <!-- ====================================== PRODUCT VIEWER ====================================== -->
                
                <!-- ====================================== PRODUCT MODIFIER ====================================== -->
                <div id="add_and_update_product">
                    <div class="product_header">PRODUCT INFORMATION</div>
                    <form action="../UpdateOrNewProduct" method="POST" enctype="multipart/form-data">
                        <div id="update_product_info">
                            <input id="msg1" name="msg1" type="text" value="" hidden />
                            <input id="productId1" name="productId1" type="number" value="" hidden />
                            <table>
                                <tr>
                                    <td><label for="update_product_name">PRODUCT NAME : </label></td>
                                    <td><input id="update_product_name" name="update_product_name" type="text" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="update_product_img">PRODUCT IMAGE : </label></td>
                                    <td>
                                        <input id="update_product_img" name="update_product_img" type="file" accept="image/*" />
                                        <input id="old_image" name="old_image" type="text" hidden />
                                    </td>
                                </tr>
                                <tr>
                                    <td><label for="update_product_description">DESCRIPTION : </label></td>
                                    <td><textarea id="update_product_description" name="update_product_description" required></textarea></td>
                                </tr>
                                <tr>
                                    <td><label for="update_product_price">PRODUCT PRICE : </label></td>
                                    <td><input id="update_product_price" name="update_product_price" type="number" step="0.01" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="update_product_discount_price">PRODUCT DISCOUNT PRICE : </label></td>
                                    <td><input id="update_product_discount_price" name="update_product_discount_price" type="number" step="0.01" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="update_product_rating">PRODUCT RATING : </label></td>
                                    <td><input id="update_product_rating" name="update_product_rating" type="number" min="0" max="5" step="0.1" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="update_product_quantity">QUANTITY : </label></td>
                                    <td><input id="update_product_quantity" name="update_product_quantity" type="number" required /></td>
                                </tr>
                                <tr>
                                    <td><label for="update_product_category">PRODUCT CATEGORY : </label></td>
                                    <td><input id="update_product_category" name="update_product_category" type="text" required /></td>
                                </tr>
                            </table>
                            <input id="update_add_btn" type="submit" value="SUBMIT" />
                        </div>
                    </form>
                </div>
                <!-- ====================================== /PRODUCT MODIFIER ====================================== -->
            </div>
        </div>
        <!-- ====================================== /CUSTOM DIV ====================================== -->
        
        <%@include file="footer.html" %>
    </body>
</html>

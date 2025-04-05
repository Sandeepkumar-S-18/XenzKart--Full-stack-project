<%@page import="com.MyDb.AddToCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XenzKart - HOME</title>
        
        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        
        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/home.css">
        
        <!--JS FILE-->
        <script src="../js/pageJS.js"></script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <%@include file="banner.html" %>
        <% AddToCart.updateDeliveredOrders(); %>
        
        <!-- ====================================== CARDS ====================================== -->
        <section id="free_shoping_section">
            <div id="free_shoping_section_wrap">
                <div>Free Shipping For You Till Midnight</div>
                <i class="fas fa-shipping-fast"></i>
            </div>
        </section>

        <section id="card_section">
            <div id="card_wrap">
                <div class="card" id="card1"></div>
                <div class="card_content_wrapper card_con1">
                    Platform Velvet <br>
                    Sandals <br>
                    <a href="product.jsp"> <button title="BUY NOW">Shop Now &nbsp; <i class="fa fa-arrow-right"></i> </button> </a> 
                </div>
                <div class="card" id="card2"></div>
                <div class="card_content_wrapper card_con2">
                    Pebbled Weekend <br>
                    Bag <br>
                    <a href="product.jsp"> <button title="BUY NOW"> Shop Now &nbsp; <i class="fa fa-arrow-right"></i> </button>  </a>
                </div>
            </div>
        </section>
        <!-- ====================================== /CARDS ====================================== -->
        
        <!-- ====================================== VIDEO ====================================== -->
        <section id="product_video_section">
            <div id="product_video_image"></div>
            <div id="product_video_content">
                <div id="product_video_box1">Pre-Fall Collection,That mid-summer craving for fall styles?</div>
                <div id="product_video_box2" class="fa fa-play" onclick="playVideo()" title="XenzKart - Preview"></div>
            </div>
        </section>
        <!-- ************************************** VIDEO DIV ************************************** -->
        <div id="overlay">
            <div id="product_details">
		<button id="cls" onclick="cls()" title="CLOSE"> X </button>
                <div id="video_window">
                    <video height="400px" poster="Images/video_preview.png" controls loop>
                        <source src="../Images/My_WebSite_preview_video.mp4">
                    </video>
                </div>
            </div>
        </div>
        <!-- ************************************** /VIDEO DIV ************************************** -->
        <!-- ====================================== /VIDEO ====================================== -->
        
        <!-- ====================================== PRODUCT ====================================== -->
        <!-- ************************************** PRODUCT HEADING ************************************** -->
        <section id="product_heading_section">
            <div id="product_heading">
                <div>Shop With Us</div>
                <div>Handpicked Favourites just for you</div>
            </div>
        </section>
        <!-- ************************************** /PRODUCT HEADING ************************************** -->
        <!-- ************************************** PRODUCT SECTION ************************************** -->
        <section id="product_section">
            <div id="product_section_wrap">
                <div class="product_type_card">
                    <a href="product.jsp">
                        <div class="product_type_img"> <img src="../Images/product_type_img1.png" alt="Electronics" /> </div>
                        <div class="product_type_title">Electronics</div>
                    </a>
                </div>
                <div class="product_type_card">
                    <a href="product.jsp">
                        <div class="product_type_img"> <img src="../Images/product_type_img6.png" alt="Photography" /> </div>
                        <div class="product_type_title">Photography</div>
                    </a>
                </div>
                <div class="product_type_card">
                    <a href="product.jsp">
                        <div class="product_type_img"> <img src="../Images/product_type_img5.jpg" alt="Home & Office" /> </div>
                        <div class="product_type_title">Home & Office</div>
                    </a>
                </div>
                <div class="product_type_card">
                    <a href="product.jsp">
                        <div class="product_type_img"> <img src="../Images/product_type_img4.jpg" alt="Wearables" /> </div>
                        <div class="product_type_title">Wearables</div>
                    </a>
                </div>
                <div class="product_type_card">
                    <a href="product.jsp">
                        <div class="product_type_img"> <img src="../Images/product_type_img2.jpg" alt="Fitness" /> </div>
                        <div class="product_type_title">Fitness</div>
                    </a>
                </div>
                <div class="product_type_card">
                    <a href="product.jsp">
                        <div class="product_type_img"> <img src="../Images/product_type_img8.jpg" alt="Accessories" /> </div>
                        <div class="product_type_title">Accessories</div>
                    </a>
                </div>
                <div class="product_type_card">
                    <a href="product.jsp">
                        <div class="product_type_img"> <img src="../Images/product_type_img3.jpg" alt="Grocery" /> </div>
                        <div class="product_type_title">Grocery</div>
                    </a>
                </div>
                <div class="product_type_card">
                    <a href="product.jsp">
                        <div class="product_type_img"> <img src="../Images/product_type_img7.jpg" alt="Kitchen" /> </div>
                        <div class="product_type_title">Kitchen</div>
                    </a>
                </div>
            </div>
        </section>
        <!-- ************************************** /PRODUCT SECTION ************************************** -->
        <!-- ====================================== /PRODUCT ====================================== -->
        
        <%@include file="footer.html" %>
    </body>
</html>

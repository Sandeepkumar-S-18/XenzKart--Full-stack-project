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
        <!-- ====================================== /VIDEO ====================================== -->
        
        <!-- ====================================== VIDEO ====================================== -->
        
        <%@include file="footer.html" %>
    </body>
</html>

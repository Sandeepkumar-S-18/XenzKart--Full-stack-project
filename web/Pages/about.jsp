<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XenzKart - ABOUT</title>
        
        <!--FONTAWESOME-->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        
        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/about_contact.css">
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <%@include file="banner.html" %>
        <section id="about-wrap">
            <div id="about-div">
                <div id="header">About Us</div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vehicula, risus quis aliquam pulvinar, erat orci rutrum lacus, et congue nisl erat in arcu. Vivamus in aliquam lorem, id gravida dolor. Pellentesque sodales quam massa, eu fermentum lacus pharetra ac. Vestibulum eu tincidunt orci. Proin tincidunt vel dui ac ornare. Proin ultricies quis enim eu facilisis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus aliquam volutpat mi eleifend vulputate. Ut sed purus mollis, maximus libero quis, ullamcorper lectus. Donec vulputate rhoncus imperdiet. Maecenas ut eros ac elit maximus rutrum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vehicula, risus quis aliquam pulvinar, erat orci rutrum lacus, et congue nisl erat in arcu. Vivamus in aliquam lorem, id gravida dolor. Pellentesque sodales quam massa, eu fermentum lacus pharetra ac. Vestibulum eu tincidunt orci. Proin tincidunt vel dui ac ornare. Proin ultricies quis enim eu facilisis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus aliquam volutpat mi eleifend vulputate. Ut sed purus mollis, maximus libero quis, ullamcorper lectus. Donec vulputate rhoncus imperdiet. Maecenas ut eros ac elit maximus rutrum.</p>
            </div>
        </section>
        <section id="about-section">
            <div id="about-table">
                    <div class="about-table-div">
                        <span class="about-table-img"><img src="../Images/person-icon.png" /></span>
                        <span class="about-count">200+</span>
                        <p>People work in our company</p>
                    </div>
                    <div class="about-table-div">
                        <span class="about-table-img"><img src="../Images/home-icon.png" /></span>
                        <span class="about-count">160+</span>
                        <p>Houses we build for our client</p>
                    </div>
                    <div class="about-table-div">
                        <span class="about-table-img"><img src="../Images/global-icon.png" /></span>
                        <span class="about-count">25+</span>
                        <p>Cities around the world</p>
                    </div>
                    <div class="about-table-div">
                        <span class="about-table-img"><img src="../Images/mug-icon.png" /></span>
                        <span class="about-count">1000+</span>
                        <p>People work in our company</p>
                    </div>
                </div>
        </section>
        <%@include file="footer.html" %>
    </body>
</html>

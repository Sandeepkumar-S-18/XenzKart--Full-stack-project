<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XenzKart - CONTACT</title>
        
        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        
        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/about_contact.css">
        
        <!--JS FILE-->
        <script src="../js/pageJS.js"></script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <section id="contact-section">
            <div id="contact-wrap">
                <div id="contact-wrap1">
                    <div id="contact-heading">Contact Us</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vehicula, risus quis aliquam pulvinar, erat orci rutrum lacus, et congue nisl erat in arcu. Vivamus in aliquam lorem, id gravida dolor. Pellentesque sodales quam massa, eu fermentum lacus pharetra ac. Vestibulum eu tincidunt orci. Proin tincidunt vel dui ac ornare. Proin ultricies quis enim eu facilisis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus aliquam volutpat mi eleifend vulputate. Ut sed purus mollis, maximus libero quis, ullamcorper lectus.</p>
                </div>
                <div id="contact-wrap2">
                    <input type="text" value="" id="user-name" class="text-box" placeholder="Name" autofocus /> <br><br>
                    <input type="number" value="" id="user-mobile" class="text-box" placeholder="Mobile number" /> <br><br>
                    <textarea id="user-msg" class="text-box" placeholder="Comment"></textarea> <br><br>
                    <div id="submit-anchor-btn" onclick="sendEmail()"><a href="#" id="submit-anchor">Send message</a></div>
                </div>
            </div>
        </section>
        <%@include file="footer.html" %>
    </body>
</html>

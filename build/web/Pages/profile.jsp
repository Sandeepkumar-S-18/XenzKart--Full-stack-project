<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XenzKart - PROFILE</title>
        
        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        
        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/menu.css">
    </head>
    <body>
        <%! int id; String name, profileImag, email, address, password; long mobile; %>
        <%
            LoginDataBean loginData = (LoginDataBean)session.getAttribute("loginCredential");
            id = loginData.getId();
            name = loginData.getName();
            profileImag = loginData.getProfileImage();
            email = loginData.getEmail();
            address = loginData.getAddress();
            password = loginData.getPassword();
            mobile = loginData.getMobile();
        %>
        <%@include file="menu.jsp" %>
        <section id="profile-wrapper">
            <div id="profile-header">YOUR PROFILE</div>
            <div id="profile-div">
                <div></div>
                <div></div>
            </div>
        </section>
        <%@include file="footer.html" %>
    </body>
</html>

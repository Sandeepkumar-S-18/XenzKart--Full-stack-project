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
        
        <!--JS FILE-->
        <script src="../js/pageJS.js"></script>
    </head>
    <body>
        <%! int id; String name, profileImag, email, address, password; long mobile; %>
        <%
            LoginDataBean loginData = (LoginDataBean)session.getAttribute("loginDetails");
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
                <div id="progile-image">
                    <img src="../Uploads/<%= profileImag %>" alt="Profile photo" />
                </div>
                <div id="profile-details">
                    <button class="edit-btn" onclick="enable()"><i class="fas fa-pencil-alt"></i> EDIT PROFILE</button>
                    <form action="../UpdateRecord" method="POST" enctype="multipart/form-data">
                        <input class="profile-details-text-box" id="profile_photo" type="file" accept="image/*" name="user_profile_photo" hidden />
                        <input class="profile-details-text-box" id="user_name" type="text" name="user_name" value="<%= name %>" placeholder="Name" disabled />
                        <input class="profile-details-text-box" id="user_email" type="email" name="user_email" value="<%= email %>" placeholder="Email" disabled />
                        <input class="profile-details-text-box" id="user_mobile" type="number" name="user_mobile" value="<%= mobile %>" placeholder="Mobile number" disabled />
                        <textarea class="profile-details-text-box" id="user_address" name="user_address" placeholder="Address" disabled><%= address %></textarea>
                        <input class="profile-details-text-box" id="user_upd_pwd" type="password" name="user_upd_pwd" value="" placeholder="New password" hidden /> <br>
                        <%
                            String errorMsg = request.getParameter("errorMsg");
                            if(errorMsg != null)
                            {
                                %><p id="msg">Account is not Updated. Please try again !!!</p><%
                            }
                        %>
                        <br>
                        <input type="submit" value="UPDATE ACCOUNT" />
                    </form>
                </div>
            </div>
        </section>
        <%@include file="footer.html" %>
    </body>
</html>

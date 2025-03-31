<%@page import="com.MyJavaClass.LoginDataBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>XenzKart</title>
        
        <!--FONTAWESOME-->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/menu.css">
        
        <!--JS FILE-->
        <script src="../js/pageJS.js"></script>
    </head>
    <body>
        <header>
            <%! String userType; %>
            <%
                LoginDataBean loginDataBean = (LoginDataBean)session.getAttribute("loginDetails");
                userType = loginDataBean.getUserType();
            %>
            <div id="MyHeader">
                <nav id="navbar">
                    <div class="logo" title="XenzKart"> <a href="home.jsp"><span>XENZ</span>KART</a> </div>
                    <div id="menu">
                        <a href="home.jsp" class="active" title="HOME">HOME</a>
                        <a href="about.jsp" title="ABOUT">ABOUT</a>
                        <a href="product.jsp" title="PRODUCTS">PRODUCTS</a>
                        <%
                            if(userType.equals("admin"))
                            {
                                %>
                                <a href="manageOrders.jsp" title="MANAGE ORDERS">MANAGE ORDERS</a>
                                <%
                            }
                            else if(userType.equals("user"))
                            {
                                %>
                                <a href="contact.jsp" title="CONTACT">CONTACT</a>
                                <%
                            }
                        %>
                        <div> <input id="search_bar" type="search" value="" placeholder="Search"> </div>
                        <button class="fas fa-search" id="search_btn" onclick="searchBar()" title="SEARCH"></button>
                    </div>
                    <div class="actions">
                        <a href="profile.jsp" class="btn" title="PROFILE"><i class="fas fa-user"></i>Profile</a>
                        <%
                            if(userType.equals("admin"))
                            {
                                %>
                                <a href="#" class="btn" title="NOTIFICATION">
                                    <i class="fas fa-lock"></i>Notification
                                </a>
                                <%
                            }
                            else if(userType.equals("user"))
                            {
                                %>
                                <a href="cart.jsp" class="btn" title="YOUR CART">
                                    <i class="fas fa-lock"></i>Cart
                                </a>
                                <%
                            }
                        %>
                    </div>
                </nav>
            </div>
        </header>
    </body>
</html>

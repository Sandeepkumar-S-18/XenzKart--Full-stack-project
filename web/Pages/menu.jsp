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
                    <div class="logo"> <a href="home.jsp"><span>XENZ</span>KART</a> </div>
                    <div id="menu">
                        <a href="home.jsp" class="active">HOME</a>
                        <a href="about.jsp">ABOUT</a>
                        <a href="product.jsp">PRODUCTS</a>
                        <%
                            if(userType.equals("admin"))
                            {
                                %>
                                <a href="manageOrders.jsp">MANAGE ORDERS</a>
                                <%
                            }
                            else if(userType.equals("user"))
                            {
                                %>
                                <a href="contact.jsp">CONTACT</a>
                                <%
                            }
                        %>
                        <div> <input id="search_bar" type="search" value="" placeholder="Search"> </div>
                        <button class="fas fa-search" id="search_btn" onclick="searchBar()"></button>
                    </div>
                    <div class="actions">
                        <a href="#" class="btn"><i class="fas fa-user"></i>Profile</a>
                        <%
                            if(userType.equals("admin"))
                            {
                                %>
                                <a href="#" class="btn count_btn">
                                    <i class="fas fa-history"></i> History
                                </a>
                                <%
                            }
                            else if(userType.equals("user"))
                            {
                                %>
                                <a href="#" class="btn count_btn">
                                    <i class="fas fa-lock"></i> 
                                    <span id="count">0</span> Cart
                                </a>
                        <%
                            }
                        %>
                    </div>
                </nav>
            </div>
        </header>
                    
        <section id="banner">
            <div id="banner_image"></div>
            <div id="banner_content">
                <div class="banner_text">Up To 60% Off Now</div>
                <div class="banner_text">Mid Season Sale 40%</div>
                <div class="banner_text">Final Clearance : Take 20% Off 'Sale Must-haves'</div>
                <div class="banner_text"> <a href="product.jsp"><button title="BUY NOW">Start Shopping &nbsp; <i class="fa fa-arrow-right"></i> </button></a> </div>
            </div>
        </section>
    </body>
</html>

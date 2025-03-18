<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
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
            <div id="MyHeader">
                <nav id="navbar">
                    <div class="logo"> <a href="home.jsp"><span>XENZ</span>KART</a> </div>
                    <div id="menu">
                        <a href="home.jsp" class="active">HOME</a>
                        <a href="about.jsp">ABOUT</a>
                        <a href="product.jsp">PRODUCTS</a>
                        <%
                            String user_type = request.getParameter("user_type");
                            
                            if(user_type.equals("admin"))
                            {
                                %>
                                <a href="manageOrders.jsp">MANAGE ORDERS</a>
                                <%
                            }
                            else if(user_type.equals("user"))
                            {
                                %>
                                <a href="contact.html">CONTACT</a>
                                <%
                            }
                        %>
                        <div> <input id="search_bar" type="search" value="" placeholder="Search"> </div>
                        <button class="fas fa-search" id="search_btn" onclick="searchBar()"></button>
                    </div>
                    <div class="actions">
                        <a href="#" class="btn"><i class="fas fa-user"></i>Profile</a>
                        <%
                            if(user_type.equals("admin"))
                            {
                                %>
                                <a href="#" class="btn count_btn">
                                    <i class="fas fa-history"></i> History
                                </a>
                                <%
                            }
                            else if(user_type.equals("user"))
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
    </body>
</html>

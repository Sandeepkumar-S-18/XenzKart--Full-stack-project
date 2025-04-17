<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.MyDb.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search bar</title>
        
        <!--FONTAWESOME-->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/menu.css">
        
        <!--JS FILE-->
        <script src="../js/pageJS.js"></script>
    </head>
    <body>
        <%
            String value = request.getParameter("value");
            
            Connection con = DbConnector.connect();
            PreparedStatement ps1 = con.prepareStatement("select name from xenzkart_product where name like ? or category like ? limit 7");
            ps1.setString(1, "%"+value+"%");
            ps1.setString(2, "%"+value+"%");
            ResultSet rs1 = ps1.executeQuery();
            
            while(rs1.next()) 
            {
                %>
                    <div class="search_suggestion_div">
                        <i class="fas fa-search searchIcon"></i>
                        <span class="dispDivProductNameSpan" onclick="setValueToSearchBar(this.innerHTML)"><%= rs1.getString("name") %></span>
                    </div>
                <%
            }
        %>
    </body>
</html>

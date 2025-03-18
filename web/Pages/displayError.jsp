<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        <title>XenzKart - ERROR</title>
        
        <style>
            h3 {
                color: red;
            }
            
            a {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%
            String user_type = request.getParameter("user_type");
        %>
        
        <h3>Wrong Credentials</h3>
        <a href="login.jsp?login=<%= user_type %>">Login again</a>
    </body>
</html>

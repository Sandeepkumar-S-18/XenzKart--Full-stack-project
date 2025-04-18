<%@page import="com.MyServlets.LoginServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        <title>XenzKart - LOGIN</title>

        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/login.css">
        
        <!--JS FILE-->
        <script src="../js/validation.js"></script>
    </head>
    <body>
        <section id="wrapper">
            
            <!-- ====================================== LOGIN FORM ====================================== -->
            <div id="login-box">
                <div id="login-design" style="border-radius: 10px 0px 0px 10px;">
                    <div id="welcome-heading">Welcome Back!</div>
                    <p id="welcome-line">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas nisi vitae ultricies porttitor. Sed varius ac nunc sit justo.</p>
                    <%! String login; %>
                    <% 
                        login = request.getParameter("login");
                        if(login.equals("user"))
                        {
                            %>
                            <div id="signup-redirect">Don't have an account?</div>
                            <a href="signup.jsp" title="CREATE ACCOUNT">Sign Up</a>
                            <%
                        }
                    %>
                </div>
                <div id="login-form">
                    <h1>LogIn to XenzKart</h1>
                    <div id="form-data">
                        <form action="../Login?user_type=<%= login %>" method="POST" autocomplete="off" onsubmit="return loginValidation()">
                            <input id="login_email" type="email" name="user_email" value="" placeholder="Email" title="EMAIL" autofocus /> <br><br>
                            <input id="login_pwd" type="password" name="user_pwd" value="" placeholder="Password" title="PASSWORD" /> <br><br>
                            <p id="msg"></p>
                            <%
                                String errorMsg = request.getParameter("errorMsg");
                                if(errorMsg != null)
                                {
                                    %><p id="msg2">Wrong credentials !!!</p><%
                                }
                            %>
                            <br>
                            <input type="submit" value="LOGIN" title="LOGIN" />
                        </form>
                    </div>
                </div>
            </div>
            <!-- ====================================== /LOGIN FORM ====================================== -->
                            
        </section>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- FAVICON -->
        <link rel="shortcut icon" href="../Images/favicon.png" type="image/x-icon">
        <title>XenzKart - SIGN UP</title>

        <!-- CSS FILE -->
        <link rel="stylesheet" href="../css/login.css">
        
        <!--JS FILE-->
        <script src="../js/validation.js"></script>
    </head>
    <body>
        <section id="wrapper">
            <!-- ====================================== SIGN UP FORM ====================================== -->
            <div id="login-box">
                <div id="signup-form">
                    <h1>Create account</h1>
                    <div id="form-data">
                        <form action="../Signup" method="POST" enctype="multipart/form-data" autocomplete="off" onsubmit="return signupValidation()">
                            <label id="custom-file-label" for="signup_photo" title="PROFILE PIC">Upload Profile Photo (2MB)</label>
                            <input id="signup_photo" type="file" accept="image/*" name="user_profile_photo" onchange="updateFileName()" /> <br><br>
                            <input id="signup_uname" type="text" name="user_name" value="" placeholder="Name" title="NAME" autofocus /> <br><br>
                            <input id="signup_email" type="email" name="user_email" value="" placeholder="Email" title="EMAIL" /> <br><br>
                            <input id="signup_mobile" type="number" name="user_mobile" value="" placeholder="Mobile number" title="MOBILE NUMBER" /> <br><br>
                            <textarea id="signup_address" name="user_address" placeholder="Address" title="ADDRESS"></textarea> <br>
                            <input id="signup_pwd" type="password" name="user_pwd" value="" placeholder="Password" title="PASSWORD" /> <br>
                            <p id="msg"></p>
                            <%
                                String errorMsg = request.getParameter("errorMsg");
                                if(errorMsg != null)
                                {
                                    %>
                                    <p id="msg">Account is not created. Please try again !!!</p>
                                    <%
                                }
                            %>
                            <br>
                            <input type="submit" value="REGISTER" title="CREATE ACCOUNT" />
                        </form>
                    </div>
                </div>
                <div id="login-design" style="border-radius: 0px 10px 10px 0px;">
                    <div id="welcome-heading">Come join us!</div>
                    <p id="welcome-line">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas nisi vitae ultricies porttitor. Sed varius ac nunc sit justo.</p>
                    <div id="signup-redirect">Already have an account?</div>
                    <a href="login.jsp?login=user" title="LOGIN">LogIn</a>
                </div>
            </div>
            <!-- ====================================== /SIGN UP FORM ====================================== -->
                            
        </section>
    </body>
</html>

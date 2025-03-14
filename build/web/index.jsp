<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- FAVICON -->
        <link rel="shortcut icon" href="Images/favicon.png" type="image/x-icon">
        <title>XenzKart - LOGIN</title>

        <!-- CSS FILE -->
        <link rel="stylesheet" href="css/login.css">
        
        <!--JS FILE-->
        <script src="js/script.js"></script>
    </head>
    <body>
        <section id="wrapper">
            
            <!--LOGIN FORM-->
            <div id="login-box">
                <div id="login-design">
                    <div>Welcome Back!</div>
                    <div>Don't have an account?</div>
                    <button onclick="displaySignUp()">Sign Up</button>
                </div>
                <div id="login-form">
                    <h1><u>LogIn to XenzKart</u></h1>
                    <div id="form-data">
                        <form action="" method="POST" autocomplete="off">
                            <input type="email" name="user_email" value="" placeholder="Email" autofocus /> <br><br>
                            <input type="password" name="user-pwd" value="" placeholder="Password" /> <br><br><br>
                            <input type="submit" value="LOGIN" />
                        </form>
                    </div>
                </div>
            </div>
            
            <!--SIGNUP FORM-->
            <div id="signup-box">
                <div id="signup-form">
                    <h1><u>LogIn to XenzKart</u></h1>
                    <div id="form-data">
                        <form action="" method="POST" autocomplete="off">
                            <input type="email" name="user_email" value="" placeholder="Email" autofocus /> <br><br>
                            <input type="password" name="user-pwd" value="" placeholder="Password" /> <br><br><br>
                            <input type="submit" value="LOGIN" />
                        </form>
                    </div>
                </div>
                <div id="signup-design">
                    <div>Welcome Back!</div>
                    <div>Don't have an account?</div>
                    <a href="#">Sign Up</a>
                </div>
            </div>
        </section>
    </body>
</html>

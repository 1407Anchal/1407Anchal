<%-- 
    Document   : login
    Created on : 8 Nov, 2021, 12:26:07 PM
    Author     : dell
--%>
<%@page import="vmm.login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
    <head>
        <title>QuickMart</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Classic Style Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } 




        </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="icon" href="images/one.jpeg">

        <!-- js -->
        <script src="js/jquery.min.js"></script>
        <!-- //js -->
        <!-- cart -->
        <script src="js/simpleCart.min.js"></script>
        <!-- cart -->
        <!-- for bootstrap working -->
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <!-- animation-effect -->
        <link href="css/animate.min.css" rel="stylesheet"> 
        <script src="js/wow.min.js"></script>
        <script>
        new WOW().init();


function login() {
    //alert("login");
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var admin = document.getElementById("admin").checked;
    var merchant = document.getElementById("merchant").checked;
    var user = document.getElementById("user").checked;
    var role = "";

                if (admin == true)
                {
                    role = "admin";
                }
                if (merchant == true)
                {
                    role = "merchant";
                   
                }
                if ( user== true)
                {
                    role = "user";
                   
                }
//alert(role);
    if (email == "" || password == "" || role == "")
    {
        alert("Please fill all Values");
        //                    document.getElementById("errormessage").innerHTML = "Please fill all fields";
        //                    document.getElementById("errormessage").style.color = "red";
    } else
    {
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {

            if (xml.readyState == 4 && xml.status == 200)
            {
                var res = xml.responseText;
                res = res.trim();
               // console.log(res);
                if (res == "success")
                {
                    location.href="index.jsp"
                   // alert("Login Successfull");
                    //                                document.getElementById("errormessage").innerHTML = "Login Successful";
                    //                                document.getElementById("errormessage").style.color = "green";

                    //  setInterval(gotohome,1000);

                } else
                {
                    alert("Invalid username/password/Role");
                    //                                document.getElementById("errormessage").innerHTML = "Invalid username/password";
                    //                                document.getElementById("errormessage").style.color = "red";

                }
            }

        };
        var querystring = "email=" + email + "&password=" + password + "&role=" + role;
        xml.open("get", "login?" + querystring, true);
        xml.send();
    }
}

        </script>
        <style>
            #blink:hover{
                background-color: #ff6600;

            }
        </style>
        <!-- //animation-effect -->
        <link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,300,700,900' rel='stylesheet' type='text/css'></head>

    <body>
        <!-- header -->
        <%session.removeAttribute("email");%>
        <%session.removeAttribute("order_id");%>
        <%session.removeAttribute("role");%>

        <div class="header">

            <jsp:include page="/header.jsp"/>
           
        </div>
        <!-- //header -->
        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Login</h2>
                <h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index.jsp">Home</a><label>/</label>Login</h3>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- contact -->
        <div class="login">
            <div class="container">
                <form>
                    <div class="col-md-6 login-do1 animated wow fadeInLeft" data-wow-delay=".5s">
                        <div class="login-mail">
                            <input type="text" placeholder="Email" required="" id="email" name="email">
                            <i class="glyphicon glyphicon-envelope"></i>
                        </div>
                        <div class="login-mail">
                            <input type="password" placeholder="Password" required="" id="password" name="password">
                            <i class="glyphicon glyphicon-lock"></i>
                            
                        </div>
                         <label for="gender">Select Your Role:</label>
                        <div class="login-mail">

                            <input type="radio" id="admin" name="role" value="admin">
                            <label for="male">Admin</label><br>
                            <input type="radio" id="merchant" name="role" value="merchant">
                            <label for="female">Merchant</label><br>
                            <input type="radio" id="user" name="role" value="user">
                            <label for="female">User</label><br>
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
<!--                        				   <a class="news-letter " href="#">
                                                                         <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>Forgot Password</label>
                                                               </a>-->
 <a href="forgetpassword.jsp">Forget Password</a>   

 
                    </div>
                    <div class="col-md-5 login-do animated wow fadeInRight" data-wow-delay=".5s">
                        <label class="hvr-sweep-to-top login-sub">
                            <input type="button" value="Login" class="btn-block btn-primary" id="blink" onclick="login()" style="height: 40px"/>
                        </label>
                       
                        <p>Do not have an account?</p>
                        <a href="signup.jsp" class="hvr-sweep-to-top">Signup</a>
                    </div>
                    

                    <div class="clearfix"> </div>
                </form>

            </div>
        </div>


        <!--<div class="social animated wow fadeInUp" data-wow-delay=".1s">
                <div class="container">
                        <div class="col-sm-3 social-ic">
                                <a href="#">FACEBOOK</a>
                        </div>
                        <div class="col-sm-3 social-ic">
                                <a href="#">TWITTER</a>
                        </div>
                        <div class="col-sm-3 social-ic">
                                <a href="#">GOOGLE+</a>
                        </div>
                        <div class="col-sm-3 social-ic">
                                <a href="#">PINTEREST</a>
                        </div>
                <div class="clearfix"></div>
                </div>
        </div>-->

        <!-- footer -->
        <div class="footer">
            <div class="container">
                <div class="footer-top">
                    <div class="col-md-9 footer-top1">
                      
                        <div class="copy-right animated wow fadeInUp" data-wow-delay=".5s">
                            <p style="align:right">&copy 2021 Quick Mart. All rights reserved | Design by Anchal Arora</p>
                        </div>
                    </div>
                </div></div></div>
                <!-- //footer -->
                </body>
                </html>

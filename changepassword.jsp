<%-- 
    Document   : login
    Created on : 8 Nov, 2021, 12:26:07 PM
    Author     : dell
--%>

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


function changepassword() {
    var email = document.getElementById("email").value;
    var old_password = document.getElementById("old_password").value;
        var new_password = document.getElementById("new_password").value;
    var confirm_password = document.getElementById("confirm_password").value;


    if (email == "" || old_password == ""||new_password==""||confirm_password=="")
    {
        alert("Please fill all Values");
        //                    document.getElementById("errormessage").innerHTML = "Please fill all fields";
        //                    document.getElementById("errormessage").style.color = "red";
    } else if(new_password!=confirm_password){
        alert("New Password and Confirm Password are mismatch")
    }
    else
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
                  alert("Password Changed Successfully ");
                  location.href="login.jsp";
                    //                                document.getElementById("errormessage").innerHTML = "Login Successful";
                    //                                document.getElementById("errormessage").style.color = "green";

                    //  setInterval(gotohome,1000);

                } else
                {
                    alert("Invalid username/password");
                    //                                document.getElementById("errormessage").innerHTML = "Invalid username/password";
                    //                                document.getElementById("errormessage").style.color = "red";

                }
            }

        };
        var querystring = "email=" + email + "&old_password=" + old_password +"&new_password=" + new_password;
        xml.open("get", "changepassword?" + querystring, true);
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
        <div class="header">
           <jsp:include page="/header.jsp"/>iv>
         
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
                <% String email=session.getAttribute("email").toString(); %>
                <form>
                    <div class="col-md-6 login-do1 animated wow fadeInLeft" data-wow-delay=".5s">
                        <div class="login-mail">
                            <input type="text" readonly="" id="email" name="email" value="<%=email %>">
                            <!--<i class="glyphicon glyphicon-envelope"></i>-->
                        </div>
                        <div class="login-mail">
                            <input type="password" placeholder="Enter Old Password" required="" id="old_password" name="old_password">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                         <div class="login-mail">
                            <input type="password" placeholder="Enter new Password" required="" id="new_password" name="new_password">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                         <div class="login-mail">
                            <input type="password" placeholder="Confirm Password" required="" id="confirm_password" name="confirm_password">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                        <!--				   <a class="news-letter " href="#">
                                                                         <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>Forgot Password</label>
                                                                   </a>-->


                    </div>
                    <div class="col-md-6 login-do animated wow fadeInRight" data-wow-delay=".5s">
                        <label class="hvr-sweep-to-top login-sub">
                            <input type="button" value="Change" class="btn-block btn-primary" id="blink" onclick="changepassword()">
                        </label>
<!--                        <p>Do not have an account?</p>
                        <a href="signup.jsp" class="hvr-sweep-to-top">Signup</a>-->
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
                        <!--		<h4>Duis aute irure dolor in reprehenderit in voluptate </h4>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse.Excepteur sint occaecat cupidatat 
                                                                        non proident Duis aute irure dolor in reprehenderit in voluptate velit esse</p>
                                        </div>
                                        <div class="col-md-3 footer-top2">
                                        <a href="contact.html">Contact Us</a>
                                        </div>
                                        <div class="clearfix"> </div>
                                        </div>
                                                <div class="footer-grids">
                                                        <div class="col-md-4 footer-grid animated wow fadeInLeft" data-wow-delay=".5s">
                                                                <h3>About Us</h3>
                                                                <p>Duis aute irure dolor in reprehenderit in voluptate velit esse.<span>Excepteur sint occaecat cupidatat 
                                                                        non proident, sunt in culpa qui officia deserunt mollit.</span></p>
                                                        </div>
                                                        <div class="col-md-4 footer-grid animated wow fadeInLeft" data-wow-delay=".6s">
                                                                <h3>Contact Info</h3>
                                                                <ul>
                                                                        <li><i class="glyphicon glyphicon-map-marker" ></i>1234k Avenue, 4th block, <span>New York City.</span></li>
                                                                        <li class="foot-mid"><i class="glyphicon glyphicon-envelope" ></i><a href="mailto:info@example.com">info@example.com</a></li>
                                                                        <li><i class="glyphicon glyphicon-earphone" ></i>+1234 567 567</li>
                                                                </ul>
                                                        </div>
                                                        <div class="col-md-4 footer-grid animated wow fadeInLeft" data-wow-delay=".7s">
                                                        <h3>Sign up for newsletter </h3>
                                                        <form>
                                                                <input type="text" placeholder="Email"  required="">
                                                                <input type="submit" value="Submit">
                                                        </form>
                                                
                                                        </div>
                                                
                                                        <div class="clearfix"> </div>
                                                </div>
                        -->
                        <div class="copy-right animated wow fadeInUp" data-wow-delay=".5s">
                            <p style="align:right">&copy 2021 Quick Mart. All rights reserved | Design by Anchal Arora</p>
                        </div>
                    </div>
                </div>
                <!-- //footer -->
                </body>
                </html>

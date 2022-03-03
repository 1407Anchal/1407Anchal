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


            var gotp;
            function checkemail() {
                var email = document.getElementById("email").value;
                var x = document.getElementById("one");
                var x1 = document.getElementById("one_1");
                var y = document.getElementById("two");
                var y1 = document.getElementById("two_2");





                if (email == "")
                {
                    alert("Please fill your email");
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
                            // alert(res);
                            console.log(res);
                            if (res == "fail") {
                                alert("Invalid email");
                            } else {
                                //  alert("correct email");

                                gotp = res;
                               // y = document.getElementById("").readOnly;
                                y.style.display = "none";
                               //  y.readonly = "true";

                                y1.style.display = "none";

                                x.style.display = "block";
                                x1.style.display = "block";

                            }

                        }

                    };
                    var querystring = "email=" + email;
                    xml.open("get", "forgetpassword?" + querystring, true);
                    xml.send();
                }
            }

            function checkotp() {
                var otp = document.getElementById("otp").value;

                var z = document.getElementById("three");
                var z1 = document.getElementById("three_1");
                var z2 = document.getElementById("three_2");

                var y = document.getElementById("one");
                var y1 = document.getElementById("one_1");





                if (otp == "")
                {
                    alert("Please fill your otp");
                    //                    document.getElementById("errormessage").innerHTML = "Please fill all fields";
                    //                    document.getElementById("errormessage").style.color = "red";
                } else if (otp == gotp) {
                    // alert("valid otp");
                    y.style.display = "none";
                    y1.style.display = "none";
                    z.style.display = "block";
                    z1.style.display = "block";
                    z2.style.display = "block";









                } else {
                    alert("Invalid otp");
                }
            }
            function clickpassword() {
                  var email = document.getElementById("email").value;
                //var old_password = document.getElementById("old_password").value;
                var new_password = document.getElementById("new_password").value;
                var confirm_password = document.getElementById("confirm_password").value;


                if (new_password == "" || confirm_password == "")
                {
                    alert("Please fill all Values");
                    //                    document.getElementById("errormessage").innerHTML = "Please fill all fields";
                    //                    document.getElementById("errormessage").style.color = "red";
                } else if (new_password != confirm_password) {
                    alert("New Password and Confirm Password must be same")
                } else
                {
                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function () {

                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            var res = xml.responseText;
                            res = res.trim();
                         //   alert(res);
                            // console.log(res);
                            if (res == "success")
                            {
                                alert("Password Changed Successfully ");
                                location.href = "login.jsp";
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
                           var querystring = "email=" + email +"&new_password=" + new_password;
 
                            xml.open("get", "forgetpassword1?" + querystring, true);
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
            <jsp:include page="/header.jsp"/>
            
        </div>

        <div class="banner-top">
            <div class="container">
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Login</h2>
                <h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index.jsp">Home</a><label>/</label>Login</h3>
                <div class="clearfix"> </div>
            </div>
        </div>

        <div class="login">
            <div class="container">
                <form>
                    <div class="col-md-6 login-do1 animated wow fadeInLeft" data-wow-delay=".5s">
                        <div class="login-mail" id="two">
                            <input type="text" placeholder="Enter Email" required="" id="email" name="email" >
                            <i class="glyphicon glyphicon-envelope"></i>
                            <!--<input type="button" value="Submit" class="btn-block btn-primary" id="blink" onclick="checkemail()" style="height: 40px">-->

                        </div>





                    </div>
                    <div class="col-md-5 login-do animated wow fadeInRight" data-wow-delay=".5s" id="two_2">
                        <label class="hvr-sweep-to-top login-sub">
                            <input type="button" value="Submit" class="btn-block btn-primary" id="blink" onclick="checkemail()" style="height: 40px">
                        </label>

                    </div>

                </form>

            </div>
        </div>
        <div class="login">
            <div class="container">
                <form>

                    <div class="col-md-6 login-do1 animated wow fadeInLeft" data-wow-delay=".5s">
                        <div class="login-mail" style="display: none" id="one">
                            <input type="text" placeholder="Enter OTP" required="" id="otp" name="otp">
                            <i class="glyphicon glyphicon-lock"></i>


                        </div>




                    </div>
                    <div class="col-md-5 login-do animated wow fadeInRight" data-wow-delay=".5s" style="display: none" id="one_1">
                        <label class="hvr-sweep-to-top login-sub">
                            <input type="button" value="Submit" class="btn-block btn-primary" id="blink" onclick="checkotp()" style="height: 40px">
                        </label>


                    </div>
                </form>

            </div>
        </div>

        <div class="login">
            <div class="container">
                <form>

                    <div class="col-md-6 login-do1 animated wow fadeInLeft" data-wow-delay=".5s" >
                        <div class="login-mail" style="display: none" id="three" >
                            <input type="text" placeholder="Enter New Password" required="" id="new_password" name="new_password">
                            <i class="glyphicon glyphicon-lock"></i>


                        </div>
                        <div class="login-mail" style="display: none" id="three_2" >
                            <input type="text" placeholder="Confirm Password" required="" id="confirm_password" name="confirm_password">
                            <i class="glyphicon glyphicon-lock"></i>


                        </div>




                    </div>
                    <div class="col-md-5 login-do animated wow fadeInRight" data-wow-delay=".5s" style="display: none" id="three_1">
                        <label class="hvr-sweep-to-top login-sub">
                            <input type="button" value="Submit" class="btn-block btn-primary" id="blink" onclick="clickpassword()" style="height: 40px">
                        </label>


                    </div>
                </form>

            </div>
        </div>



        <div class="footer">
            <div class="container">
                <div class="footer-top">
                    <div class="col-md-9 footer-top1">

                        <div class="copy-right animated wow fadeInUp" data-wow-delay=".5s">
                            <p style="align:right">&copy 2021 Quick Mart. All rights reserved | Design by Anchal Arora</p>
                        </div>
                    </div>
                </div>

                </body>
                </html>

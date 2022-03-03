<%-- 
    Document   : signup
    Created on : 8 Nov, 2021, 12:26:20 PM
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
            function hideURLbar(){ window.scrollTo(0,1); } </script>
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
            function signup() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var email = document.getElementById("email").value;
                var phoneno = document.getElementById("phoneno").value;

                var male = document.getElementById("male").checked;
                var female = document.getElementById("female").checked;

             //   var photo = document.getElementById("photo").files[0];
                var address = document.getElementById("address").value;

                var gender = "";

                if (male == true)
                {
                    gender = "male";
                }
                if (female == true)
                {
                    gender = "female";
                   
                }
                //if(phoneno)
             

                // alert(gender);    


                if (username == "" || password == "" || email == "" || phoneno == "" || gender == "" || address == "")
                {
                    alert("Please fill all values");
                    //                    document.getElementById("errormessage").innerHTML = "Please fill all fields";
                    //                    document.getElementById("errormessage").style.color = "red";
                }
                  else if(phoneno.length!=10){
                   alert("Invalid Phone Number");
                 //  break;
               }
               else if(email.indexOf('@')== -1){
                   alert("Invalid Email Id");
                   
               }
               else if(email.indexOf('.')== -1){
                   alert("Inavalid Email Id");
                   
               }
             //  else if()
                
                else 
                {
                   // var formdata = new FormData();
//                    formdata.append("username", username);
//                    formdata.append("password", password);
//                    formdata.append("email", email);
//                    formdata.append("phoneno", phoneno);
//
//                    formdata.append("gender", gender);
////                    formdata.append("female", female);
//                    formdata.append("photo", photo);
//                    formdata.append("address", address);

                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function () {

                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            var res = xml.responseText;
                            res = res.trim();
                             alert(res);
                            if (res == "success")
                            {
                                alert("You are registered successfully.. all details are sent on ur mail");

                                document.getElementById("username").value = "";
                                document.getElementById("password").value = "";
                                document.getElementById("email").value = "";
                                document.getElementById("phoneno").value = "";
                                document.getElementById("male").value = "";
                                document.getElementById("female").value = "";

                                document.getElementById("photo").value = "";
                                document.getElementById("address").value = "";
                                 location.href="login.jsp";

                            } else 
                            {
                                alert("This Email id already Exists");

                            }
//                        
//                           

                        }

                    };
                     var queryString= "email=" + email + "&password=" + password + "&username=" + username + "&phoneno=" + phoneno + "&address=" + address + "&gender=" + gender;

                    xml.open("post", "merchantsignup?"+ queryString, true);
                    xml.send();

                }

            }
        </script>
        <!-- //animation-effect -->
        <link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,300,700,900' rel='stylesheet' type='text/css'></head>
    <style>
        #blink:hover{
            background-color: #ff6600;

        }
/*        #phoneno{
            required:true,
                minlength:9;
                maxlength:1;,
                number: true
        }*/
    </style>

    <body>
        <!-- header -->
        <div class="header">
          <jsp:include page="/header.jsp"/>
         
        </div>
        <!-- //header --><!--banner-->
        <div class="banner-top">
            <div class="container">
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Merchant  &nbsp;&nbsp;SignUp</h2>
                <h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index.jsp">Home</a><label>/</label>Register</h3>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- contact -->
        <div class="login">
            <div class="container">
                <form>
                    <div class="col-md-6 login-do1 animated wow fadeInLeft" data-wow-delay=".5s">
                        <div class="login-mail">
                            <input type="text" placeholder="Username" required="" id="username" name="username">
                            <!--					<i class="glyphicon glyphicon-envelope"></i>-->
                        </div>
                        <div class="login-mail">
                            <input type="password" placeholder="Password" required="" id="password" name="password">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                        <div class="login-mail">
                            <input type="text" placeholder="Email" required="" id="email" name="email">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                        <div class="login-mail">
                            <input type="text" placeholder="Mobile Number" required="" id="phoneno" name="phoneno">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>

                        <label for="gender">Choose Gender:</label>
                        <div class="login-mail">

                            <input type="radio" id="male" name="gender" value="male">
                            <label for="male">Male</label><br>
                            <input type="radio" id="female" name="gender" value="female">
                            <label for="female">Female</label><br>
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                       
                        <div class="login-mail">
                            <input type="text" placeholder="Address" required="" id="address" name="address">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>


                    </div>
                    <div class="col-md-6 login-do animated wow fadeInRight" data-wow-delay=".5s">
                        <label class="hvr-sweep-to-top login-sub">
                            <input type="button" value="SignUp" class="btn-block btn-primary" id="blink" onclick="signup()" style="height: 40px">
                        </label>
                        <p>Already have an account</p>
                        <a href="merchant_login.jsp" class="hvr-sweep-to-top">Login</a>
                    </div>
                    <div class="clearfix"> </div>
                </form>
            </div>


        </div>
       

        <!-- footer -->
        <div class="footer">
            <div class="container">
                <div class="footer-top">
                    <div class="col-md-9 footer-top1">
                       
                        <div class="copy-right animated wow fadeInUp" data-wow-delay=".5s">
                            <p>&copy 2021Quick Mart | Design by Anchal Arora</p>
                        </div>
                    </div>
                </div>
                <!-- //footer -->
                </body>
                </html>
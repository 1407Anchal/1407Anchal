<%-- 
    Document   : contact
    Created on : 25 Nov, 2021, 10:35:18 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Quick Mart</title>
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
        </script>
        <script>
            function message() {
               // alert("hello");
                var username = document.getElementById("username").value;

                var email = document.getElementById("email").value;
                var msg = document.getElementById("msg").value;
                if (username == "" || email == "" || msg == "")
                {
                    alert("Please fill all values");
                   
                } else if (email.indexOf('@') == -1) {
                    alert("Invalid Email Id");

                } else if (email.indexOf('.') == -1) {
                    alert("Inavalid Email Id");

                }
                else
                {
                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function () {

                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            var res = xml.responseText;
                            res = res.trim();
                         //   alert(res);
                            
                            if (res == "success")
                            {
                                alert("Thankyou for Your FeedBack")
                                document.getElementById("username").value = "";

                                document.getElementById("email").value = "";
                                document.getElementById("msg").value = "";

                                
                            } else
                            {
                                alert("Something went wrong");


                            }
                        }

                    };
                    var querystring = "username=" + username + "&email=" + email + "&msg=" + msg;
                            xml.open("post", "contact?" + querystring, true);
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
    <link rel="icon" href="images/one.jpeg">	
    <body>
        <!-- header -->
        <div class="header">
            <jsp:include page="/header.jsp"/>
        </div>
        <!-- //header -->
        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Contact</h2>
                <h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index.jsp">Home</a><label>/</label>Contact</h3>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- contact -->
        <div class="contact">
            <div class="container">


                <div class="col-md-8 contact-grids1 animated wow fadeInRight" data-wow-delay=".5s">
                    <form>
                        <div class="contact-form2">
                            <h4>Name</h4>

                            <input type="text" placeholder="" required="" id="username" name="username">

                        </div>


                        <div class="contact-form2">
                            <h4>Email</h4>
                            <input type="email" placeholder="" required="" id="email" name="email">
                        </div>
                        <div class="contact-me ">
                            <h4>Message</h4>

                            <textarea type="text"  placeholder="" required="" id="msg" name="msg"> </textarea>
                        </div>
                        <input type="button" value="Submit" class="btn-lg btn-primary" id="blink" onclick="message()" style="height: 50px ; font-size: x-large ; margin-left: 620px"/>

                    </form>                            

                </div>



            </div>
        </div>
    </div>

    <!-- //contact -->


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

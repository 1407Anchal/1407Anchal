<%-- 
    Document   : signup
    Created on : 8 Nov, 2021, 12:26:20 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
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
            function add() {
                var catname = document.getElementById("catname").value;
                var photo = document.getElementById("photo").files[0];
                var shopname  = document.getElementById("shopname").value;
               
              
  


                if (catname == ""  || photo == "" || shopname == "")
                {
                    alert("Please fill all values");
                    //                    document.getElementById("errormessage").innerHTML = "Please fill all fields";
                    //                    document.getElementById("errormessage").style.color = "red";
                }
                 
                
                else 
                {
                    var formdata = new FormData();
                    formdata.append("catname", catname);
                    formdata.append("photo", photo);
                    formdata.append("shopname", shopname);

                   
                   

                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function () {

                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            var res = xml.responseText;
                            res = res.trim();
                            // alert(res);
                            if (res == "success")
                            {
                                alert("Category Added Successfully ");

                                document.getElementById("catname").value = "";
                               
                                document.getElementById("photo").value = "";
                                document.getElementById("shopname").value = "";
                                
                            //    location.href="login.jsp";


                            } else 
                            {
                                alert("Something Went Wrong");

                            }
//                        
//                           

                        }

                    };
                    xml.open("post", "addcategory", true);
                    xml.send(formdata);

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

    </style>

    <body>
        <!-- header -->
        <div class="header">
          <jsp:include page="/header.jsp"/>
         
        </div>
        <!-- //header --><!--banner-->
        <div class="banner-top">
            <div class="container">
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Add &nbsp;&nbsp;Categories</h2>
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
                            <input type="text" placeholder="Enter Category Name" required="" id="catname" name="catname">
                            					
                        </div>
                        
                         <div class="login-mail">
                            <label>Choose Photo: </label>
                            <input type="file" id="photo"  required="">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                       

                        
                       
                        <div class="login-mail">
                            <input type="text" placeholder="Enter Shop Name" required="" id="shopname" name="shop">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                       
                         <label>
                            <input type="button" value="Add Category" class="btn-lg btn-primary" id="blink" onclick="add()" style="height: 60px;margin-left: 360px;font-size: x-large">
                        </label>
                       </div>
                        </div>
                      </div>
                    <br><br>
                   
                    <div class="clearfix"> </div>
                </form>
            </div>


        </div>
         <br><br>
      
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
                </div>
            </div>
                <!-- //footer -->
                </body>
                </html>
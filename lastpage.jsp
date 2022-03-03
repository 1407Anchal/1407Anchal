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

window.onload = function() {
                var order_id = '<%= session.getAttribute("order_id") %>';
                //alert("order_id "+order_id);
                console.log("order_id "+order_id);
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function () {

                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                       // alert("res "+res);                                             
                    }

                };                
                var querystring1 = "order_id=" + order_id;
                console.log("1111111111111111111111111 "+order_id);
                xml.open("get", "placeorder?" + querystring1, true);
                console.log("111111111111111122222222222222222111111111 "+order_id);
                xml.send();
            };          

        </script>
        <script>
            function ref(){
                location.href="index.jsp";
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
        <%
                       session.removeAttribute("order_id");
        %>
        <div class="header">

            <jsp:include page="/header.jsp"/>
           
        </div>
       <div>
           
            <%
                        String toPlacedOrderId=request.getParameter("order_id").toString();
            %>
            <div class="container">
                
                <h2 class="text-center" style="font-size: 400%; font-family: fantasy">Your Order Id is: <%=toPlacedOrderId%></h2>
           <br><br>
           
           <h1 class="text-center" style="font-size: 700%;font-family: fantasy;">Thanks for Shopping.........</h1>
           <input type="button" value="Continue&nbsp; Shopping" class="btn-lg btn-primary text-center" id="blink"  style="height: 60px; margin-top: 40px; margin-left: 450px; font-size: x-large" onclick="ref()"/>

           </div>
          
       
       </div>               
       
           <br><br><br><br>
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

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
           </script>
             <script>
        function payment(order_id)
        {
            //alert("order_id choose pay "+order_id);
            var online = document.getElementById("online").checked;
            var cash = document.getElementById("cash").checked;
            if (cash === true)
            {
              
                window.location.href = "lastpage.jsp?order_id=" + order_id;
            } else if (online === true)
            {
               
                window.location.href = "online_pay.jsp?order_id=" + order_id; 
                       
            } else
            {
                alert("Please select the Mode of Payment!");
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
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Choose &nbsp;Payment &nbsp;Method</h2>
                <h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index.jsp">Home</a><label>/</label>Register</h3>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- contact -->
        <div class="login">
            <div class="container">
                
                  <div style="border: 1px solid rgba(0,0,0,0.1);padding: 20px;background-clip: content-box;">    
                <div class="row" >
                    <div class="col-sm-2" style="font-size: x-large; margin-left: 30px"></div>
                    <div class="col-sm-2" style="font-size: x-large;"></div>
                    <div class="col-sm-4" style="font-size: x-large;text-align: center">
                        <input type="radio"  id="cash" name="r1" value="cash on delivery" />Cash On Delivery<br>
                       
                    </div> 
                    <div class="col-sm-2" style="font-size: x-large; margin-left: 30px"></div>
                    <div class="col-sm-2" style="font-size: x-large;"></div>
                    
                    
                    
                     <div class="col-sm-12" style="font-size: x-large;text-align: center ">
                       
                         <input type="radio"  id="online" name="r1" value="pay online"/>Pay Online
                    </div> 
<!--                    <div class="col-sm-2" style="font-size: x-large;"></div>
                    <div class="col-sm-2" style="font-size: x-large;"></div>-->

                </div><br>
                
                
                <%
                String order_id = request.getSession().getAttribute("order_id") != null ? request.getSession().getAttribute("order_id").toString() : null;
                %>
                <button class="btn btn-lg btn-primary" style="width: 100%;" onclick="payment(<%=order_id%>)">Make A Payment</button>
                
            </div>
           
               
             
                

            </div>


        </div>
                   <br><br><br><br>
                       

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
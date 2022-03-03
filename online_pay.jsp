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
                function payonline(order_id){
                    location.href="online_pay.jsp?order_id"+order_id;
                    
                    
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
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Pay &nbsp;Online</h2>
                <h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index.jsp">Home</a><label>/</label>Register</h3>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- contact -->
        <div class="login">
            <div class="container">
                  <%
                   String order_id=request.getParameter("order_id");
                   ResultSet rs2 = vmm.DBLoader.executeStatement("select * from orders where order_id=" + order_id);
                        if(rs2.next()){
                        String price1=rs2.getString("price");
                        int p1=Integer.parseInt(price1);
                        int tp=p1+150;                                           
                  %>
                
                
            <form action="lastpage.jsp?order_id=<%=order_id%>" method="post">
                  
                <div>
                    <input type="text" value=&#x20B9;&nbsp;<%=tp+".00"%> required="" id="pay" name="pay" class="col-xs-4" style="height: 40px; margin-top: 20px;margin-right: 20px" disabled> &nbsp;&nbsp;

                </div>
                <script
                src="https://checkout.razorpay.com/v1/checkout.js"
                data-key="rzp_test_96HeaVmgRvbrfT"
                data-amount="<%=tp%>00"
                data-buttontext="Pay with Razorpay"
                data-name="QuickMart"            
                data-image="images/one.jpeg"
                data-prefill.name="QuickMart"
                data-theme.color="red">
                </script>
                            
                             <br><br>
             <div class="clearfix"> </div>

            </form>
                   <%}%>
             
                

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
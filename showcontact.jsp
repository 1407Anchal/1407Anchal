<%-- 
    Document   : addtocart
    Created on : 18 Nov, 2021, 9:51:54 PM
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
            function addtocart(product_id) {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function () {

                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                        //alert(res);
                        // console.log(res);
                        if (res == "success")
                        {
                           //alert("Item Added to Cart from cart page");
                           $( ".cartdata" ).load(window.location.href + " .cartdata" );
                           $( ".totalprice" ).load(window.location.href + " .totalprice" );
                            xml1.send();

                        } else if (res == "notlogin")
                        {
                            //alert("Please login First");
                            location.href = "login.jsp";


                        }
                    }

                };
                var querystring = "product_id=" + product_id;
                xml.open("get", "addtocart?" + querystring, true);
                xml.send();
                
                var xml1 = new XMLHttpRequest();
                xml1.onreadystatechange = function () {

                    if (xml1.readyState == 4 && xml1.status == 200)
                    {
                        var res1 = xml1.responseText;
                        res1 = res1.trim();
                        //alert("res 1"+res1);
                       // alert("header updqted ");
                       // location.href = "productdetails.jsp";
                       document.getElementById("noofitems").innerHTML = res1+" items";
                    }

                };

               
                xml1.open("get", "help", true);
               
            }


        </script>
        <script>
            
            function removefromcart(product_id){
                 var xml = new XMLHttpRequest();
                xml.onreadystatechange = function () {

                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                       // alert(res);
                        // console.log(res);
                        if (res == "success")
                        {
                          // alert("Item removed from the cart");
                           $( ".cartdata" ).load(window.location.href + " .cartdata" );
                           $( ".totalprice" ).load(window.location.href + " .totalprice" );
                            xml1.send();

                        } else if (res == "notlogin")
                        {
                            alert("Please login First");
                            location.href = "login.jsp";


                        }
                    }

                };
                var querystring = "product_id=" + product_id;
                xml.open("get", "removefromcart?" + querystring, true);
                xml.send();
                
                var xml1 = new XMLHttpRequest();
                xml1.onreadystatechange = function () {

                    if (xml1.readyState == 4 && xml1.status == 200)
                    {
                        var res1 = xml1.responseText;
                        res1 = res1.trim();
                        //alert("res 1"+res1);
                       // alert("header updqted ");
                       // location.href = "productdetails.jsp";
                       document.getElementById("noofitems").innerHTML = res1+" items";
                    }

                };

               
                xml1.open("get", "help", true);
               
            }
        </script>
<!--        <script>
            function placeorder(order_id){
                //alert(order_id);
                 var xml = new XMLHttpRequest();
                xml.onreadystatechange = function () {

                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                        //alert(res);
                        // console.log(res);
                        if (res == "success")
                        {
                           //alert("Item Added to Cart from cart page");
                           $( ".cartdata" ).load(window.location.href + " .cartdata" );
                           $( ".totalprice" ).load(window.location.href + " .totalprice" );
                           location.href="lastpage.jsp"
                            xml1.send();

                        } else if (res == "notlogin")
                        {
                            //alert("Please login First");
                            location.href = "login.jsp";


                        }
                    }

                };
                var querystring = "order_id=" + order_id;
                xml.open("get", "placeorder?" + querystring, true);
                xml.send();
                
                var xml1 = new XMLHttpRequest();
                xml1.onreadystatechange = function () {

                    if (xml1.readyState == 4 && xml1.status == 200)
                    {
                        var res1 = xml1.responseText;
                        res1 = res1.trim();
                        //alert("res 1"+res1);
                       // alert("header updqted ");
                       // location.href = "productdetails.jsp";
                       document.getElementById("noofitems").innerHTML = res1+" items";
                    }

                };

               
                xml1.open("get", "help", true);
            }
        </script>-->
<script>
    function buy(){
        location.href = "address.jsp";
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
        <!-- //header -->
        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Show Contacts</h2>
                <h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index.jsp">Home</a><label>/</label>Add To Cart</h3>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- contact -->
        <div class="check-out">	 
            <div class="container">	 

                <script>$(document).ready(function (c) {
                        $('.close1').on('click', function (c) {
                            $('.cross').fadeOut('slow', function (c) {
                                $('.cross').remove();
                            });
                        });
                    });
                </script>
                <script>$(document).ready(function (c) {
                        $('.close2').on('click', function (c) {
                            $('.cross1').fadeOut('slow', function (c) {
                                $('.cross1').remove();
                            });
                        });
                    });
                </script>	
                <script>$(document).ready(function (c) {
                        $('.close3').on('click', function (c) {
                            $('.cross2').fadeOut('slow', function (c) {
                                $('.cross2').remove();
                            });
                        });
                    });
                </script>
                <div class="cartdata">
                <table class="table fadeInLeft  table-bordered">
                    <!--     ------------------Table Headings----------------->
                    <tr>
                        <th class="t-head">Contact_Id</th>
                        <th class="t-head col-sm-3">Name</th>
                        <th class="t-head col-sm-5">Email</th>
                        <th class="t-head col-sm-5">Message</th>

                    </tr>
                    <!------------------Table Columns------------------------------>


                    <%
                       
                        ResultSet rs = vmm.DBLoader.executeStatement("select * from contact");
                        while (rs.next()) {

                            String contact_id = rs.getString("contact_id");
                            String name = rs.getString("name");
                            String email=rs.getString("email");
                            String message =rs.getString("message");
                   %>
                    <tr class="cross">
                      <td>
                            <div class="sed">
                                <h5><%=contact_id%></h5>
                            </div>
                            <div class="clearfix"> </div>
                            
                        </td>
                        
                        <td>
                            <div class="sed">
                                <h5><%=name%></h5>
                            </div>
                            <div class="clearfix"> </div>
                            
                        </td>
                        
                        <td>
                            <div class="sed">
                                <h5><%=email%></h5>
                            </div>
                        
                        <div class="clearfix"> </div>
                        </td>

                        
                        <td>

                            <div class="sed"><h5><%=message%></h5></div>

                        </td>

                    </tr>
                   
                    <% 
                        }%>
                </table></div>
            

            </div>
        </div>

        <br><br>
        <!--quantity-->



        <!-- footer -->
       <div class="clearfix"></div>


    <div class="footer">
        <div class="container">
            <div class="footer-top">
                <div class="col-md-9 footer-top1">


                    <div class="copy-right animated wow fadeInUp" data-wow-delay=".5s">
                        <p>&copy 2021 Quick Mart. All rights reserved | Design by Anchal arora</p>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- //footer -->
    </body>
</html>

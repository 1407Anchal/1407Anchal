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
          

        
    function vieworderdetails(order_id){
       location.href="vieworderdetail.jsp?order_id="+order_id;
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
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Order History</h2>
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
                <table class="container">
                    <!--     ------------------Table Headings----------------->
                    <tr>
                        <th class="t-head">Order No</th>
                        <th class="t-head">Name</th>
                        <th class="t-head">Order Placed</th>
                        <th class="t-head">Mobile Number</th>
                        <th class="t-head">Total Price</th>
                        <th class="t-head"></th>

                        
                    </tr>
                    <br>
                    <!------------------Table Columns------------------------------>


                    <%
                        String email = request.getSession().getAttribute("email").toString();
                        System.out.println("email*********************** "+email);
                        ResultSet rs = vmm.DBLoader.executeStatement("select * from orders where email= '"+email+"' and status='placed' order by date_time desc");
                        while (rs.next()) {
                            System.out.println("********while*********************** ");                        
                            String total_price=rs.getString("price");
                            int order_id = rs.getInt("order_id");
                            int address_id = rs.getInt("address_id");
                            String date_time = rs.getString("date_time");
                            System.out.println("********while*********************** "+address_id);    
                            ResultSet rs1 = vmm.DBLoader.executeStatement("select * from address where address_id=" + address_id);
                            if (rs1.next()) {
                                
                                String firstname = rs1.getString("firstname");
                                String lastname = rs1.getString("lastname");
                                String phoneno = rs1.getString("phoneno");
                                System.out.println("********if*********************** "+firstname);    
                       
                    %>
                    <tr class="cross">
                 
                    <td>
                        <div class="sed"><h5><%=order_id%></h5></div> 
                        <div class="clearfix"></div>
                    </td>
                                         
                    <td>
                        <div class="sed">
                            <h5><%=firstname%> <%=lastname%></h5>
                        </div>
                        <div class="clearfix"> </div>

                    </td>
                        
                     <td class="sed"><h5><%=date_time%></h5></td>
                        
                     <div class="clearfix"> </div>

                   <td>
                        <div class="sed">
                            <h5><%=phoneno%></h5>
                        </div>
                        <div class="clearfix"> </div>

                    </td>


                    <td>
                        <div class="sed"><h5>&#x20B9; <%=total_price%></h5></div>
                        <div class="clearfix"> </div>
                    </td>
                   
                
                    <td><br><br><br>
                        <div class="sed"> <input type="button" value="View Details" class="bg-primary btn-lg" id="blink" onclick="vieworderdetails(<%=order_id%>)"></div>
                    </td>

                    </tr>
                   
                    <% }
                       
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

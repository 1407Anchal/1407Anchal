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
            function viewmerchants(email, status) {
               
             var xml = new XMLHttpRequest();
                xml.onreadystatechange = function () {

                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                       
                        if (res == "success")
                        {
                            
                            $( ".cartdata" ).load(window.location.href + " .cartdata" );

                        } else if (res == "fail")
                        {
                            alert("Something went wrong!!!");

                        }
                    }

                };
                var querystring = "email="+email+"&status="+status;
                xml.open("get", "show_merchants?" + querystring, true);
                xml.send();

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
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Show Merchants</h2>
                <h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index.jsp">Home</a><label>/</label>Add To Cart</h3>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- contact -->
        <div class="check-out">	 
            <div class="container-fluid">	 

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
                        <th class="t-head col-sm-3">Name</th>
                        <th class="t-head col-sm-4">Email</th>
                        <th class="t-head col-sm-4">Mobile Number</th>
                        <th class="t-head col-sm-7">Address</th>
                        <th class="t-head col-sm-5">Gender</th>
                        <th class="t-head col-sm-5">Status</th>
                        <th class="t-head col-sm-3">Approve/Disapprove</th>

                    </tr>
                    <!------------------Table Columns------------------------------>


                    <%
                       
                        ResultSet rs = vmm.DBLoader.executeStatement("select * from users where role='merchant'");
                        while (rs.next()) {

                            String username = rs.getString("username");
                            String address = rs.getString("address");
                            String email=rs.getString("email");
                            String phoneno =rs.getString("phoneno");
                            String gender =rs.getString("gender");
                            String active =rs.getString("active");

                   %>
                  
                    <tr class="cross">
                      <td>
                            <div class="sed">
                                <h5 style="text-transform:capitalize;"><%=username%></h5>
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
                            <div class="sed">
                                <h5><%=phoneno%></h5>
                            </div>
                        
                        <div class="clearfix"> </div>
                        </td>

                        
                        <td>

                            <div class="sed"><h5 style="text-transform:capitalize;"><%=address%></h5></div>
                            <div class="clearfix"> </div>

                        </td>
                         <td>

                            <div class="sed"><h5 style="text-transform:capitalize;"><%=gender%></h5></div>
                            <div class="clearfix"> </div>

                        </td>
                          <td>
                            <%if(active.equals("0")) {%>    
                                <div class="sed"><h5>Disable</h5></div>
                            <%} else if(active.equals("1")) {%>
                                <div class="sed"><h5>Active</h5></div>
                            <%}%>
                            
                            <div class="clearfix"> </div>

                        </td>
                         <td><br><br><br>
                            
                        <%if(active.equals("0")) {%>    
                            <div class="sed"> <input type="button" value="Approve" class="bg-primary btn-lg" id="blink" style="width: 200px" onclick="viewmerchants('<%=email%>','0')"></div>
                        <%} else if(active.equals("1")) {%>
                            <div class="sed"> <input type="button" value="Disapprove" style="width: 200px" class="bg-primary btn-lg" id="blink" onclick="viewmerchants('<%=email%>','1')"></div>
                        <%}%>
                            
                        </td>

                    </tr>
                   </div>
                   
                    <% 
                        }%>
                </table>            

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

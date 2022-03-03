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
            window.onload = function() {
                
             removeCart();                
            };
            
            function removeCart() {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function () {

                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                        if (res.indexOf("oos found") !== -1)
                        {
                           alert("Item is Out of Stock "+res);
                            
                           $( ".cartdata" ).load(window.location.href + " .cartdata" );
                           $( ".totalprice" ).load(window.location.href + " .totalprice" );
                            

                        } else if (res === "notlogin")
                        {                            
                            
                        }                                                
                    }

                };                
                xml.open("get", "removeoositem" , true);
                xml.send();
            }
        </script>
         <script>
            function addtocart(product_id) {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function () {

                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                        //alert(res);
                        // console.log(res);
                        if (res === "success")
                        {
                           
                           $( ".cartdata" ).load(window.location.href + " .cartdata" );
                           $( ".totalprice" ).load(window.location.href + " .totalprice" );
                           xml1.send();

                        } else if (res === "notlogin")
                        {                            
                            location.href = "login.jsp";
                        }
                        else if (res === "Out of Stock")
                        {
                            alert("You have Selected Maximum Qty.");                            
                        }
                        else if (res === "Item no longer valid")
                        {
                            alert("You have Selected Maximum Qty.");                            
                        }
                        
                        
                    }

                };
                var querystring = "product_id=" + product_id;
                xml.open("get", "addtocart?" + querystring, true);
                xml.send();
                
                var xml1 = new XMLHttpRequest();
                xml1.onreadystatechange = function () {

                    if (xml1.readyState === 4 && xml1.status === 200)
                    {
                        var res1 = xml1.responseText;
                        res1 = res1.trim();                       
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

                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
             
                        if (res === "success")
                        {       
                           $( ".cartdata" ).load(window.location.href + " .cartdata" );
                           $( ".totalprice" ).load(window.location.href + " .totalprice" );
                            xml1.send();

                        } else if (res === "notlogin")
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

                    if (xml1.readyState === 4 && xml1.status === 200)
                    {
                        var res1 = xml1.responseText;
                        res1 = res1.trim();
                        
                        document.getElementById("noofitems").innerHTML = res1+" items";
                    }

                };

               
                xml1.open("get", "help", true);
               
            }
        </script>

<script>
    function buy(){
           removeCart();                
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
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Add To Cart</h2>
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
                <table class="table fadeInLeft">
                    <!--     ------------------Table Headings----------------->
                    <tr>
                        <th class="t-head">Product</th>
                        <th class="t-head">Name</th>
                        <th class="t-head">Price</th>
                        <th class="t-head">Quantity</th>
                        <th class="t-head">Total</th>
                    </tr>
                    <!------------------Table Columns------------------------------>


                    <%
                        String order_id = request.getSession().getAttribute("order_id") != null ? request.getSession().getAttribute("order_id").toString() : null;
                        //String product_id = request.getParameter("product_id");
                        ResultSet rs = vmm.DBLoader.executeStatement("select * from order_details where order_id=" + order_id);
                        while (rs.next()) {

                            String product_id = rs.getString("product_id");
                            String qty = rs.getString("qty");
                            String total_price=rs.getString("total_price");
                            ResultSet rs1 = vmm.DBLoader.executeStatement("select * from products where product_id=" + product_id);
                            if (rs1.next()) {

                                String product_name = rs1.getString("product_name");
                                String product_description = rs1.getString("product_description");
                                String price = rs1.getString("price");
                                String brand = rs1.getString("brand");
                                String catname = rs1.getString("catname");
                                String product_image = rs1.getString("product_image");
//                                int q1 = Integer.parseInt(qty);
//                                int p1 = Integer.parseInt(price);
//                                int total_price = q1 * p1;
                       
                        


                    %>
                    <tr class="cross">
                        <td><a href="#"><img src=<%=product_image%>  alt="" height="200px" width="160px"></a></td>
                        
                        <td>
                            <div class="sed">
                                <h5><%=product_name%></h5>
                            </div>
                            <div class="clearfix"> </div>
                            
                        </td>
                        
                        <td class="sed"><h5>&#x20B9; <%=price%></h5></td>
                        
                        <div class="clearfix"> </div>

                        <td>
                            <div class="quantity" style="margin-top: 55px"> 
                                <div class="quantity-select">            
                                    <div class="entry value-minus" onclick="removefromcart(<%=product_id%>)">&nbsp;</div>
                                    <div class="entry value"><span class="span-1"><h5><%=qty%></h5></span></div>									
                                    <div class="entry value-plus active" onclick="addtocart(<%=product_id%>)">&nbsp;</div>
                                </div>
                            </div>

                        </td>

                        <td>

                            <div class="sed"><h5>&#x20B9; <%=total_price%></h5></div>

                        </td>

                    </tr>
                   
                    <% }
                       
                      }%>
                </table></div>
                <div class="totalprice">
                 <% 
                        
                        ResultSet rs2 = vmm.DBLoader.executeStatement("select * from orders where order_id=" + order_id);
                        if(rs2.next()){
                        String price1=rs2.getString("price");
                        int p1=Integer.parseInt(price1);
                        int tp=p1+150;
                        if(p1>0){
                       
                 %>       
                 <div class="cart-total" style="width: 500px; height: 400px">

                     <h3 class="continue" style="color: red ; font-family: serif">CART &nbsp;TOTAL:</h3>
                    <div class="price-details" style="font-family: serif">
                        
                        <span><h4><b>Price -</b></h4></span>
                       
                        <span class="total1"><h4><b><%=p1+".00"%></b></h4></span>
                        <br> <br>
                       
                        <span><h4><b>Delivery Charges -</b></h4></span>
                        <span class="total1"><h4><b>150.00</b></h4></span>
                        <div class="clearfix"></div>				 
                    </div>	
                        <br><br>
                    <ul class="total_price" style="color: red ; font-family: serif">
                        <li class="last_price"> <h4><b>TOTAL -</b></h4></li>	
                        <li class="last_price"><span> <h4><b><%=tp+".00"%></b></h4></span></li>
                        <div class="clearfix"> </div>
                    </ul>
  <br> <br>
                    
<!--                    <input type="button" value="Place order" class="bg-primary btn-lg" id="blink" style="margin-left: 140px" onclick="placeorder()">-->
                    <input type="button" value="Proceed" class="bg-primary btn-lg" id="blink" style="margin-left: 100px" onclick="buy()">
                </div>
            <%}
            }%>
                </div>

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

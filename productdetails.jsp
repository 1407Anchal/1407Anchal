

<%@page import="java.sql.ResultSet"%>
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
        <style>
            #blink:hover{
                background-color: #ff6600;

            }
        </style>
        <script>
            function cart(product_id) {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function () {

                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                        
                        if (res === "success")
                        {
                            alert("Item Add to cart");                        
                            xml1.send();

                        } else if (res === "notlogin")
                        {
                            alert("Please login First");
                            location.href = "login.jsp";
                        }
                         else if (res === "Out of Stock")
                        {
                            alert("Item is Out of Stock.");                            
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
                       
                        document.getElementById("noofitems").innerHTML = res1+" items";
                    }

                };

               
                xml1.open("get", "help", true);
               
            }


        </script>
        <!-- //animation-effect -->
        <link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,300,700,900' rel='stylesheet' type='text/css'></head>

    <body>
        <!-- header -->
        <div class="header">
            <jsp:include page="/header.jsp"/>
        </div>


        <%
            String product_id = request.getParameter("product_id");
            ResultSet rs = vmm.DBLoader.executeStatement("select * from products where product_id=" + product_id);
            if (rs.next()) {
                //            String product_id1=rs.getString("product_id");
                String product_name = rs.getString("product_name");
                String product_description = rs.getString("product_description");
                String price = rs.getString("price");
                String brand = rs.getString("brand");
                String catname = rs.getString("catname");
                String product_image = rs.getString("product_image");


        %>
        <!-- //header -->
        <!--banner-->

        <div class="product">
            <div class="container">

                <div class="col-md-9 animated wow fadeInRight" data-wow-delay=".5s">
                    <div class="col-md-5 grid-im">
                        <div  class=" grid-product " >
                            <figure>		


                                <div class="grid-img">
                                    <img  src="<%=product_image%>" width="250px" height="450px" alt="">
                                </div>			

                            </figure>	
                        </div>

                    </div>	
                    <div class="col-md-7 single-top-in">
                        <div class="span_2_of_a1 simpleCart_shelfItem">
                            <h3><%=product_name%></h3>

                            <div class="price_single">
                                <span class="reducedfrom item_price">&#x20B9; <%=price%></span>
                                <input type="button" value="Add to Cart" class="bg-primary btn-lg" id="blink" onclick="cart(<%= product_id%>)" style="margin-left: 200px">

                                <div class="clearfix"></div>
                            </div>



                            <div class="clearfix"> </div>
                        </div>
                        <!----- tabs-box ---->
                        <div class="sap_tabs">	
                            <div id="horizontalTab" style="display: block; width: 100%; margin: 40px;">
                                <ul class="resp-tabs-list">
                                    <li class="resp-tab-item " aria-controls="tab_item-0" role="tab"><span style="font-size: 17px">Product Description</span></li>
                                    <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span style="font-size: 17px">Brand</span></li>
                                    <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span style="font-size: 17px">Category name</span></li>

                                    <div class="clearfix"></div>
                                </ul>				  	 
                                <div class="resp-tabs-container"><br>
                                    <h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>Product Description</h2><div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0" style="display:block">
                                        <h2><%=product_description%></h2>

                                    </div>
                                    <h2 class="resp-accordion" role="tab" aria-controls="tab_item-1"><span class="resp-arrow"></span>Brand</h2><div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
                                        <!--										<div class="facts1">-->
                                        <h2><%=brand%></h2>
                                    </div>
                                    <h2 class="resp-accordion" role="tab" aria-controls="tab_item-2"><span class="resp-arrow"></span>category</h2><div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
                                        <!--										<div class="facts1">-->
                                        <h2><%=catname%></h2>
                                    </div>

                                </div>


                                <!--						<div class="color">-->

                                <div class="clearfix"></div>
                                <!--						</div>-->

                                <!--			 </div>-->

                            </div>									



                        </div>
                    </div>
                </div>
                <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                <script type="text/javascript">
                                 $(document).ready(function () {
                                     $('#horizontalTab').easyResponsiveTabs({
                                         type: 'default', //Types: default, vertical, accordion           
                                         width: 'auto', //auto or any width like 600px
                                         fit: true   // 100% fit in a container
                                     });
                                 });
                </script>	
                <!---->
            </div>

        </div>
        <!----->
        <div class="clearfix"> </div>
        <div class=" col-md-si">


            <div class="col-sm-4 item-grid simpleCart_shelfItem">

                <div class="clearfix"></div>
            </div>			

            <!--//products-->

            <%
                }
                rs.close();
            %>  


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
                    </div><!-- //footer -->
                    <script src="js/imagezoom.js"></script>

                    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                    <script defer src="js/jquery.flexslider.js"></script>
                    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
                    <script>
                    // Can also be used with $(document).ready()
                                                         $(window).load(function () {
                                                             $('.flexslider').flexslider({
                                                                 animation: "slide",
                                                                 controlNav: "thumbnails"
                                                             });
                                                         });
                    </script>

                    </body>
                    </html>
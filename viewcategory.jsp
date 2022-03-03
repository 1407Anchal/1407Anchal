

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
<!-- //animation-effect -->
<link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
<script>
   function productdetails(product_id){
       location.href="productdetails.jsp?product_id="+product_id
   } 
    
</script>
<style>
    #blink:hover{
        background-color:#ff3300 ;

            }
</style>
</head>
	
<body>
<!-- header -->
<div>
			<jsp:include page="/header.jsp"/>
		
	</div>
<!-- //header -->


<!-- banner -->
<!--	<div class="banner">
	
	
	<div class="banner-right">-->
<!--					<ul id="flexiselDemo2">			
						<li><div class="banner-grid">
						<h2>Featured Products</h2>
						<div class="wome">
								<a href="single.html" ><img class="img-responsive" src="images/bi1.jpg" alt="" />
								</a>
								<div class="women simpleCart_shelfItem">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6 ><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p class="ba-price"><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>							
								</div>							
							</div></li>
						<li><div class="banner-grid">
						<h2>Featured Products</h2>
						<div class="wome">
								<a href="single.html" ><img class="img-responsive" src="images/bi.jpg" alt="" />
								</a>	
								<div class="women simpleCart_shelfItem">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6 ><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p class="ba-price"><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>						
								</div>						
							</div></li>
						<li><div class="banner-grid">
						<h2>Featured Products</h2>
						<div class="wome">
								<a href="single.html" ><img class="img-responsive" src="images/bi2.jpg" alt="" />
								</a>	
								<div class="women simpleCart_shelfItem">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6 ><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p class="ba-price"><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>						
								</div>						
							</div></li>
						
					
					</ul>-->
           
<!--					<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo2").flexisel({
				visibleItems: 1,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 5000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 1
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 1
		    		}
		    	}
		    });
		    
		});
	</script>-->
<!--		<script type="text/javascript" src="js/jquery.flexisel.js"></script>

					</div>

				
				</div>

	</div>-->

		<div class="content">
		<!--<div class="content-head">

						</div>
                    
					


							</div>-->
                <% String shopname=request.getParameter("shopname"); 
                    String catname=request.getParameter("catname");
                %>
                
					<br><br>
      
		                    <h1>  <p style=" text-align: center;font-size: 50px;font-family: fantasy"><%= request.getParameter("shopname") %></p></h1>
                                    <br><br>
                                <%		
      
      try {
           ResultSet rs = vmm.DBLoader.executeStatement("select * from products where catname='"+catname+"'");

          while (rs.next()) {
              int product_id=rs.getInt("product_id");
                 System.out.println("product_name "+rs.getString("product_name"));
                   System.out.println("product_image "+rs.getString("product_image"));
                   System.out.println("price"+rs.getString("price"));

        %>
					
					
                                            <div class="col-sm-3">
						
                                                <div class="grid-pro" style="margin-top: 40px">
								<div  class=" grid-product " >
									<figure>		
										

											<div class="grid-img">
                                                                                            
                                                                                            <a href="productdetails.jsp?product_id=<%=product_id%>">
                                                                                           <img  src="<%=rs.getString("product_image")%>" width="200px" height="300px" alt="">
                                                                                           </a>
											</div>			
												
									</figure>	
								</div>
								<div class="women">
									<a href="productdetails.jsp?product_id=<%=product_id%>">
									<h6><%=rs.getString("product_name")%></h6>
                                                                        </a>
									<p><em class="item_price">&#x20B9;<%=rs.getString("price")%></em></p>
                                                                        <button type="button" class="bg-primary btn-lg" onclick="productdetails('<%=product_id%>')" id="blink">View Details</button>
									<!--<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>-->
								</div>
						</div>
							

                </div>
<!--
-->                                        </div>
         <%        
            } 

        } catch (Exception e) {
           e.printStackTrace();
        }
            %>
            
<div class="clearfix"></div>
			<br><br>
				
	<div class="footer">
		<div class="container">
		<div class="footer-top">
		<div class="col-md-9 footer-top1">

			
			<div class="copy-right animated wow fadeInUp" data-wow-delay=".5s">
				<p>&copy 2021 Quick Mart. All rights reserved | Design by Anchal arora</p>
			</div>
		</div>
	</div>
<!-- //footer -->
</body>
</html>

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
            function pay() {
              // alert("js"+order_id);
                
                var firstname = document.getElementById("firstname").value;
                var lastname = document.getElementById("lastname").value;
                var addressEmail = document.getElementById("addressEmail").value;
                var phoneno = document.getElementById("phoneno").value;
                var address = document.getElementById("address").value;
                
                  if (firstname === "" || lastname === "" || addressEmail === "" || phoneno === "" || address === "")
                {
                    alert("Please fill all values");
                  
                }
                else if(phoneno.length !== 10){
                   alert("Invalid Phone Number");
                
                }
                else if(addressEmail.indexOf('@') === -1){
                   alert("Invalid Email Id");
                   
                }
                else if(addressEmail.indexOf('.') === -1){
                   alert("Inavalid Email Id");
                   
                }
                else{
                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function () {
                
                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                     
                        if (res === "success")
                        {
                            
                           document.getElementById("firstname").value = "";
                           document.getElementById("lastname").value = "";
                           document.getElementById("addressEmail").value = "";
                           document.getElementById("phoneno").value = "";
                           document.getElementById("address").value = "";
                           
                          location.href = "choose_pay.jsp";
                           //xml1.send();
                        } else if (res === "notlogin")
                        {
                      
                            location.href = "login.jsp";

                        }
                    }

                };
                var querystring = "firstname=" + firstname + "&lastname=" + lastname + "&addressEmail=" + addressEmail + "&phoneno=" + phoneno + "&address=" + address;
                xml.open("post", "address?" + querystring, true);
                xml.send();
            }
        }
        </script>
<!--                var xml1 = new XMLHttpRequest();
                xml1.onreadystatechange = function () {

                    if (xml1.readyState === 4 && xml1.status === 200)
                    {
                        var res = xml1.responseText;
                        res = res.trim();
                      
                        if (res === "success")
                        {
                           location.href="lastpage.jsp?order_id="+order_id;

                        } else if (res === "notlogin")
                        {
                            
                        }
                    }

                };
                var querystring1 = "order_id=" + order_id;
                xml1.open("get", "placeorder?" + querystring1, true);
                                          
            }
            </script>
            <script>
                function payonline(order_id){
                     var firstname = document.getElementById("firstname").value;
                var lastname = document.getElementById("lastname").value;
                var addressEmail = document.getElementById("addressEmail").value;
                var phoneno = document.getElementById("phoneno").value;
                var address = document.getElementById("address").value;
                
                  if (firstname === "" || lastname === "" || addressEmail === "" || phoneno === "" || address === "")
                {
                    alert("Please fill all values");
                  
                }
                else if(phoneno.length !== 10){
                   alert("Invalid Phone Number");
                
                }
                else if(addressEmail.indexOf('@') === -1){
                   alert("Invalid Email Id");
                   
                }
                else if(addressEmail.indexOf('.') === -1){
                   alert("Inavalid Email Id");
                   
                }
                else{
                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function () {
                
                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText;
                        res = res.trim();
                     
                        if (res === "success")
                        {
                           document.getElementById("firstname").value = "";
                           document.getElementById("lastname").value = "";
                           document.getElementById("addressEmail").value = "";
                           document.getElementById("phoneno").value = "";
                           document.getElementById("address").value = "";
                           
                          
                          // xml1.send();
                        } else if (res === "notlogin")
                        {
                      
                            location.href = "login.jsp";

                        }
                    }

                };
                var querystring = "firstname=" + firstname + "&lastname=" + lastname + "&addressEmail=" + addressEmail + "&phoneno=" + phoneno + "&address=" + address;
                xml.open("post", "address?" + querystring, true);
                xml.send();
                    
                    
                    
                    //location.href="online_pay.jsp?order_id="+order_id;
                }
                    
                    
                }
            </script>
            <script>
                
                
            </script>-->
            
            
            
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
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Shipping &nbsp;Details</h2>
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
                            <input type="text" placeholder="Enter FirstName" required="" id="firstname" name="firstname">
                            <!--					<i class="glyphicon glyphicon-envelope"></i>-->
                        </div>
                        <div class="login-mail">
                            <input type="text" placeholder="Enter LastName" required="" id="lastname" name="lastname">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                        <div class="login-mail">
                            <input type="text" placeholder="Enter Email" required="" id="addressEmail" name="email">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                        <div class="login-mail">
                            <input type="text" placeholder="Enter Mobile Number" required="" id="phoneno" name="phoneno">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>

                       
                       
                        <div class="login-mail">
                            <input type="text" placeholder="Enter Address" required="" id="address" name="address">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>


                    </div>
                      <div class="totalprice">
                 <% 
                      String order_id = request.getSession().getAttribute("order_id").toString();
                    ResultSet rs2 = vmm.DBLoader.executeStatement("select * from orders where order_id=" + order_id);
                        if(rs2.next()){
                        String price1=rs2.getString("price");
                        int p1=Integer.parseInt(price1);
                        int tp=p1+150;
                        if(p1>0){
                       
                 %>       
                 <div class="cart-total" style="width: 500px; height: 400px">

                     <h3 class="continue" style="color: red ; font-family: serif">CART &nbsp TOTAL:</h3>
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
                        <br><br>
                         <%
                        String toPlacedOrderId=session.getAttribute("order_id").toString();
                     %>
<!--                     <label style="font-size:x-large; margin-left: 70px" >Place Order</label>-->
                     
                    <div class="col-md-6 login-do animated wow fadeInRight" data-wow-delay=".5s">
                        
                        <input type="button" value="Proceed" class="btn-lg btn-primary" id="blink" onclick="pay()" style="height: 50px; margin-top: 55px; margin-left: 30px"/>

                    </div>
                            
  <br> <br>
                  

                </div>
            <%}
            }%>
            
                </div>
      
                    
                    
                   
                    <div class="clearfix"> </div>
                </form>
            </div>


        </div>
                       

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
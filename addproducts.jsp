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
            function add() {
                var product_name = document.getElementById("product_name").value;
                var product_description = document.getElementById("product_description").value;
                var price = document.getElementById("price").value;
                var product_image = document.getElementById("product_image").files[0];
                var brand  = document.getElementById("brand").value;
              var qty  = parseInt(document.getElementById("qty").value);
             // var q=qty.toString();
              //var qty  = document.getElementById("qty").value;

                var catname1 = document.getElementById("catname1").value;

             //  alert(catname1);
                //if(phoneno)
             

                // alert(gender);    


                if (product_name == "" || product_description == "" || price == "" || product_image == "" || brand == "" || qty=="")
                {
                    alert("Please fill all values");
                                        
                }
                else if(qty<100){
                    alert("Quantity of Products Can't be less than 100")
                }
                 
                
                else 
                {
                    var formdata = new FormData();
                    formdata.append("product_name", product_name);
                    formdata.append("product_description", product_description);
                    formdata.append("price", price);
                    
                    formdata.append("product_image", product_image);
                    formdata.append("brand", brand);
                   formdata.append("qty", qty);

                   
                    formdata.append("catname1", catname1);

                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function () {

                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            var res = xml.responseText;
                            res = res.trim();
                            // alert(res);
                            if (res == "success")
                            {
                                alert("Product Added Successfully ");

                                document.getElementById("product_name").value = "";
                                document.getElementById("product_description").value = "";
                                document.getElementById("price").value = "";
                                 document.getElementById("qty").value = "";
                                

                                document.getElementById("product_image").value = "";
                                document.getElementById("brand").value = "";
                                
                            //    location.href="login.jsp";


                            } else 
                            {
                                alert("Something Went Wrong");

                            }
//                        
//                           

                        }

                    };
                    xml.open("post", "addproducts", true);
                    xml.send(formdata);

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
                <h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Add &nbsp;&nbsp;Products</h2>
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
                            <input type="text" placeholder="Enter Product Name" required="" id="product_name" name="product_name">
                            					
                        </div>
                        <div class="login-mail">
                            <input type="text" placeholder="Enter Product Description" required="" id="product_description" name="product_description">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                        <div class="login-mail">
                            <input type="text" placeholder="Enter Price" required="" id="price" name="price">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                         <div class="login-mail">
                            <label>Choose Photo: </label>
                            <input type="file" id="product_image"  required="">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                       

                        
                       
                        <div class="login-mail">
                            <input type="text" placeholder="Enter Brand Name" required="" id="brand" name="brand">
                            <!--<i class="glyphicon glyphicon-lock"></i>-->
                        </div>
                        
                        <div class="login-mail">
                            <input type="text" placeholder="Enter Quantity" required="" id="qty" name="qty">
                          
                        </div>
                        
                        <div class="login-mail">
                         <label for="catname">Choose Category Name:</label><br>
                         <select name="catname" id="catname1" style="max-width:90%">
                        <%  ResultSet rs = vmm.DBLoader.executeStatement("select * from categories");
                        while(rs.next()){
                              String catname=rs.getString("catname");
                              
                        %>
                         
                           

                               
                                  <option value="<%=catname%>"><%=catname%></option>
                                   <%}%>
                                 
                                </select>
                                   </div>
                                    <div class="col-md-6 login-do animated wow fadeInRight" data-wow-delay=".5s">
                        <label>
                            <input type="button" value="Add Products" class="btn-lg btn-primary" id="blink" onclick="add()" style="height: 60px;margin-left: 150px;font-size: x-large">
                        </label>
                        
                    </div>
                        </div>
                                 

                   
                    </div>
                    <br><br>
                   
                    <div class="clearfix"> </div>
                </form>
            </div>


        </div>
         <br><br>
      
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
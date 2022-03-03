

<%@page import="java.sql.ResultSet"%>
<%@page import="vmm.*"%>
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
    </head>

    <body>
        <!-- header -->
        <div class="header">
           
            <% String email = null;
                if (null != session.getAttribute("email")) {
                    email = session.getAttribute("email").toString();
                }
            %>
           
              
            <jsp:include page="/header.jsp"/>


        </div>
        <!-- //header -->

        <div class="banner">
            <div class="col-sm-12">

                <ul id="flexiselDemo2">			

                </ul>
               
                <script type="text/javascript" src="js/jquery.flexisel.js"></script>

            </div>

        </div>

    </div>

    <div class="content">
        <div class="content-head">

        </div>

    </div>
    <div class="col-sm-12 bg-info" style="font-size: 60px ; font-family:fantasy"> <p style=" text-align: center">Categories</p></div>			
    <%

        try {
            ResultSet rs = vmm.DBLoader.executeStatement("select * from categories");

            while (rs.next()) {
                System.out.println("catname " + rs.getString("catname"));
                System.out.println("photo " + rs.getString("photo"));
                System.out.println("shopname " + rs.getString("shopname"));

    %>           
    <div class="col-sm-6 col-md1 animated wow fadeInLeft" data-wow-delay=".1s" style="height: 580px ; border: solid #ff9999">  
        <div class="col-6">
            <a href="viewcategory.jsp?shopname=<%=rs.getString("shopname")%>&catname=<%=rs.getString("catname")%>"><img src=<%=rs.getString("photo")%> class="img-responsive alt="">
                <div class="col-pic">	
                    <h5> <%=rs.getString("shopname")%></h5>
                    <p>At Quick Mart</p>
                </div>
            </a>
        </div>

    </div>
    <%
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>


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
        
</body>
</html>

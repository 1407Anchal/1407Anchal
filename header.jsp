<%-- 
    Document   : header
    Created on : 18 Nov, 2021, 9:31:19 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

			<div class="header-grid" id="header1">
					<div class="container">
				<div class="header-left animated wow fadeInLeft" data-wow-delay=".5s">
					<ul>
<!--					<li><i class="glyphicon glyphicon-headphones"></i><a href="#">24x7 live support</a></li>-->
						<li><i class="glyphicon glyphicon-envelope" ></i><a href="mailto:info@example.com">anchalaroraproject2000@gmail.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" ></i>+1234 567 892</li>
						
					</ul>
				</div>
				<div class="header-right animated wow fadeInRight" data-wow-delay=".5s">
                                <% 
                                    String email = request.getSession().getAttribute("email")!=null ? request.getSession().getAttribute("email").toString() : null;
                                 %>   <div>
					<ul>
                                 <%   if(null == email){%>
                                    <li><i class="glyphicon glyphicon-log-in" ></i><a href="merchantsignup.jsp">Merchant SignUp</a></li>
                                    <li><i class="glyphicon glyphicon-log-in" ></i><a href="login.jsp">Login</a></li>
                                    <li><i class="glyphicon glyphicon-book" ></i><a href="signup.jsp">Register</a></li>

                                <%
                                    } else {
                                %>
                                
                                <li>Hi <%=email%></li>
                                
                                <li><a href="changepassword.jsp">Change Password</a></li>
                                <li><a href="order_history.jsp">Order History</a></li>

                                <li><a href="login.jsp">Logout</a></li>
                                                                                                                                                                     
                                <%}%>
                                </ul>
				</div>
				<div class="header-right2">
					<div class="cart box_1">
						<% 
                                                    String order_id = request.getSession().getAttribute("order_id")!=null ? request.getSession().getAttribute("order_id").toString() : null;
                                                    System.out.println("header order "+order_id);
                                                    ResultSet rs = vmm.DBLoader.executeStatement("select * from order_details where order_id="+order_id); 
                                                    int totalNumber = 0;
                                                    while(rs.next()) {
                                                        
                                                        totalNumber++;
                                                    }
//                                                    out.println("success");
                                                 %>
                                                
                     
							
<!--								<span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items)</div>-->
                                                             
<a href="addtocart.jsp">
                        <img src="images/cart.png" alt="" width="50px" height="50px"/><h3 id="noofitems"><%=totalNumber%> items</h3>
                </a>
                                                                
						
						
						<div class="clearfix"> </div>
					</div>	
                                    
				</div>
				<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
			</div>
               
                <div class="container">
                 
                                                                   

                                                                        
                   
			<div class="logo-nav">
				
					<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						 <div class="navbar-brand logo-nav-left ">
							<h1 class="animated wow pulse" data-wow-delay=".5s"><a href="index.jsp">Quick<span>Mart</span></a></h1>
						</div>

					</div> 
                <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav">
<!--                             <div class="w3l_search">
                <form>
                    <input type="text" id="sproduct" onkeyup="search()" name="sproduct" style="width: 200px;"  placeholder="Search Product By Name" 
                          />
                   <div id="result" style="background-color:#ffffff;width: 200px;position: absolute;z-index: 10;margin-top: 35px;"></div>
                </form>
            </div>-->
                                <li><a href="index.jsp" class="act">Home</a></li>	
                                                                             

							<!-- Mega Menu -->
                              
                                       

                                        <%

                                        try {
                                            ResultSet rs1 = vmm.DBLoader.executeStatement("select * from categories");

                                            while (rs1.next()) {                                          
                                            %>  

                                            <li><a href="viewcategory.jsp?shopname=<%=rs1.getString("shopname")%>&catname=<%=rs1.getString("catname")%>"> <%=rs1.getString("shopname")%></a></li>
                                            <%
                                             }
                                            String role=request.getSession().getAttribute("role").toString();
                                            if(role.equals("merchant")||role.equals("admin")){
                                            %>
                                                <li><a href="addproducts.jsp">Add Products</a></li>
                                     <%
                                          if(role.equals("admin")){
                                              %>
                                          
                                          <li><a href="addcategory.jsp">Add Categories</a></li>
                                          <li><a href="showcontact.jsp">Show Contacts</a></li>
                                          <li><a href="show_merchants.jsp">Show Merchants</a></li>
                                                
                                        
                                                
                                                
                                                
                                               
                                            <%
                                            
}
                                    }

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                         %>
                                         
                                         
                                        <li><a href="contact.jsp">Contact Us</a></li>  
                                         
                                         
							
                                         
                        </ul>
                </div>
					</nav>
				</div>
				
		</div>


<%-- 
    Document   : checkout
    Created on : Aug 4, 2022, 11:07:44 AM
    Author     : Gilbert
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, java.util.Date, java.text.SimpleDateFormat, add.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Checkout</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
       <jsp:include page="header.jsp"></jsp:include>
    <%
         HttpSession hs = request.getSession();
        String CID = (String)hs.getAttribute("CID");
         String Name = (String)hs.getAttribute("CustomerName");
         if(Name==null){
            RequestDispatcher dispatcher=request.getRequestDispatcher("Customer_login.jsp");
            dispatcher.forward(request,response);
        }
        %>


    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.jsp">Home</a>
                        <span>Checkout</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
<% 
     DatabaseConnection connection = new DatabaseConnection();        
     Connection conn = connection.getConn();
    Statement st= conn.createStatement();
    ResultSet rs1 = st.executeQuery("Select * from customers where CID="+CID);
    while(rs1.next()){
 %>
    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="AddtoSales">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                           
                            <h6 class="checkout__title">Billing Details</h6>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>First Name<span>*</span></p>
                                        <input type="text" value="<% out.println(rs1.getString("FName")); %>" readonly>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <input type="text" value="<% out.println(rs1.getString("LName")); %>" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Region<span>*</span></p>
                                <select name="location">
                                    <option value="Central">Central</option>
                                    <option value="South-Western">South-Western</option>
                                    <option value="Western">Western</option>
                                    <option value="Northern">Northern</option>
                                    <option value="Eastern">Eastern</option>
                                </select>
                            </div>
                           
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" value="<% out.println(rs1.getString("PNumber")); %>" readonly>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" value="<% out.println(rs1.getString("Email")); %>" readonly>
                                    </div>
                                </div>
                            </div>
                     <%}%>      
                            
                        </div>
                         <%
                                       
                                     ResultSet rs = st.executeQuery("Select * from orders where CID="+CID);
                                     
                                     int AllTotal=0;
                                 %>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h6 class="order__title">Your order</h6>
                                <div class="checkout__order__products">Product<span>Total</span></div>
                                <ul class="checkout__total__products">
                                     <%
                                    int i=1;
                                    while(rs.next()){
                                     int P = Integer.parseInt(rs.getString("OPrice"));
                                    int Q = Integer.parseInt(rs.getString("OQuantity"));
                                    int Total = P*Q;
                                    AllTotal+=Total;
                                %>
                                    <li><samp><%out.println(i);%></samp> <%out.println(rs.getString("PName")); out.println("--"); out.println(rs.getString("OQuantity"));%> <span>shs <%out.println(Total);%></span></li>
                                               <input type="hidden" name="helpvalue" value="<%out.println(rs.getString("PName"));%>">
                                </ul>
                                <ul class="checkout__total__all">
                                    <%
                                  i++;
                                  }
                                 
                              %>
                                    <li>Subtotal <span>shs <%out.println(AllTotal);%></span></li>
                                    <li>Total <span>shs <%out.println(AllTotal);%></span></li>
                                </ul>
                                
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

    <jsp:include page="footer.jsp"></jsp:include>

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.barfiller.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>
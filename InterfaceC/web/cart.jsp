<%-- 
    Document   : cart
    Created on : Aug 4, 2022, 6:42:55 AM
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
    <title>Cart</title>

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
                        <h2>Shopping cart</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>Shopping cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                              <%
                                     DatabaseConnection connection = new DatabaseConnection();        
                                      Connection conn = connection.getConn();
                                     Statement st= conn.createStatement();

                                     ResultSet rs = st.executeQuery("Select * from orders where CID="+CID);
                                     int AllTotal=0;
                                 %>
                            <tbody>
                                <%
                
                                    while(rs.next()){
                                     int P = Integer.parseInt(rs.getString("OPrice"));
                                    int Q = Integer.parseInt(rs.getString("OQuantity"));
                                    int Total = P*Q;
                                    AllTotal+=Total;
                                %>
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="img/shop/<%out.println(rs.getString("PName"));%>.jpg" alt="">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6><%out.println(rs.getString("PName"));%></h6>
                                            <h5>shs <%out.println(rs.getString("OPrice"));%></h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <form action="UpdateCart"> <input type="hidden" value="<%out.println(Q+1);%>" name="update">
                                                <input type="hidden" value="<%out.println(rs.getString("OID"));%>" name="pname"><button class="btn-light">+</button></form>
                                            
                                            <input type="text" value="<%out.println(rs.getString("OQuantity"));%>" readonly>
                                            <form action="UpdateCart"> <input type="hidden" value="<%out.println(Q-1);%>" name="update">
                                                <input type="hidden" value="<%out.println(rs.getString("OID"));%>" name="pname"><button class="btn-light">-</button></form>
                                        </div>
                                    </td>
                                    <td class="cart__price">shs <%out.println(Total);%></td>
                                    <td class="cart__close"><form action="RemovefromCart">
                                            <input type="hidden" name="orderID" value="<%out.println(rs.getString("OID"));%>">
                                            <button type="submit" class="btn-dark">X</button></form></td>
                                </tr>
                                
                               
                                
                            </tbody>
                              <%
                                  }
                                 
                              %>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="checkout.jsp">Continue Shopping</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a href="#"><i class="fa fa-spinner"></i> Update cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span>shs <%out.println(AllTotal);%></span></li>
                            <li>Total <span>shs <%out.println(AllTotal);%></span></li>
                        </ul>
                        <a href="checkout.jsp" class="primary-btn">Proceed to checkout</a>
        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

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

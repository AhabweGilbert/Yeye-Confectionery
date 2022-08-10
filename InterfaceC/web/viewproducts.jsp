<%-- 
    Document   : viewproducts
    Created on : Aug 4, 2022, 5:06:40 AM
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
    <title>Cake | Template</title>

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
        %>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>Shop</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.jsp">Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="shop__option">
                <div class="row">
                    <div class="col-lg-7 col-md-7">
                        <div class="shop__option__search">
                            <form action="#">
                                <select>
                                    <option value="">Categories</option>
                                    <option value="">Red Velvet</option>
                                    <option value="">Cup Cake</option>
                                    <option value="">Biscuit</option>
                                </select>
                                <input type="text" placeholder="Search">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div class="shop__option__right">
                            <select>
                                <option value="">Default sorting</option>
                                <option value="">A to Z</option>
                                <option value="">1 - 8</option>
                                <option value="">Name</option>
                            </select>
                            <a href="#"><i class="fa fa-list"></i></a>
                            <a href="#"><i class="fa fa-reorder"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
               
                
          <%
                DatabaseConnection connection = new DatabaseConnection();        
                Connection conn = connection.getConn();
                Statement st= conn.createStatement();
                
                ResultSet rs = st.executeQuery("Select * from products");
            
           
               while(rs.next()){ %>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/shop/<%out.println(rs.getString("Image"));%>">
                            <div class="product__label">
                                <span><%out.println(rs.getString("PName"));%></span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#"><%out.println(rs.getString("Description"));%></a></h6>
                            <div class="product__item__price">shs <%out.println(rs.getString("Price"));%></div>
                             <div class="product__item__price"><%out.println(rs.getString("likes"));%> likes</div>
                            <div class="cart_add">
                                <form action="ToCart" method="POST">
                                <input type="hidden" name="customerID" value="<% out.println(CID);%>">
                                <input type="hidden" name="productName" value="<%out.println(rs.getString("PName"));%>">
                                <input type="hidden" name="productPrice" value="<%out.println(rs.getString("Price"));%>">
                                
                                <button type="submit " class="">Add to Cart</button>
                   
                                </form>   
                               
                                    <% if(rs.getString("PName").equals("Bread")){
                                    %> 
                                    <form action="BreadLikes" method="POST">
                                <input type="hidden" name="productName" value="<%out.println(rs.getString("PName"));%>">
                                <input type="hidden" name="like" value="<%out.println(rs.getInt("likes")+1);%>">
                                <input type="hidden" name="likett" value="<%out.println(rs.getInt("likes"));%>">
                                <button type="submit"  class="">Like</button>
                                <%  }%>
                               
                                </form>  
                                 <% if(rs.getString("PName").equals("Cake")){
                                    %> 
                                <form action="CakeLikes" method="POST">
                                <input type="hidden" name="productName" value="<%out.println(rs.getString("PName"));%>">
                                <input type="hidden" name="like" value="<%out.println(rs.getInt("likes")+1);%>">
                                 <input type="hidden" name="likett" value="<%out.println(rs.getInt("likes"));%>">
                                <button type="submit" class="btn btn-outline warning">Like</button>
                                <%  }%>
                                </form>
                                 <% if(rs.getString("PName").equals("Cookies")){
                                    %> 
                                <form action="CookiesLikes" method="POST">
                                <input type="hidden" name="productName" value="<%out.println(rs.getString("PName"));%>">
                                <input type="hidden" name="like" value="<%out.println(rs.getInt("likes")+1);%>">
                                 <input type="hidden" name="likett" value="<%out.println(rs.getInt("likes"));%>">
                                <button type="submit" class="btn btn-outline warning">Like</button>
                                <%  }%>
                                </form>
                                 <% if(rs.getString("PName").equals("Doughnuts")){
                                    %> 
                                <form action="DoughnutsLikes" method="POST">
                                <input type="hidden" name="productName" value="<%out.println(rs.getString("PName"));%>">
                                <input type="hidden" name="like" value="<%out.println(rs.getInt("likes")+1);%>">
                                 <input type="hidden" name="likett" value="<%out.println(rs.getInt("likes"));%>">
                                <button type="submit" class="btn btn-outline warning">Like</button>
                                <%  }%>
                                </form>     
                            </div>
                             
                                
                           
                        </div>
                    </div>
                </div>
                <% } %> 
            </div>
        </div>

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

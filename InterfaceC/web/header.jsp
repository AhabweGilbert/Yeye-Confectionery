
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, java.util.Date, java.text.SimpleDateFormat, add.DatabaseConnection" %>
<%
         HttpSession hs = request.getSession();
        String CID = (String)hs.getAttribute("CID");
         String Name = (String)hs.getAttribute("CustomerName");
        %>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__cart">
            <div class="offcanvas__cart__links">
                <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                <a href="#"><img src="img/icon/heart.png" alt=""></a>
            </div>
            <div class="offcanvas__cart__item">
                <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                <div class="cart__price">Cart: <span>$0.00</span></div>
            </div>
        </div>
        <div class="offcanvas__logo">
            <a href="./index.html"><img src="img/mylogo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="header__top__inner">
                            <div class="header__top__left">
                                <ul>
                                    <%
                                    if(Name==null){
                                    %>
                                     <li><a href="Customer_register.jsp">Register</a> </li>
                                     <li><a href="Customer_login.jsp">Log in</a> </li>
                                    <%
                                        }
                                else{
                                    %>
                                    <li>
                                        <%out.println(Name);%> 
                                        </li>
                                    <li><a href="Customer_login.jsp">Log out</a> </li>
                                </ul>
                                        <%
                                            }
                                        %>
                            </div>
                            <div class="header__logo">
<!--                                <h3 color="black">Yeye Confectionery</h3>-->
                                <a href="./index.jsp"><img src="img/mylogo.png" alt=""></a>
                                
                            </div>
                            <div class="header__top__right">
                                <div class="header__top__right__links">
                                    <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                                    <a href="#"><img src="img/icon/heart.png" alt=""></a>
                                </div>
                                <div class="header__top__right__cart">
                                    <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                                            <div class="cart__price">Cart: <span>
                                                    <%
                                                      try{
                                                               DatabaseConnection connection = new DatabaseConnection();        
                                                                Connection conn = connection.getConn();
                                                               Statement st= conn.createStatement();
                                                             
                                                                ResultSet rs = st.executeQuery("Select count(OID) from orders where CID="+CID);

                                                                rs.next();
                                                                int count = rs.getInt(1);

                                                              out.println(count);  
                                                        }catch(Exception jk){
                                                        out.println(jk.getMessage());
                                                        }
                                                           %>
                                        </span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="./index.jsp">Home</a></li>
                         
                             <li><a href="./viewproducts.jsp">Buy Products</a></li>
                            
                                    <li><a href="./cart.jsp">Shopping Cart</a></li>
                                    <li><a href="./checkout.jsp">Check Out</a></li>
                             
                          
                            <li><a href="./contact.jsp">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
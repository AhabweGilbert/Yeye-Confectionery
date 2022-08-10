<%-- 
    Document   : reports
    Created on : Aug 8, 2022, 11:28:19 PM
    Author     : HP
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat, add.DatabaseConnection" %>
<%
                DatabaseConnection connection = new DatabaseConnection();        
                Connection conn = connection.getConn();
                Statement st= conn.createStatement();
                
                ResultSet rs=st.executeQuery("select likes from products where PName='"+"Bread"+"'");
                rs.next();
                int like = rs.getInt(1);
                 ResultSet rs1=st.executeQuery("select likes from products where PName='"+"Doughnuts"+"'");
                 rs1.next();
                 int like1 = rs1.getInt(1);
                 ResultSet rs2=st.executeQuery("select likes from products where PName='"+"Cake"+"'");  
                 rs2.next();
                 int like2 = rs2.getInt(1);
                  ResultSet rs3=st.executeQuery("select likes from products where PName='"+"Cookies"+"'"); 
                  rs3.next();
                  int like3 = rs3.getInt(1);
                  ResultSet rs20= st.executeQuery("select count(SalesID) from sales where Region ='"+"Western"+"'");
			
                         rs20.next();
			int a=rs20.getInt(1);
                        ResultSet rs21 = st.executeQuery("select count(SalesID) from sales where Region ='"+"Central"+"'");
                          rs21.next();
			int b=rs21.getInt(1);
			ResultSet rs31 = st.executeQuery("select count(SalesID) from sales where Region ='"+"Eastern"+"'");
                        rs31.next();
			int c=rs31.getInt(1);
			ResultSet rs41 = st.executeQuery("select count(SalesID) from sales where Region ='"+"Northern"+"'");
                        rs41.next();
			int d=rs41.getInt(1);
			ResultSet rs51 = st.executeQuery("select count(SalesID) from sales where Region ='"+"Southern"+"'");
                         
                      
                      
                       
                       rs51.next();
			int e=rs51.getInt(1);

                   
                
%>
 
<!DOCTYPE html>


<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Reports</title>

  <!-- Template CSS -->
  <link rel="stylesheet" href="css/style-starter.css">

  <!-- google fonts -->
  <link href="//fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900display=swap" rel="stylesheet">
</head>

<%
                                    String uname=(String)request.getSession().getAttribute("Fname");
                                    if(uname==null){
                                    response.sendRedirect("managerlogin.jsp");
    }

                                    %>
<body class="sidebar-menu-collapsed">
  <!--<div class="se-pre-con"></div>-->
<section>
  <!-- sidebar menu start -->
  <div class="sidebar-menu sticky-sidebar-menu">

    <!-- logo start -->
    <div class="logo">
      <h1><a href="dashboard.jsp">Manager</a></h1>
    </div>

  <!-- if logo is image enable this -->
    <!-- image logo --
    <div class="logo">
      <a href="index.html">
        <img src="image-path" alt="Your logo" title="Your logo" class="img-fluid" style="height:35px;" />
      </a>
    </div>
    <!-- //image logo -->

    <div class="logo-icon text-center">
      <a href="dashboard.jsp" title="logo"><img src="img/alogo.png" alt="logo-icon"> </a>
    </div>
    <!-- //logo end -->

    <div class="sidebar-menu-inner">

      <!-- sidebar nav start -->
      <ul class="nav nav-pills nav-stacked custom-nav">
        <li><a href="dashboard.jsp"><i class="fa fa-tachometer"></i><span> Dashboard</span></a>
        </li>
        <li>
          <a href="customertracking.jsp"><i class="fa fa-cogs"></i>
            <span>Customer Tracking</span></a>
        </li>
        <li class="menu-list">
          <a href="humanresource.jsp"><i class="fa fa-users"></i>
            <span>Human resource <i class="lnr lnr-chevron-right"></i></span></a>
          <ul class="sub-menu-list">
            <li><a href="humanresource.jsp">Register recruited staff details</a> </li>
            <li><a href="productlinedemand.jsp">View productline demand</a> </li>
            <li><a href="monthlysales.jsp">View Monthly Sales ratio</a></li>
          </ul>
        </li>
        <li><a href="sales.jsp"><i class="fa fa-th"></i> <span>Sales</span></a></li>
        <li><a href="products.jsp"><i class="fa fa-shopping-basket"></i> <span>Products</span></a></li>
        <li class="active"><a href="reports.jsp"><i class="fa fa-file-text"></i> <span>Reports</span></a></li>
      </ul>
      <!-- //sidebar nav end -->
      <!-- toggle button start -->
      <a class="toggle-btn">
        <i class="fa fa-angle-double-left menu-collapsed__left"><span>Collapse Menu</span></i>
        <i class="fa fa-angle-double-right menu-collapsed__right"></i>
      </a>
      <!-- //toggle button end -->
    </div>
  </div>
  <!-- //sidebar menu end -->
  <!-- header-starts -->
  <div class="header sticky-header">

    <!-- notification menu start -->
    <div class="menu-right">
      <div class="navbar user-panel-top">
        <div class="search-box">
          <form action="#search-results.html" method="get">
            <input class="search-input" placeholder="Search Here..." type="search" id="search">
            <button class="search-submit" value=""><span class="fa fa-search"></span></button>
          </form>
        </div>

          <div class="profile_details">
            <ul>
              <li class="dropdown profile_details_drop">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="dropdownMenu3" aria-haspopup="true"
                  aria-expanded="false">
                  <div class="profile_img">
                    <img src="img/profilo.png" class="rounded-circle" alt="" />
                    <div class="user-active">
                      <span></span>
                    </div>
                  </div>
                </a>
                <ul class="dropdown-menu drp-mnu" aria-labelledby="dropdownMenu3">
                  <li class="user-info">
                    <h5 class="user-name"><%
                        out.println(uname);
                        %></h5>
                    
                  </li>
                 <li class="logout"> <a href="managerlogin.jsp"><i class="fa fa-power-off"></i> Logout</a> </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--notification menu end -->
  <!--</div>-->
  <!-- //header-ends -->
  <!-- main content start -->
<div class="main-content">

  <!-- content -->
  <div class="container-fluid content-top-gap">

    <nav aria-label="breadcrumb">
      <ol class="breadcrumb my-breadcrumb">

      </ol>
    </nav>
    <div class="welcome-msg pt-3 pb-4">
        <h1>Reports</h1>
    </div>
      <table>
          <tr>
              <td>
      <h2>TABLE SHOWING LIKES ON EACH PRODUCT</h2>
      <table border="1"style="height: 200px; width: 30%;" >
  <tr>
                     <th>bread</th>
                     <th>doughnuts</th>
                     <th>cake</th>
                     <th>cookies</th>
                     </tr>
                     <tr>
                         <%
                             
                         %><td><%out.println(like); %></td><% 
                     %>
                <% 
                
              
                %><td><%out.println(like1);%></td><%
              
             
                 
              
                %><td><%out.println(like2);%></td><%

                 
              
                %><td><%out.println(like3);%></td>
                
                     </tr>
           </table>
              </td>
          <td>
                
             
                <h2>TABLE SHOWING QUANTITIES BOUGHT FOR EACH PRODUCT</h2>
           <table border="1"style="height: 200px; width: 30%;" >
            <tr>
                <td>bread</td> 
                <td>doughnuts</td>
                <td>cake</td>
                <td>cookie</td>

            </tr>   
                <% ResultSet rs4=st.executeQuery("select sum(OQuantity) from sales where PName='"+"Bread"+"'");
                rs4.next();
                int Sum1 = rs4.getInt(1);
                   %><tr><%
                
              
               %> <td><%out.println(Sum1);%></td><%
                ResultSet rs5=st.executeQuery("select sum(OQuantity) as total2 from sales where PName='"+"Doughnuts"+"'");
                rs5.next(); 
                int Sum2 = rs5.getInt(1);
              
               %> <td><%out.println(Sum2);%></td><%
                ResultSet rs6=st.executeQuery("select sum(OQuantity) as total3 from sales where PName='"+"Cake"+"'");
               rs6.next();
                int Sum3 = rs6.getInt(1);
              
                %><td><%out.println(Sum3);%></td><%
                ResultSet rs7=st.executeQuery("select sum(OQuantity) as total4 from sales where PName='"+"Cookies"+"'");
        rs7.next();
                int Sum4 = rs7.getInt(1);
              
                %><td><%out.println(Sum4);%></td>
                    </tr>
                    </table>
          </td>
          </tr>
          <tr>
              <td colspan="2">      
                    
                    
                     <table border="1" style="height: 200px; width: 30%;" >
                     <h2>TABLE SHOWING CUSTOMERS IN DIFFERENT REGIONS</h2>    
            <tr>
                <th>Region</th>
                <th>western</th>
                <th>central</th>
                <th>eastern</th>
                <th>northern</th>
                <th>southern</th>
            </tr>
            <tr>
            <td>number of customers</td>
            <td><% out.println(a);%></td>
            <td><% out.println(b);%></td>
            <td><% out.println(c);%></td>
            <td><% out.println(d);%></td>
            <td><% out.println(e);%></td>
            </td>
	
		</tr>
        </table>
            <table style=" width: 100%;">
                <tr>
                    <td><a href="/InterfaceC/report2.jsp"><b>NEXT REPORT</b></a></td>
                    <td><a href="/interfaceC/report.jsp"><b>PREVIOUS REPORT</b></a></td>
            </tr>
            </table>
      </tr>
      </table>
        <%
                        
                
               
                %>

  </div>
  <!-- //content -->
</div>
<!-- main content end-->
</section>
  <!--footer section start-->
<footer class="dashboard">
  <p>All copyright rights reserved by Yeye Confectionery. Design by Group 15</p>
</footer>
<!--footer section end-->
<!-- move top -->
<button onclick="topFunction()" id="movetop" class="bg-primary" title="Go to top">
  <span class="fa fa-angle-up"></span>
</button>
<script>
  // When the user scrolls down 20px from the top of the document, show the button
  window.onscroll = function () {
    scrollFunction()
  };

  function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      document.getElementById("movetop").style.display = "block";
    } else {
      document.getElementById("movetop").style.display = "none";
    }
  }

  // When the user clicks on the button, scroll to the top of the document
  function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }
</script>
<!-- /move top -->


<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery.min.js"></script>

<!-- chart js -->
<script src="js/Chart.min.js"></script>
<script src="js/utils.js"></script>
<!-- //chart js -->

<!-- Different scripts of charts.  Ex.Barchart, Linechart -->
<script src="js/bar.js"></script>
<script src="js/linechart.js"></script>
<!-- //Different scripts of charts.  Ex.Barchart, Linechart -->


<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>

<!-- close script -->
<script>
  var closebtns = document.getElementsByClassName("close-grid");
  var i;

  for (i = 0; i < closebtns.length; i++) {
    closebtns[i].addEventListener("click", function () {
      this.parentElement.style.display = 'none';
    });
  }
</script>
<!-- //close script -->

<!-- disable body scroll when navbar is in active -->
<script>
  $(function () {
    $('.sidebar-menu-collapsed').click(function () {
      $('body').toggleClass('noscroll');
    })
  });
</script>
<!-- disable body scroll when navbar is in active -->

 <!-- loading-gif Js -->
 <script src="js/modernizr.js"></script>
 <script>
     $(window).load(function () {
         // Animate loader off screen
         $(".se-pre-con").fadeOut("slow");;
     });
 </script>
 <!--// loading-gif Js -->

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<script src="canvas/canvasjs.min.js"></script>
</body>

</html>
  



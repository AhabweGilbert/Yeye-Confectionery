<%-- 
    Document   : humanresource
    Created on : Aug 8, 2022, 11:08:14 AM
    Author     : HP
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, java.util.Date, java.text.SimpleDateFormat, add.DatabaseConnection" %>
<!DOCTYPE html>


<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Human Resource</title>

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
                              
                                                      
                                                               DatabaseConnection connection = new DatabaseConnection();        
                                                                Connection conn = connection.getConn();
                                                               Statement st= conn.createStatement();
                                                               Statement st78= conn.createStatement();
                                                             
                                                                ResultSet rs = st.executeQuery("Select * from staff");
                                                                ResultSet rs78=null;
                                                                
                                                                rs78 = st78.executeQuery("select count(SID) from staff");
                                                                rs78.next();
                                                                int cust78 = rs78.getInt(1);

                                                           
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
        <li class="menu-list active">
          <a href="humanresource.jsp"><i class="fa fa-users"></i>
            <span>Human resource <i class="lnr lnr-chevron-right"></i></span></a>
          <ul class="sub-menu-list">
              <li><a href="humanresource.jsp">Register recruited staff details</a> </li>
            <li><a href="productlinedemand.jsp">View productline demand</a> </li>
            <li><a href="monthlysales.jsp">View Monthly Sales ratio</a></li>
          </ul>
        </li>
        <li><a href="products.jsp"><i class="fa fa-shopping-basket"></i> <span>Products</span></a></li>
        <li><a href="reports.jsp"><i class="fa fa-file-text"></i> <span>Reports</span></a></li>
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
        <div class="user-dropdown-details d-flex">

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
//                         String uname=(String)request.getSession().getAttribute("Fname");
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
  </div>
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
      <h1>Human Resource</h1>
    </div>

    <!-- statistics data -->
    <div class="statistics">
      <div class="row">
        <div class="col-xl-6 pr-xl-2">
          <div class="row">
              <div class="col-sm-6 pr-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-users"> </i>
                
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 18px">Register Staff details</p>
              </div>
            </div>
            <div class="col-sm-6 pl-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-eye"> </i>
                
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 18px">Product line demand</p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-6 pl-xl-2">
          <div class="row">
            <div class="col-sm-6 pr-sm-2 statistics-grid">
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-cloud-download"> </i>
                
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 18px">Monthly Sales ratio</p>
              </div>
            </div>
            <div class="col-sm-6 pl-sm-2 statistics-grid">
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-cart"> </i>
                <h3 class="text-danger number" style="font-family: Algerian;font-weight: bold"><%=cust78%></h3>
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 18px">Total Staff</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- //statistics data -->
    <div>
        <h4>Register recruited staff details</h4>
    </div>
  </div>
  <!-- //content -->

   <form action="RegisterStaff" method="POST">
           
       <table>
           <tr>
                   <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Gender</th>
                     <th>Phone Number</th>
             </tr>
             <tr>
                 <td> <input type="text" class="form-control" name="firstname" placeholder="firstname">  </td>
                 <td><input type="text" class="form-control" name="lastname" placeholder="lastname">   </td> 
                 <td><input type="email" class="form-control" name="email" placeholder="email"></td>
                 <td> <input type="text" class="form-control" name="gender" placeholder="gender"></td>
                 <td> <input type="text" class="form-control" name="phonenumber" placeholder="phonenumber"></td>
                 </tr>
                 <tr>
                     <td><button type="submit" class="btn btn-primary"> Register</button> </td>
                 </tr>
            </table>    
            </form>
  <br>  <br>  <br>
  <table width="50%">
                <tr>
                    <th>SID</th>
                    <th>FName</th>
                    <th>LName</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>PNumber</th>
                    
                   
                </tr>
            <%
                
                while(rs.next()){
                %>
                <tr>
                    <td><%out.println(rs.getString("SID"));%></td>
                    <td><%out.println(rs.getString("FName"));%></td>
                    <td><%out.println(rs.getString("LName"));%></td>
                        <td><%out.println(rs.getString("Email"));%></td>
                    <td><%out.println(rs.getString("Gender"));%> </td>
                   <td><%out.println(rs.getString("PNumber"));%> </td>
                  
                      
                </tr><%
                  
                }
            %>
            
            </table>
            <br>
            <a href="allocate.jsp"><button type="submit" class="btn btn-primary"> Allocate</button> </td></a>
<!-- main content end-->
</div>
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

</body>

</html>
<%-- 
    Document   : productlinedemand
    Created on : Aug 9, 2022, 12:02:18 PM
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
     
            
             Statement st1= conn.createStatement();
             Statement st5= conn.createStatement();
             Statement st7= conn.createStatement();
             Statement st9= conn.createStatement();
         
             Statement st11= conn.createStatement();
             Statement st51= conn.createStatement();
             Statement st71= conn.createStatement();
             Statement st91= conn.createStatement();
    
              Statement st20= conn.createStatement();
              Statement st21= conn.createStatement();
              Statement st22= conn.createStatement();
              Statement st78= conn.createStatement();
              
             
             ResultSet rs = st1.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Bread"+"'and Date between '2022-07-01' and '2022-07-14'");
                ResultSet rs11 = st11.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Bread"+"'and Date between '2022-07-15' and '2022-07-31'");
                ResultSet rs4 = st5.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Cakes"+"'and Date between '2022-07-01' and '2022-07-14'");
                ResultSet rs41 = st51.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Cakes"+"'and Date between '2022-07-15' and '2022-07-31'");
                ResultSet rs5 = st7.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Cookies"+"'and Date between '2022-07-01' and '2022-07-14'");
                ResultSet rs51 = st71.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Cookies"+"'and Date between '2022-07-15' and '2022-07-31'");
                ResultSet rs6 = st9.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Doughnuts"+"'and Date between '2022-07-01' and '2022-07-14'");
                ResultSet rs61 = st91.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Doughnuts"+"'and Date between '2022-07-15' and '2022-07-31'");
                ResultSet rs20 = st20.executeQuery("Select count(SID) from staff WHERE Category='"+"Long-term"+"' ");
                ResultSet rs21 = st21.executeQuery("Select count(SID) from staff WHERE Category='"+"Mid-term"+"'");
                ResultSet rs22 = st22.executeQuery("Select count(SID) from staff WHERE Category='"+"Short-term"+"'");
                ResultSet rs78 = null;
           //     ResultSet rs23 = st23.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Doughnuts"+"'and Date between '2022-07-04' and '2022-07-13'");
                 rs20.next();
                int lt = rs20.getInt(1); 
                rs21.next();
                int mt = rs21.getInt(1); 
                rs22.next();
                int stt = rs22.getInt(1); 
                 rs.next();
                int count = rs.getInt(1); 
                rs4.next();
                int c = rs4.getInt(1);
                rs5.next();
                int o = rs5.getInt(1);
                rs6.next();
                int u = rs6.getInt(1);
                
                rs11.next();
                int ct = rs11.getInt(1); 
                rs41.next();
                int ot = rs41.getInt(1); 
                rs51.next();
                int ut = rs51.getInt(1); 
                rs61.next();
                int nt = rs61.getInt(1); 
                int h =ct+ot+ut+nt;
                
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
            <span>Customer Tracking and Advisory</span></a>
        </li>
        <li class="menu-list">
          <a href="humanresource.jsp"><i class="fa fa-users"></i>
            <span>Human resource <i class="lnr lnr-chevron-right"></i></span></a>
          <ul class="sub-menu-list">
              <li><a href="humanresource.jsp">Register recruited staff details</a> </li>
            <li class="active"><a href="productlinedemand.jsp">View productline demand</a> </li>
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
                <!--<h3 class="text-primary number" style="font-family: Algerian;font-weight: bold">29.75 M</h3>-->
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 18px">Register Staff details</p>
              </div>
            </div>
            <div class="col-sm-6 pl-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-eye"> </i>
                <!--<h3 class="text-secondary number" style="font-family: Algerian;font-weight: bold">51.25 K</h3>-->
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
                <!--<h3 class="text-success number" style="font-family: Algerian;font-weight: bold">166.89 M</h3>-->
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
        <h4>Product line demand</h4>
    </div>
<!--      <div class="col-sm-6 pl-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-eye"> </i>
                <h3 class="text-secondary number" style="font-family: Algerian;font-weight: bold">51.25 K</h3>
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px">View product line demand</p>
              </div>
            </div>-->
    <div class="row">
        <div class="col-sm-6 pr-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-users"> </i>
                <h3 class="text-primary number" style="font-family: Algerian;font-weight: bold">Bread</h3> <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px"><% 
         //bread
           
         if(ct >= count){
               out.println("Demand increasing");
         }
            else{
             out.println("Demand decreasing");
            }
            %>
            </p>
                </div>
            </div>
             <div class="col-sm-6 pr-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-users"> </i>
                <h3 class="text-primary number" style="font-family: Algerian;font-weight: bold">Cakes and Doughnuts</h3> <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px"><% 
         //bread
           
        if((ot +nt)>= (c+u)){
               out.println("Demand increasing");
            }
            else{
               out.println("Demand decreasing");

        }
            %>
            </p>
                </div>
            </div>
             <div class="col-sm-6 pr-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-users"> </i>
                <h3 class="text-primary number" style="font-family: Algerian;font-weight: bold">Cookies</h3> <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px"><% 
        
        //cookies
            if(ut >= o){
               out.println("Demand increasing");
            }
            else{
               out.println("Demand decreasing");

        }
            %>
            </p>
                </div>
            </div>
               
    </div>
            <h2>Staff members Under Each Product Line</h2>
            <table border="1" width="100%">
                <tr>
                    <th>Bread</th>
                    <th>Cake and Doughnuts</th>
                    <th>Cookies</th>
                </tr>
                <tr>
                    <td><%out.println(stt);%></td>
                     <td><%out.println(mt);%></td>
                      <td><%out.println(lt);%></td>
                </tr>
            </table>
                <br> <br> <br>
                <form action="demandAllocation" >
                    <table>
                        <tr>
                        <label>Remove Staff From</label>
                        <select name="From">
                            <option value="Long-term">Cookies</option>
                             <option value="Mid-term">Cakes and Doughnuts</option>
                              <option value="Short-term">Bread</option>
                        </select>
                    </tr>
                      <tr>
                        <label>Add Staff To</label>
                        <select name="To">
                            <option value="Long-term">Cookies</option>
                             <option value="Mid-term">Cakes and Doughnuts</option>
                              <option value="Short-term">Bread</option>
                        </select>
                    </tr>
                    <tr>
                    <button type="Submit" class="btn btn-primary">Change</button>
                    </tr>
                       </table>
                </form>
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

</body>

</html>
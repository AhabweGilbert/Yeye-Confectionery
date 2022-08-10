<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Manager</title>

  <!-- Template CSS -->
  <link rel="stylesheet" href="css/style-starter.css">
  <!--<script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>-->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!--<link rel="stylesheet" href="css/bootstrap.min.css">-->

  <!--<script src="css/demo.css"></script>-->
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
  <!--<link rel="stylesheet" href="css/material-design-iconic-font.min.css">-->
  <!--<link rel="stylesheet" href="css/adminlte.css">-->
      <link rel="stylesheet" href="css/font-awesome.min.css">
      <!--<link rel="stylesheet" href="css/all.css">-->

  <!-- google fonts -->
  <link href="//fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900display=swap" rel="stylesheet">
</head>

<%
                                    String uname=(String)request.getSession().getAttribute("Fname");
                                    if(uname==null){
                                    response.sendRedirect("managerlogin.jsp");
    }
    
                                     try{
String connectionURL = "jdbc:mysql://localhost:3306/confectionery";
                                    Connection con=null;
                                    Statement st1=null;
                                    Statement st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st10=null,st11=null;
                                    ResultSet rs1 = null, rs2=null,rs3=null,rs4=null,rs5=null,rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
                                    
                                    
                                    
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection(connectionURL, "root", "");
                                    st1=con.createStatement();
                                    st2=con.createStatement();
                                    st3=con.createStatement();
                                    st4=con.createStatement();
                                    st5=con.createStatement();
                                    st6=con.createStatement();
                                    st7=con.createStatement();
                                    st8=con.createStatement();
                                    st9=con.createStatement();
                                    st10=con.createStatement();
                                    st11=con.createStatement();
                                    
                                    
                                    rs1 = st1.executeQuery("select count(CID) from customers where date_of_registration between '2022-07-13' and '2022-07-20' ");
                                    rs1.next();
                                    int cust1 = rs1.getInt(1);
                                    
                                    rs2 = st2.executeQuery("select count(CID) from customers where date_of_registration between '2022-07-20' and '2022-07-27' ");
                                    rs2.next();
                                    int cust2 = rs2.getInt(1);
                                    
                                    rs3 = st3.executeQuery("select count(CID) from customers where date_of_registration between '2022-07-27' and '2022-08-4' ");
                                    rs3.next();
                                    int cust3 = rs3.getInt(1);
                                    
                                    rs4 = st4.executeQuery("select count(CID) from customers where date_of_registration between '2022-08-4' and '2022-08-11' ");
                                    rs4.next();
                                   int cust4 = rs4.getInt(1);
                                    
                                     rs5 = st5.executeQuery("select count(CID) from customers");
                                     rs5.next();
                                     int cust5 = rs5.getInt(1);
                                     
                                     double custx = cust4-cust3;
                                     
                                     rs6 = st6.executeQuery("select count(SID) from staff");
                                    rs6.next();
                                     int cust6 = rs6.getInt(1);
                                    
                                     
                                     rs7 = st7.executeQuery("select count(OID) from orders");
                                     rs7.next();
                                     int cust7 = rs7.getInt(1);
                                     
                                     rs8 = st8.executeQuery("select sum(STotal) from sales where Date between '2022-07-27' and '2022-08-4' ");
                                     rs8.next();
                                     int cust8 = rs8.getInt(1);
                                     
                                     rs9= st9.executeQuery("select sum(STotal) from sales where Date between '2022-08-4' and '2022-08-11' ");
                                     rs9.next();
                                     int cust9 = rs9.getInt(1);
                                     
                                     double custy=cust9-cust8;
                                     
                                     rs10= st10.executeQuery("select sum(STotal) from sales where Date between '2022-07-20' and '2022-07-27' ");
                                     rs10.next();
                                     int cust10 = rs10.getInt(1);
                                     
                                     rs11 = st11.executeQuery("select sum(STotal) from sales where Date between '2022-07-12' and '2022-07-20' ");
                                     rs11.next();
                                     int cust11 = rs11.getInt(1);
                                     

                                    %>

<body class="sidebar-menu-collapsed">
  <!--<div class="se-pre-con"></div>-->
  

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
          <li class="active"><a href="dashboard.jsp"><i class="fa fa-tachometer"  aria-hidden="true"></i><span> Dashboard</span></a>
        </li>
        <li>
          <a href="customertracking.jsp"><i class="fa fa-cogs"></i>
            <span>Customer Tracking</span></a>
        </li>
        <!--<li><a href="humanresource.jsp"><i class="fa fa-table"></i> <span>Human resource</span></a></li>-->
        <li class="menu-list">
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
                      <!--<i class="fa-solid fa-user"></i>-->
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
                  <!--<li> <a href="#"><i class="lnr lnr-user"></i>My Profile</a> </li>-->
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
      <h1>Welcome <span class="text-primary"><%out.println(uname);%></span></h1>
    </div>

    <!-- statistics data -->
    <div class="statistics">
      <div class="row">
        <div class="col-xl-6 pr-xl-2">
          <div class="row">
              <div class="col-sm-6 pr-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-users"> </i>
                <h3 class="text-primary number" style="font-family: Algerian;font-weight: bold"><%=cust6%></h3>
                
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px">Total Staff</p>
              </div>
            </div>
            <div class="col-sm-6 pl-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-eye"> </i>
                <h3 class="text-secondary number" style="font-family: Algerian;font-weight: bold"><%=cust5%></h3>
                
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px">Customers Registered</p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-6 pl-xl-2">
          <div class="row">
            <div class="col-sm-6 pr-sm-2 statistics-grid">
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-cloud-download"> </i>
                <h3 class="text-success number" style="font-family: Algerian;font-weight: bold"><%
                    Statement xr = con.createStatement();
                    ResultSet ed = xr.executeQuery("select * from visitors");
                    int i=1;
            while(ed.next()){
            int v = ed.getInt("visits");
            
            if(i==1)
            out.println(v);
            i++;
                     }

                    %></h3>
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px">Visits</p>
              </div>
            </div>
            <div class="col-sm-6 pl-sm-2 statistics-grid">
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-cart"> </i>
                <h3 class="text-danger number" style="font-family: Algerian;font-weight: bold"><%=cust7%></h3>
                
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px">Total Orders</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- //statistics data -->

    <!-- charts -->
<div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">Customers</h3>
                  <!--<a href="javascript:void(0);">View Report</a>-->
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                  <p class="d-flex flex-column">
                    <span class="text-bold text-lg"><%=10%></span>
                    <span>Customers Over Time</span>
                  </p>
                  <p class="ml-auto d-flex flex-column text-right">
                      <%
                      if(custx>0){
                      %>
                    <span class="text-success">
                      <i class="fa fa-arrow-up"></i> <%=String.format("%.2f",(custx/cust3)*100)%>%
                    </span>
                    <%
                        }else{
                    %>
                    <span class="text-danger">
                      <i class="fa fa-arrow-down"></i> <%=String.format("%.2f",(-custx/cust3)*100)%>%
                    </span>
                    <%}%>
                    
                    <span class="text-muted">Since last week</span>
                    
                  </p>
                </div>
                 

                <div class="position-relative mb-4">
                  <canvas id="visitors-chart" height="200"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                  <span class="mr-2">
                    <i class="fa fa-square text-primary"></i> First Month
                  </span>

                </div>
              </div>
            </div>
            <!-- /.card -->

            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">Products</h3>
<!--                <div class="card-tools">
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-download"></i>
                  </a>
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>
                  </a>
                </div>-->
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-striped table-valign-middle">
                  <thead>
                  <tr>
                    <th>Product</th>
                    <th>Category</th>
                    
                    <!--<th>More</th>-->
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>
                      <img src="img/shop/cart/cart-2.jpg" alt="Product 1" >
                      Cakes
                    </td>
                    <td>Mid term</td>
                    
<!--                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>-->
                  </tr>
                  <tr>
                    <td>
                      <img src="img/shop/Bread.jpg" alt="Product 1"  style="height:100px;width:100px">
                      Bread
                    </td>
                    <td>Short term</td>

<!--                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>-->
                  </tr>
                  <tr>
                    <td>
                      <img src="img/shop/Cookies.jpg" alt="Product 1" style="height:100px;width:100px">
                      Cookies
                    </td>
                    <td>Long term</td>

<!--                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>-->
                  </tr>
                  <tr>
                    <td>
                        <img src="img/shop/Doughnuts.jpg" alt="Product 1"  style="height:100px;width:100px">
                      Doughnuts
                    </td>
                    <td>Mid term</td>
                   
<!--                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>-->
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">Sales</h3>
                  <!--<a href="javascript:void(0);">View Report</a>-->
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                  <p class="d-flex flex-column">
                 
                    <span>Sales Over Time</span>
                  </p>
                  <p class="ml-auto d-flex flex-column text-right">
                      <%
                      if(cust9>cust8){
                      %>
                    <span class="text-success">
                      <i class="fa fa-arrow-up"></i> <%=String.format("%.2f",(custy/cust8)*100)%>%
                    </span>
                    <%
                        }else{
                    %>
                    <span class="text-danger">
                      <i class="fa fa-arrow-down"></i> <%=String.format("%.2f",(-custy/cust8)*100)%>%
                    </span>
                    <%}%>
                    <span class="text-muted">Since last week</span>
                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4">
                  <canvas id="sales-chart" height="200"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                  <span class="mr-2">
                    <i class="fa fa-square text-primary"></i> This year
                  </span>

                  <span>
                    <i class="fa fa-square text-muted"></i> Last year
                  </span>
                </div>
              </div>
            </div>
            <!-- /.card -->

            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">Overview</h3>
                
              <div class="card-body">
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-warning text">
               
                  </p>
                  <p class="d-flex flex-column text-right">
                     <%
                      if(cust9>cust8){
                      %>
                      
                      
                    <span class="font-weight-bold">
                       <i class="text-success fa fa-arrow-up"></i><%=String.format("%.2f",(custy/cust8)*100)%>%
                    </span>
                    <%
                        }else{
                    %>
                    <span class="font-weight-bold">
                       <i class="text-danger fa fa-arrow-down"></i><%=String.format("%.2f",(-custy/cust8)*100)%>%
                    </span>
                    <%}%>
                    <span class="text-muted">SALES RATE</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-danger text">
               
                  </p>
                  <p class="d-flex flex-column text-right">
                      <%
                      if(custx>0){
                      %>
                    <span class="font-weight-bold">
                      <i class="text-success fa fa-arrow-up"></i> <%=String.format("%.2f",(custx/cust3)*100)%>%
                    </span>
                    <%}else{%>
                    <span class="font-weight-bold">
                      <i class="text-danger fa fa-arrow-down"></i> <%=String.format("%.2f",(-custx/cust3)*100)%>%
                    </span>
                    <%}%>
                    <span class="text-muted">CUSTOMER REGISTRATION RATE</span>
                  </p>
                </div>
                <!-- /.d-flex -->
              </div>
            </div>
          </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
    <!-- //charts -->


<!-- main content end-->

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
     
    $(function () {
  'use strict'

  var ticksStyle = {
    fontColor: '#495057',
    fontStyle: 'bold'
  }

  var mode = 'index'
  var intersect = true

  var $salesChart = $('#sales-chart')
  // eslint-disable-next-line no-unused-vars
  var salesChart = new Chart($salesChart, {
    type: 'bar',
    data: {
      labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
      datasets: [
        {
          backgroundColor: '#007bff',
          borderColor: '#007bff',
          data: [<%=cust11%>, <%=cust10%>, <%=cust8%>, <%=cust9%>]
        },
//        {
//          backgroundColor: '#ced4da',
//          borderColor: '#ced4da',
//          data: [700, 1700, 2700, 2000, 1800, 1500]
//        }
      ]
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        mode: mode,
        intersect: intersect
      },
      hover: {
        mode: mode,
        intersect: intersect
      },
      legend: {
        display: false
      },
      scales: {
        yAxes: [{
          // display: false,
          gridLines: {
            display: true,
            lineWidth: '4px',
            color: 'rgba(0, 0, 0, .2)',
            zeroLineColor: 'transparent'
          },
          ticks: $.extend({
            beginAtZero: true,

            // Include a dollar sign in the ticks
            callback: function (value) {
              if (value >= 1000) {
                value /= 1000
                value += 'k'
              }

              return 'shs' + value
            }
          }, ticksStyle)
        }],
        xAxes: [{
          display: true,
          gridLines: {
            display: false
          },
          ticks: ticksStyle
        }]
      }
    }
  })

  var $visitorsChart = $('#visitors-chart')
  // eslint-disable-next-line no-unused-vars
  var visitorsChart = new Chart($visitorsChart, {
    data: {
      labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
      datasets: [{
        type: 'line',
        data: [<%=cust1%>, <%=cust2%>, <%=cust3%>, <%=cust4%>],
        backgroundColor: 'transparent',
        borderColor: '#007bff',
        pointBorderColor: '#007bff',
        pointBackgroundColor: '#007bff',
        fill: false
        // pointHoverBackgroundColor: '#007bff',
        // pointHoverBorderColor    : '#007bff'
      },
//      {
//        type: 'line',
//        data: [60, 80, 70, 67, 80, 77, 100],
//        backgroundColor: 'tansparent',
//        borderColor: '#ced4da',
//        pointBorderColor: '#ced4da',
//        pointBackgroundColor: '#ced4da',
//        fill: false
//        // pointHoverBackgroundColor: '#ced4da',
//        // pointHoverBorderColor    : '#ced4da'
//      }
      ]
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        mode: mode,
        intersect: intersect
      },
      hover: {
        mode: mode,
        intersect: intersect
      },
      legend: {
        display: false
      },
      scales: {
        yAxes: [{
          // display: false,
          gridLines: {
            display: true,
            lineWidth: '4px',
            color: 'rgba(0, 0, 0, .2)',
            zeroLineColor: 'transparent'
          },
          ticks: $.extend({
            beginAtZero: true,
            suggestedMax: 12
          }, ticksStyle)
        }],
        xAxes: [{
          display: true,
          gridLines: {
            display: false
          },
          ticks: ticksStyle
        }]
      }
    }
  })
})

 </script>
 <!--// loading-gif Js -->
 <script src="js/adminlte.js"></script>
<script src="js/demo.js"></script>
<script src="js/demo2.js"></script>
<script src="js/liga.js"></script>
 <script src="js/bootstrap.bundle.min.js"></script>
 <script src="js/dashboard3.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>


<%
    }catch(Exception k){
out.println(k.getMessage());
}
%>

</body>

</html>
  
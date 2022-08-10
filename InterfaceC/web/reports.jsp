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
                
                ResultSet rs = st.executeQuery("Select * from products");
                 
                Gson gsonObj = new Gson();
                Map<Object,Object> map = null;
                List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
                 while(rs.next()){
                    map = new HashMap<Object,Object>(); map.put("label", rs.getString("PName")); map.put("y", rs.getInt("likes")); list.add(map);
    }

String dataPoints = gsonObj.toJson(list);

  
     ResultSet rs3 = st.executeQuery("Select count(CID) from customers where Gender='"+"Male"+"'");
    rs3.next();
      int Male = rs3.getInt(1);
      ResultSet rs4 = st.executeQuery("Select count(CID) from customers where Gender='"+"Female"+"'");

                                                                
     

                                                                rs4.next();
                                                                int Female = rs4.getInt(1);                  
Gson gsonObj1 = new Gson();
Map<Object,Object> map1 = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
 
 
                  map1 = new HashMap<Object,Object>(); map1.put("label", "Male"); map1.put("y", Male); list1.add(map1);
                  map1 = new HashMap<Object,Object>(); map1.put("label", "Female"); map1.put("y", Female); list1.add(map1);


String dataPoints1 = gsonObj1.toJson(list1);

%>
 
<!DOCTYPE html>


<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title:{
		text: "Product Likes PieChart Representation"
	},
	legend: {
		verticalAlign: "center",
		horizontalAlign: "right"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		indexLabel: "{y}",
		indexLabelPlacement: "inside",
		legendText: "{label}: {y}",
		toolTipContent: "<b>{label}</b>: {y}",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
chart.render();
 
//var chart1 = new CanvasJS.Chart("chartContainer", {
//	title: {
//		text: "Customers By Gender"
//	},
//	axisX: {
//		title: "Gender"
//	},
//	axisY: {
//		title: "Customers",
//		includeZero: true
//	},
//	data: [{
//		type: "column",
//		yValueFormatString: "$#,##0.0# billion",
//		dataPoints: <%out.print(dataPoints1);%>
//	}]
//});
//chart1.render();
// 
}
</script>
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
<!--        <div class="user-dropdown-details d-flex">
          <div class="profile_details_left">
            <ul class="nofitications-dropdown">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i
                    class="fa fa-bell-o"></i><span class="badge blue">3</span></a>
                <ul class="dropdown-menu">
                  <li>
                    <div class="notification_header">
                      <h3>You have 3 new notifications</h3>
                    </div>
                  </li>
                  <li><a href="#" class="grid">
                      <div class="user_img"><img src="assets/images/avatar1.jpg" alt=""></div>
                      <div class="notification_desc">
                        <p>Johnson purchased template</p>
                        <span>Just Now</span>
                      </div>
                    </a></li>
                  <li class="odd"><a href="#" class="grid">
                      <div class="user_img"><img src="assets/images/avatar2.jpg" alt=""></div>
                      <div class="notification_desc">
                        <p>New customer registered </p>
                        <span>1 hour ago</span>
                      </div>
                    </a></li>
                  <li><a href="#" class="grid">
                      <div class="user_img"><img src="assets/images/avatar3.jpg" alt=""></div>
                      <div class="notification_desc">
                        <p>Lorem ipsum dolor sit amet </p>
                        <span>2 hours ago</span>
                      </div>
                    </a></li>
                  <li>
                    <div class="notification_bottom">
                      <a href="#all" class="bg-primary">See all notifications</a>
                    </div>
                  </li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i
                    class="fa fa-comment-o"></i><span class="badge blue">4</span></a>
                <ul class="dropdown-menu">
                  <li>
                    <div class="notification_header">
                      <h3>You have 4 new messages</h3>
                    </div>
                  </li>
                  <li><a href="#" class="grid">
                      <div class="user_img"><img src="assets/images/avatar1.jpg" alt=""></div>
                      <div class="notification_desc">
                        <p>Johnson purchased template</p>
                        <span>Just Now</span>
                      </div>
                    </a></li>
                  <li class="odd"><a href="#" class="grid">
                      <div class="user_img"><img src="assets/images/avatar2.jpg" alt=""></div>
                      <div class="notification_desc">
                        <p>New customer registered </p>
                        <span>1 hour ago</span>
                      </div>
                    </a></li>
                  <li><a href="#" class="grid">
                      <div class="user_img"><img src="assets/images/avatar3.jpg" alt=""></div>
                      <div class="notification_desc">
                        <p>Lorem ipsum dolor sit amet </p>
                        <span>2 hours ago</span>
                      </div>
                    </a></li>
                  <li><a href="#" class="grid">
                      <div class="user_img"><img src="assets/images/avatar1.jpg" alt=""></div>
                      <div class="notification_desc">
                        <p>Johnson purchased template</p>
                        <span>Just Now</span>
                      </div>
                    </a></li>
                  <li>
                    <div class="notification_bottom">
                      <a href="#all" class="bg-primary">See all messages</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>-->
          <!--</div>-->
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

    
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<a href="/InterfaceC/report1.jsp"><b>NEXT REPORT</b></a>
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
  



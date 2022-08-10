
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
  
  <style>
            td{
                padding: 10px;
            }
            div{
                width: 50%;
                border: 1px solid black;
                border-radius: 5px;
                background:lightsteelblue;
            }
        </style>
</head>

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
            <li class="active"><a href="monthlysales.jsp">View Monthly Sales ratio</a></li>
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
            
          </div>
        </div>
      </div>
    </div>
    <!-- //statistics data -->

  </div>
  <!-- //content -->
  
 <%
         try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/confectionery","root","");
             Statement st= conn.createStatement();
             Statement st1= conn.createStatement();
             Statement st5= conn.createStatement();
             Statement st7= conn.createStatement();
             Statement st9= conn.createStatement();
             Statement st8= conn.createStatement();
             Statement st2= conn.createStatement();
             Statement st12= conn.createStatement();
             Statement st13= conn.createStatement();
             Statement st14= conn.createStatement();
             
             ResultSet rs = st.executeQuery("Select count(SID)  from staff");          
             ResultSet rs5 = st7.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Cookies"+"'");
             ResultSet rs6 = st9.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Doughnuts"+"'");
             ResultSet rs4 = st5.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Cakes"+"'");           
             ResultSet rs2 = st1.executeQuery("Select sum(STotal)  from sales WHERE PName='"+"Bread"+"'");
              ResultSet rs8 = st8.executeQuery("Select sum(STotal)  from sales"); 
             rs.next();
             int count = rs.getInt(1);
             rs2.next();
             int t = rs2.getInt(1); 
             rs4.next();
             int c = rs4.getInt(1);
             rs5.next();
             int o = rs5.getInt(1);
             rs6.next();
             int u = rs6.getInt(1);
             rs8.next();
             int w = rs8.getInt(1);
             
              int p=(t*count)/w;
              int q=(c*count)/w;
              int k=(o*count)/w; 
              int j=(u*count)/w;
              
              if(p == 0 || q==0 || k==0 || j==0){
                if(p==0)
                    p+=1;
                else if(q==0)
                    q+=1;
                else if(k==0)
                    k+=1;
                else if(j==0)
                    j+=1;
                    
            }
            
            int tot=p+q+k+j;
            int sa= count-tot;
            if(tot!=count){
            int arr[]={p,q,k,j};
              int max = Arrays.stream(arr).max().getAsInt();
              
              //out.println(max);
              if(p==max)
                    p+=sa;
                else if(q==max)
                    q+=sa;
                else if(k==max)
                    k+=sa;
                else if(j==max)
                    j+=sa;
            }
           //   int a= (t*count)%w;
            //  double b=(double)c/w;
            //  double d=(double)o/w;
         //     double e=(double)u/w;
              out.println(p);
              out.println(q);
              out.println(k);
              out.println(j);
              ResultSet rs1 = st2.executeQuery("Select *  from staff LIMIT "+k+""); 
              ResultSet rs11 = st12.executeQuery("Select *  from staff LIMIT "+j+" OFFSET "+k+""); 
              ResultSet rs12 = st13.executeQuery("Select *  from staff LIMIT  "+q+" OFFSET "+(k+j)+""); 
              ResultSet rs13 = st14.executeQuery("Select *  from staff LIMIT "+(p)+" OFFSET "+(k+q+j)+""); 
       //        ResultSet rs1 = st2.executeQuery("Select *  from staff LIMIT "+(p+)+" OFFSET "+p+""); 
        //      out.println(a); 
        %>
        <h1 style="align-content: center">REALLOCATING STAFF</h1> 
        <br>
        <div>
            <table border="0">
            <tr>
                <td>Number of Staff</td>
                <td><% out.println(count);%></td>
            </tr>
            </table>
          </div>
   
                 <h2>COOKIES REALLOCATING</h2>
                 <div>
                  <table width="50%">
                <tr>
                    <th>SID</th>
                    <th>FName</th>
                    <th>LName</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>PNumber</th>
                     <th>Category</th> 
                   
                </tr>
            <%
                
                while(rs1.next()){
                %>
                <tr>
                    <td><%out.println(rs1.getString("SID"));%></td>
                    <td><%out.println(rs1.getString("FName"));%></td>
                    <td><%out.println(rs1.getString("LName"));%></td>
                    <td><%out.println(rs1.getString("Email"));%></td>
                    <td><%out.println(rs1.getString("Gender"));%> </td>
                   <td><%out.println(rs1.getString("PNumber"));%> </td>
                     <td><%out.println(rs1.getString("Category"));%> </td>
                  
                      
                </tr>
                 
                
                   <%
                       }
                   %>
                    </table>
                    </div>
        <h2>DOUGHNUTS REALLOCATING</h2>
        <div>
                  <table width="50%">
                <tr>
                    <th>SID</th>
                    <th>FName</th>
                    <th>LName</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>PNumber</th>
                     <th>Category</th> 
                   
                </tr>
            <%
                
                while(rs11.next()){
                %>
                <tr>
                    <td><%out.println(rs11.getString("SID"));%></td>
                    <td><%out.println(rs11.getString("FName"));%></td>
                    <td><%out.println(rs11.getString("LName"));%></td>
                    <td><%out.println(rs11.getString("Email"));%></td>
                    <td><%out.println(rs11.getString("Gender"));%> </td>
                   <td><%out.println(rs11.getString("PNumber"));%> </td>
                    <td><%out.println(rs11.getString("Category"));%> </td>
                      
                </tr>
                  
                 
                   <%
                       }
                   %>
                  
                   </table>
        </div>  
        <h2>CAKES REALLOCATING</h2>
        <div>
                  <table width="50%">
                <tr>
                    <th>SID</th>
                    <th>FName</th>
                    <th>LName</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>PNumber</th>
                     <th>Category</th> 
                   
                </tr>
            <%
                
                while(rs12.next()){
                %>
                <tr>
                    <td><%out.println(rs12.getString("SID"));%></td>
                    <td><%out.println(rs12.getString("FName"));%></td>
                    <td><%out.println(rs12.getString("LName"));%></td>
                    <td><%out.println(rs12.getString("Email"));%></td>
                    <td><%out.println(rs12.getString("Gender"));%> </td>
                   <td><%out.println(rs12.getString("PNumber"));%> </td>
                    <td><%out.println(rs12.getString("Category"));%> </td>
                      
                </tr>
                
                
                   <%
                       }
                   %>
         </table>
        </div>
          <h2>BREAD REALLOCATING</h2>
          <div>
                  <table width="50%">
                <tr>
                    <th>SID</th>
                    <th>FName</th>
                    <th>LName</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>PNumber</th>
                     <th>Category</th> 
                   
                </tr>
            <%
                
                while(rs13.next()){
                %>
                <tr>
                    <td><%out.println(rs13.getString("SID"));%></td>
                    <td><%out.println(rs13.getString("FName"));%></td>
                    <td><%out.println(rs13.getString("LName"));%></td>
                    <td><%out.println(rs13.getString("Email"));%></td>
                    <td><%out.println(rs13.getString("Gender"));%> </td>
                   <td><%out.println(rs13.getString("PNumber"));%> </td>
                    <td><%out.println(rs13.getString("Category"));%> </td>
                      
                </tr>
                
                
                   <%
                       }
                   %>
         </table>
          </div>
     <%
}
 catch(Exception er){
            out.println("Connection Failed" +er.getMessage());
        }
            %>
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


<%-- 
    Document   : customertracking
    Created on : Aug 8, 2022, 11:07:36 AM
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

  <title>Customer Tracking</title>

  <!-- Template CSS -->
  <link rel="stylesheet" href="css/style-starter.css">

  <!-- google fonts -->
  <link href="//fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900display=swap" rel="stylesheet">
</head>
<%--
       DatabaseConnection connection = new DatabaseConnection();        
                                        Connection conn = connection.getConn();
             Statement st= conn.createStatement();
  --%>
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
        <li class="active">
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
     
        <li><a href="products.jsp"><i class="fa fa-file-text"></i> <span>Products</span></a></li>
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
                         String uname=(String)request.getSession().getAttribute("Fname");
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
    <div>
      <h1>Customer Tracking and  Advisory</h1>
    </div>

    <!-- statistics data -->
<!--    <div class="statistics">
      <div class="row">
        <div class="col-xl-6 pr-xl-2">
          <div class="row">
              <div class="col-sm-6 pr-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-users"> </i>
                <h3 class="text-primary number" style="font-family: Algerian;font-weight: bold">29.75 M</h3>
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px">Total Staff</p>
              </div>
            </div>
            <div class="col-sm-6 pl-sm-2 statistics-grid" >
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-eye"> </i>
                <h3 class="text-secondary number" style="font-family: Algerian;font-weight: bold">51.25 K</h3>
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
                <h3 class="text-success number" style="font-family: Algerian;font-weight: bold">166.89 M</h3>
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px">Visitors</p>
              </div>
            </div>
            <div class="col-sm-6 pl-sm-2 statistics-grid">
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-cart"> </i>
                <h3 class="text-danger number" style="font-family: Algerian;font-weight: bold">1,250k</h3>
                <p class="stat-text" style="font-family: Arial;font-weight: bold;font-size: 15px">Total Orders</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>-->
    <!-- //statistics data -->
    
       <form action="customertracking.jsp" method="post">
           <label>Enter beginning date:&emsp;</label><input type="date" name="date1"/><br><br>
            <label>Enter ending date:&emsp;</label><input type="date" name="date2"/><br>
            <input type="submit" class="btn btn-primary" value="Send">
        </form>
    <%
                     // Product mostly consumed by females
          try{
            Class.forName("com.mysql.jdbc.Driver");
//            out.println("Driver successfully loaded<br />");
               }
             catch(ClassNotFoundException e){
                out.println("Error is " + e.getMessage() + "<br />");
            }
            try{
            Connection con=null;
            Statement st=null;
            String name1 = request.getParameter("date1");
            String name2 = request.getParameter("date2");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/confectionery","root","");
            out.println();
//            out.println("Successfully connected to the database confectionery<br /><br />");
            st= con.createStatement();
            ResultSet kst1 = st.executeQuery("select count(CID) from sales where Date between ' "+name1+" ' and ' "+name2+" ' ");
            kst1.next();
            int num3= kst1.getInt(1);
            out.println("Total number of customers from " +name1 + " to " +name2+ " is: " + num3);
            
             // Product mostly consumed by females
           ResultSet set1 = st.executeQuery("select count(SalesID) from sales where PName='Bread' and Date between ' "+name1+" ' and ' "+name2+" ' and Gender ='Female'");
            set1.next();
            int female= set1.getInt(1);
            int dfemale = female;
                
            
            ResultSet set2 = st.executeQuery("select count(SalesID) from sales where PName='Cookies' and Date between ' "+name1+" ' and ' "+name2+" ' and Gender ='Female'");
                        set2.next();
            int female1= set2.getInt(1);
            int dfemale1 = female1;
                
            
            ResultSet set3 = st.executeQuery("select count(SalesID) from sales where PName='Doughnuts' and Date between ' "+name1+" ' and ' "+name2+" ' and Gender ='Female'");
                        set3.next();
            int female2= set3.getInt(1);
            int dfemale2 = female2;
                
            
            ResultSet set4 = st.executeQuery("select count(SalesID) from sales where PName='Cakes' and Date between ' "+name1+" ' and ' "+name2+" ' and Gender ='Female'");
                        set4.next();
            int female3= set4.getInt(1);
            int dfemale3 = female;
            
           
            
            // Product mostly consumed by males
           
            ResultSet set5 = st.executeQuery("select count(SalesID) from sales where PName='Doughnuts' and Date between ' "+name1+" ' and ' "+name2+" ' and Gender ='Male'");
                        set5.next();
            int male= set5.getInt(1);
            int dmale = male;
                
            
            ResultSet set6 = st.executeQuery("select count(SalesID) from sales where PName='Cakes' and Date between ' "+name1+" ' and ' "+name2+" ' and Gender ='Male'");
                        set6.next();
            int male1= set6.getInt(1);
            int dmale1 = male1;
                
            
            ResultSet set7 = st.executeQuery("select count(SalesID) from sales where PName='Cookies' and Date between ' "+name1+" ' and ' "+name2+" ' and Gender ='Male'");
                        set7.next();
            int male2= set7.getInt(1);
            int dmale2 = male2;
                
            
            ResultSet set8 = st.executeQuery("select count(SalesID) from sales where PName='Bread' and Date between ' "+name1+" ' and ' "+name2+" ' and Gender ='Male'");
                        set8.next();
            int male3= set8.getInt(1);
            int dmale3 = male3;
                
            
            
         
              
                             
            
            //Central region customers
           
            ResultSet set9 = st.executeQuery("select count(SalesID) from sales where PName='Bread' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Central'");
            set9.next();
            int central= set9.getInt(1);
            int dcentral1 = central;
                
            
                        ResultSet set10 = st.executeQuery("select count(SalesID) from sales where PName='Cookies' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Central'");
            set10.next();
            int central2= set10.getInt(1);
            int dcentral2 = central2;
                
                
                        ResultSet set11 = st.executeQuery("select count(SalesID) from sales where PName='Cakes' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Central'");
            set11.next();
            int central3= set11.getInt(1);
            int dcentral3 = central3;
                
            
                        ResultSet set12 = st.executeQuery("select count(SalesID) from sales where PName='Doughnuts' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Central'");
            set12.next();
            int central4= set12.getInt(1);
            int dcentral4 = central;
                
                

            
            
            //Northern region customers
          
            ResultSet s = st.executeQuery("select count(SalesID) from sales where PName='Bread' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Northern'");
            s.next();
            int north= s.getInt(1);
            int dnorth1 = north;
                
            
                        ResultSet s1 = st.executeQuery("select count(SalesID) from sales where PName='Cookies' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Northern'");
            s1.next();
            int north1= s1.getInt(1);
            int dnorth2 = north1;
                
            
                        ResultSet s2 = st.executeQuery("select count(SalesID) from sales where PName='Cakes' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Northern'");
            s2.next();
            int north2= s2.getInt(1);
            int dnorth3 = north2;
                
            
                        ResultSet s3 = st.executeQuery("select count(SalesID) from sales where PName='Doughnuts' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Northern'");
            s3.next();
            int north3= s3.getInt(1);
            int dnorth4 = north3;
                
             
            
            //Southern region customers
            
            ResultSet s4 = st.executeQuery("select count(SalesID) from sales where PName='Bread' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Southern'");
            s4.next();
            int south = s4.getInt(1);
            int dsouth = south;
                
            
                        ResultSet s5 = st.executeQuery("select count(SalesID) from sales where PName='Cookies' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Southern'");
            s5.next();
            int south1= s5.getInt(1);
            int dsouth1 = south1;
                
            
                        ResultSet s6 = st.executeQuery("select count(SalesID) from sales where PName='Cakes' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Southern'");
            s6.next();
            int south2= s6.getInt(1);
            int dsouth2= south2;
                
            
                        ResultSet s7 = st.executeQuery("select count(SalesID) from sales where PName='Doughnuts' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Southern'");
            s7.next();
            int south3= s7.getInt(1);
            int dsouth3 = south3;
                
                

            
            //Eastern region customers
            out.println("<br /><br />");
            ResultSet s8= st.executeQuery("select count(SalesID) from sales where PName='Bread' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Eastern'");
            s8.next();
            int east= s8.getInt(1);
            int deast = east;
                
            
                        ResultSet s9 = st.executeQuery("select count(SalesID) from sales where PName='Cookies' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Eastern'");
            s9.next();
            int east1= s9.getInt(1);
            int deast1 = east1;
               
            
                        ResultSet s10 = st.executeQuery("select count(SalesID) from sales where PName='Cakes' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Eastern'");
            s10.next();
            int east2= s10.getInt(1);
            int deast2 = east2;
                
            
                        ResultSet s11 = st.executeQuery("select count(SalesID) from sales where PName='Doughnuts' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Eastern'");
            s11.next();
            int east3= s11.getInt(1);
            int deast3 = east3;
                 
            
            
            //Western region customers
            
            ResultSet s12= st.executeQuery("select count(SalesID) from sales where PName='Bread' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Western'");
            s12.next();
            int west= s12.getInt(1);
            int dwest = west;
                           
                        ResultSet s13 = st.executeQuery("select count(SalesID) from sales where PName='Cookies' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Western'");
              s13.next();
            int west1= s13.getInt(1);
            int dwest1 = west1;

            
                        ResultSet s14 = st.executeQuery("select count(SalesID) from sales where PName='Cakes' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Western'");
              s14.next();
            int west2= s14.getInt(1);
            int dwest2 = west2;
               
            
                        ResultSet s15 = st.executeQuery("select count(SalesID) from sales where PName='Doughnuts' and Date between ' "+name1+" ' and ' "+name2+" ' and Region ='Western'");
              s15.next();
            int west3= s15.getInt(1);
            int dwest3 = west3;
             
        
                        
            
            
            int cakenum,doughnutnum,breadnum,cookienum;
            out.println("<br /><br />");
            ResultSet s16= st.executeQuery("select count(SalesID) from sales where PName='Bread' and Date between ' "+name1+" ' and ' "+name2+" ' ");
            s16.next();
           breadnum = s16.getInt(1);
            int bread1 = breadnum;
            
                        ResultSet s17 = st.executeQuery("select count(SalesID) from sales where PName='Cookies' and Date between ' "+name1+" ' and ' "+name2+" ' ");
              s17.next();
           cookienum = s17.getInt(1);
            int cookie1 = cookienum;
                        //while(s17.next()){
                            cookienum=s17.getInt(1);

                        ResultSet s18 = st.executeQuery("select count(SalesID) from sales where PName='Cakes' and Date between ' "+name1+" ' and ' "+name2+" ' ");
                        //while(s18.next()){
                             s18.next();
           cakenum = s18.getInt(1);
            int cake1 = cakenum;
             
                        ResultSet s19 = st.executeQuery("select count(SalesID) from sales where PName='Doughnuts' and Date between ' "+name1+" ' and ' "+name2+" ' ");
                        //while(s19.next()){
                             s19.next();
           doughnutnum = s19.getInt(1);
            int doughnut1 = doughnutnum;
     %>
    <div class="card">
              <div class="card-header">
                <h4 class="card-title">CUSTOMER TRENDS BASING ON GENDER FROM  <%=name1%> TO  <%=name2%></h4>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 10px">Product</th>
                      <th>Female</th>
                      <th>Male</th>
                      <!--<th>Male</th>-->
                      <!--<th style="width: 40px">Label</th>-->
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Bread</td>
                      <td><%=female%></td>
                      <td><%=male3%></td>
                      
                    </tr>
                    <tr>
                      <td>Cookies</td>
                      <td><%=female1%></td>
                      <td><%=male2%></td>
                      
                    </tr>
                    <tr>
                      <td>Cakes</td>
                      <td><%=female2%></td>
                      <td><%=male1%></td>
                     
                    </tr>
                    <tr>
                      <td>Doughnuts</td>
                      <td><%=female3%></td>
                      <td><%=male%></td>
                                          </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
                                          <%
                                          while(true){
            if (male > male3 && male > male2 && male > male1){
               out.println("Doughnuts had the most male customers ." + "<br />");
               break;
            }
            else if (male3 > male1 && male3 > male2){
               out.println("Bread had the most male customer." + "<br />");
               break;
        }
        else if (male1 > male2){
               out.println("Cakes had the most male customers." + "<br />");
                break;
                }
             else { 
            out.println("Cookies had the most male customers." + "<br />");
            break;
             }
        }
                             
                                              while(true){
            if (female2 > female && female2 > female3 && female2 > female1){
               out.println("Doughnuts had the most female customers ." + "<br />");
               break;
            }
            else if (female > female1 && female > female3){
               out.println("Bread had the most female customers. " + "<br />");
               break;
        }
        else if (female3 > female1){
               out.println("Cakes had the most female customers." + "<br />");
                break;
                }
             else { 
            out.println("Cookies had the most female customers." + "<br />");
            break;
             }
        }
                                          %>
                                          <br>      
             <div class="card">
              <div class="card-header">
                <h4 class="card-title">CUSTOMER TRENDS BASING ON LOCATION FROM  <%=name1%> TO  <%=name2%></h4>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 10px">Product</th>
                      <th>Central</th>
                      <th>Northern</th>
                      <th>Southern</th>
                      <th>Eastern</th>
                      <th>Western</th>
                     
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Bread</td>
                      <td><%=central%></td>
                      <td><%=north%></td>
                      <td><%=south%></td>
                      <td><%=east%></td>
                      <td><%=west%></td>
          
                      
                    </tr>
                    <tr>
                      <td>Cookies</td>
                      <td><%=central2%></td>
                      <td><%=north1%></td>
                      <td><%=south1%></td>
                      <td><%=east1%></td>
                      <td><%=west1%></td>
                      
                    </tr>
                    <tr>
                      <td>Cakes</td>
                      <td><%=central3%></td>
                      <td><%=north2%></td>
                      <td><%=south2%></td>
                      <td><%=east2%></td>
                      <td><%=west2%></td>
                     
                    </tr>
                    <tr>
                      <td>Doughnuts</td>
                      <td><%=central4%></td>
                      <td><%=north3%></td>
                      <td><%=south3%></td>
                      <td><%=east3%></td>
                      <td><%=west3%></td>
                                          </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
                                          <%
                                           while(true){
            if (west3 > west && west3 > west2 && west3 > west1){
               out.println("Doughnuts had the most customers in the Western region ." + "<br />");
               break;
            }
            else if (west > west2 && west > west1){
               out.println("Bread had the most customers in the Western region. " + "<br />");
               break;
        }
        else if (west2 > west1){
               out.println("Cakes had the most customers in the  Western region." + "<br />");
                break;
                }
             else { 
            out.println("Cookies had the most customers in the Western region." + "<br />");
            break;
             }
        }
                                          while(true){
            if (east3 > east && east3 > east2 && east3 > east1){
               out.println("Doughnuts had the most customers in the Eastern region." + "<br />");
               break;
            }
            else if (east > east2 && east > east1){
               out.println("Bread had the most customers in the Eastern region. " + "<br />");
               break;
        }
        else if (east2 > east1){
               out.println("Cakes had the most customers in the  Eastern region." + "<br />");
                break;
                }
             else { 
            out.println("Cookies had the most customers in the Eastern region." + "<br />");
            break;
             }
        }
                                                         while(true){
            if (south3 > south && south3 > south2 && south3 > south1){
               out.println("Doughnuts had the most customers in the Southern region." + "<br />");
               break;
            }
            else if (south > south2 && south > south1){
               out.println("Bread had the most customers in the Southern region." + "<br />");
               break;
        }
        else if (south2 > south1){
               out.println("Cakes had the most customers in the  Southern region." + "<br />");
                break;
                }
             else { 
            out.println("Cookies had the most customers in the Southern region." + "<br />");
            break;
             }
        }
                                                                      while(true){
            if (north3 > north && north3 > north2 && north3 > north1){
               out.println("Doughnuts had the most customers in the Northern region." + "<br />");
               break;
            }
            else if (north > north2 && north > north1){
               out.println("Bread had the most customers in the Northern region." + "<br />");
               break;
        }
        else if (north2 > north1){
               out.println("Cakes had the most customers in the  Northern region." + "<br />");
                break;
                }
             else { 
            out.println("Cookies had the most customers in the Northern region." + "<br />");
            break;
             }
        } 
                                                                                       while(true){
            if (central4 > central && central4 > central3 && central4 > central2){
               out.println("Doughnuts had the most customers in the Central region." + "<br />");
               break;
            }
            else if (central > central3 && central > central2){
               out.println("Bread had the most customers in the Central region." + "<br />");
               break;
        }
        else if (central3 > central2){
               out.println("Cakes had the most customers in the Central region." + "<br />");
                break;
                }
             else { 
            out.println("Cookies had the most customers in the Central region." + "<br />");
            break;
             }
        }
                                          %>
                                          <br>
           <div class="card">
              <div class="card-header">
                <h4 class="card-title">CUSTOMER TRENDS BASING ON PREFERENCES FROM  <%=name1%> TO  <%=name2%></h4>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 10px">Product</th>
                      <th>Total Number of Customers</th>
                      
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Bread</td>
                      <td><%=breadnum%></td>

                      
                    </tr>
                    <tr>
                      <td>Cookies</td>
                      <td><%=cookienum%></td>
                 
                      
                    </tr>
                    <tr>
                      <td>Cakes</td>
                      <td><%=cakenum%></td>
                      
                     
                    </tr>
                    <tr>
                      <td>Doughnuts</td>
                      <td><%=doughnutnum%></td>
                    
                                          </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
                      <%
                       while(true){
            if (cookienum > breadnum && cookienum > cakenum && cookienum > doughnutnum){
               out.println("Cookies had the most customers." + "<br />");
               break;
            }
            else if (breadnum > cakenum && breadnum > doughnutnum){
               out.println("Bread had the most customers." + "<br />");
               break;
        }
        else if (cakenum > doughnutnum){
               out.println("Cakes had the most customers ." + "<br />");
                break;
                }
             else { 
            out.println("Doughnuts had the most customers ." + "<br />");
            break;
             }
        }
        %>
    <!-- //modals -->

  </div>
  <!-- //content -->
</div>
<!-- main content end-->
</section>
  <!--footer section start-->
<footer class="dashboard">
  <p>All rights reserved by Yeye Confectionery. Design by Group 15</p>
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

<%
                   }
            catch(SQLException e){
                out.println("Error is " + e.getMessage());
            }
%>

</body>

</html>
  


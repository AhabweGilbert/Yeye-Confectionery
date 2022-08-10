<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Registration</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
                 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
                <link rel="stylesheet" href="css/main.css">
                 <link rel="stylesheet" href="css/adminlte.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
                <link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/hamburgers.min.css">
	<link rel="stylesheet" href="css/animsition.min.css">
	<link rel="stylesheet" href="css/select2.min.css">	
	<link rel="stylesheet" href="css/daterangepicker.css">
	<link rel="stylesheet" href="css/util.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
	<script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('img/back image.jpg');">
                    <div class="wrap-login100" style="background-color: #ff4e00;
background-image: linear-gradient(315deg, #ff4e00 0%, #ec9f05 74%);">
                         
                        <form class="login100-form validate-form" action="Customer_Registration" method="post">
					<span class="login100-form-logo">
						<img src="img/mylogo.png" alt="alt"/>
					</span>
					

					<span class="login100-form-title p-b-34 p-t-27">
						Customer Registration
					</span>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="fname" placeholder="First name">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
                                    
                                                                                          <div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="lname" placeholder="Last name">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
                                            
                                                                                          <div class="wrap-input100 validate-input" data-validate="Enter phonenumber">
						<input class="input100" type="text" name="pnum" placeholder="Phone Number">
						<span class="focus-input100" data-placeholder="&#xf202;"></span>
					</div>
                                    
                                                                                            <div class="input-group mb-3">
              <b>&ensp;Gender&emsp;&emsp;</b>
<div class="form-check">
  <input class="form-check-input" type="radio" name="cgen" id="flexRadioDefault1" value="Male">
  <label class="form-check-label" for="flexRadioDefault1">
      <span class="fas fa-male fa-lg"></span>
    Male&emsp;
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="cgen" id="flexRadioDefault2" value="Female">
  <label class="form-check-label" for="flexRadioDefault2">
      <span class="fas fa-female fa-lg"></span>
      Female<br>
  </label>
</div>
          </div>
                                    
                                                                                            <div class="wrap-input100 validate-input" data-validate="Enter email">
						<input class="input100" type="email" name="email" placeholder="Email">
						<span class="focus-input100" data-placeholder="&#xf200;"></span>
					</div>
					
                                                                                            

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Register
						</button>
					</div>
                                    
                                    <div style="font-family: Times New Roman;font-weight: bold;color: #fff">
              Already a member <a href="Customer_login.jsp" style="color: #531d05">login here</a>
            </div>
					
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
	  <script src="js/jquery.min.js"></script>
	<script src="js/animsition.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/moment.min.js"></script>
	<script src="js/daterangepicker.js"></script>
	<script src="js/countdowntime.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
<!--<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Customer Registration</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
   Google Font: Source Sans Pro 
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700display=fallback">
    <link rel="stylesheet" href="css/adminlte.min.css">
  <script src="js/adminlte.min.js"></script>
  <script src="js/jquery.min.js"></script>
   <link rel="stylesheet" href="css/all.css">
     <link rel="stylesheet" href="css/jqvmap.min.css">
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="js/all.min.js"></script>
      <script src="js/fontawesome.js"></script>
        <script src="js/fontawesome.min.js"></script>
         <link rel="stylesheet" href="css/fontawesome.min.css">
        <link rel="stylesheet" href="css/fontawesome.css">
        <link rel="stylesheet" href="css/main.css">
        
</head>
<body class="hold-transition register-page">
    <div class="container-login100" style="background-image: url('img/back image.jpg');">
<div class="register-box">
  <div class="card card-outline card-danger">
    <div class="card-header text-center">
        <p class="h2" style="color: brown"><b>CUSTOMER </b><b style="font-size: 24px">REGISTRATION</b></p>
    </div>
    <div class="card-body">
      <form action="Customer_Registration" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="First name" name="cfname">
          <input type="text" class="form-control" placeholder="Last name" name="clname">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
          <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Phone Number" name="cpnum">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-phone"></span>
            </div>
          </div>
        </div>
          <div class="input-group mb-3">
              <b>&ensp;Gender&emsp;&emsp;</b>
<div class="form-check">
  <input class="form-check-input" type="radio" name="cgen" id="flexRadioDefault1" value="Male">
  <label class="form-check-label" for="flexRadioDefault1">
      <span class="fas fa-male fa-lg"></span>
    Male&emsp;
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="cgen" id="flexRadioDefault2" value="Female">
  <label class="form-check-label" for="flexRadioDefault2">
      <span class="fas fa-female fa-lg"></span>
      Female<br>
  </label>
</div>
          </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="Email" name="email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="cpass">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
       
        <div class="row">
            <div class="col-4">
            <button type="submit" class="btn btn-danger btn-block">Register</button>
            </div>
          <div class="col-8">
              
            <div class="icheck-primary">
              <a href="Customer_login.jsp" class="text-center">I already have a membership</a>
            </div>
          </div>
           
          
           /.col 
        </div>
      </form>
      
    </div>
     /.form-box 
  </div> /.card 
</div>
 /.register-box 


    </div>
</body>
</html>-->
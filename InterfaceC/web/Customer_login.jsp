<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Customer Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
                 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
     <%
         HttpSession hs = request.getSession();
       hs.removeAttribute("CustomerName");
       hs.removeAttribute("CID");
        %>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('img/back image.jpg');">
                    <div class="wrap-login100" style="background-color: #ff4e00;
background-image: linear-gradient(315deg, #ff4e00 0%, #ec9f05 74%);">
                        <form class="login100-form validate-form" action="Clogin" method="post">
					<span class="login100-form-logo">
                                            <img src="img/mylogo.png" alt="alt"/>
					</span>
					

					<span class="login100-form-title p-b-34 p-t-27">
						Customer Log in
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter email">
						<input class="input100" type="email" name="email" placeholder="Email">
						<span class="focus-input100" data-placeholder="&#xf200;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                                                <label class="label-checkbox100" for="ckb1" style="font-size: 14px">
							Remember me
						</label>
					</div>
                                                                                            

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>
<div style="font-family: Times New Roman;font-weight: bold;color: #fff">
    <br> Don't have an account <a href="Customer_register.jsp" style="color: #531d05">sign up here</a>
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

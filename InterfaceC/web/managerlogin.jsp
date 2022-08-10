<%-- 
    Document   : managerlogin
    Created on : Aug 6, 2022, 8:54:26 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> Stylish Login Form Design | Smarteyeapps.com</title>
	<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="assets/images/fav.png">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/rstyle.css">
        <link rel="stylesheet" href="css/all.css">
        <script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid bg-login" style="background-image: url('img/manager/bg-balloon.jpg');">
        
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-12 login-card" >
                    <div class="row">
                        <div class="col-md-6 detail-part" style="background-image: url('img/manager/login-balloon.jpg');">
                            <h1 style="font-family: Times New Roman">YEYE CONFECTIONERY</h1>
                            <p>Please use your credentials to login. </p>
                        </div>
                        <div class="col-md-6 logn-part" >
                          <div class="row">
                              <div class="col-lg-10 col-md-12 mx-auto" >
                                  <div class="logo-cover">
                                      <img src="img/manager/man3.png" alt="alt" />
                                      <!--<h2 style="font-family: Algerian">MANAGER PANEL</h2>-->
                                   </div>
                                    <div class="form-cover">
                                        <form action="Mlogin" method="post">
                                         <input placeholder="Enter Email" type="email" name="email2" class="form-control">
                                         <input Placeholder="Enter Password" type="password" name="password" class="form-control">
                                         <div class="row form-footer">
                                            No manager yet,
                                             <div style="font-family: Times New Roman;font-weight: bold;color: black">
                                                 <a href="managerregister.jsp" style="color: blue">Register here</a>     
                                             </div>
                                             <div>&emsp;&emsp;
                                                 <input type="submit" value="Login" class="btn btn-primary" style="background-color: rgb(4, 131, 250)">
                                             </div>
                                         </div>
                                             </form>
                                    </div>

                              </div>
                          </div>
                           
                           
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
                    
</html>
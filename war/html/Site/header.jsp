<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<% UserService userService = UserServiceFactory.getUserService(); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Sithija | Enterprise Cloud Storage</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="../../favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		<div class="header_top" style="background-color: #0096d6"><!--header_top-->
			<div class="container">
				<div class="row">
                    <div class="logo pull-left">
                        <a href="index.jsp"><img src="images/logo.jpg" alt="" height="40px" /></a>
                    </div>
		

                    <div class="col-sm-10">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href ="<%= userService.createLoginURL("/auth") %>"><i class="fa fa-lock"></i> Login</a></li>
                                <li><a href="register.jsp"><i class="fa fa-user"></i> Register</a></li>
                            </ul>
                        </div>
                    </div>
				</div>
			</div>
		</div><!--/header_top-->
		

	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp" class="active">Home</a></li>
								<li class="dropdown"><a href="#">About<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="sithija.jsp">Sithija</a></li>
										<li><a href="company.jsp">Our Vision</a></li>
										<li><a href="team.jsp">Team</a></li>
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Packages<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="trial.jsp">Free Version</a></li>
										<li><a href="packages.jsp">Cooperate</a></li>
                                    </ul>
                                </li>
								<li><a href="contact-us.jsp">Contact Us</a></li>
							</ul>
						</div>
					</div>
				</div>
                <hr>
			</div>
		</div><!--/header-bottom-->

	</header><!--/header-->
	
	
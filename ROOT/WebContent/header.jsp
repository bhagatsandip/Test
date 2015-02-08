<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>Online Web Directory</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/jquery.scrollgress.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="js/jquery.cookie.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-wide.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	
	<body class="landing">

<%
String username = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("user")) username = cookie.getValue();
}
}
if(username == null) response.sendRedirect("login.jsp");
%>

		<!-- Header -->
			<header id="header" class="alt">
				<h1><a href="/">olWebDirectory</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="/">Home</a></li>
						<li>
							<a href="" class="icon fa-angle-down">Layouts</a>
							<ul>
								<li><a href="generic.jsp">Generic</a></li>
								<li><a href="contact.jsp">Contact</a></li>
								<li><a href="elements.jsp">Elements</a></li>
								<li>
									<a href="">Submenu</a>
									<ul>
										<li><a href="#">Option One</a></li>
										<li><a href="#">Option Two</a></li>
										<li><a href="#">Option Three</a></li>
										<li><a href="#">Option Four</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="submitsite.jsp"><font color="#e89980">Submit your Site</font></a>
						</li>
						<%if(username != null && username !="") {%>
					    <%="Welcome "%>	<%=username%>
						<li><a href="/logout" class="button">Logout</a></li>
						<%} else { %>
						<li><a href="login.jsp" class="button">Login</a></li>
						<li><a href="signup.jsp" class="button">Sign Up</a></li>
						<%} %>
						
					</ul>
				</nav>
			</header>

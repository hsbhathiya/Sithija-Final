<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%
	UserService userService = UserServiceFactory.getUserService();
%>

<%
	User user = (User) request.getSession().getAttribute("user");
%>

<html>
<head>
<link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>

<body>
	<h1>App Usage Page..!</h1>
	<p>
		Remeber to add a pop-up, in the previous page, <br> Pop up should
		give the option to select the usage name, people to share with (only
		from the company employee list) <br>
		<strong>Then create a doc/pres/sheet using company auth,
			share it with creator auth and add creator/doc URL to our database,
			then load here. :)</strong> <br> Murindu know how to integrate the doc
	</p>

	<p>
		Hello, (You can <a
			href="<%=userService.createLogoutURL("/authentication.jsp")%>">sign
			out</a>.)
	</p>

	<p>
		User Nickname:
		<%=user.getNickname()%>
	</p>

	<p>
		User Email:
		<%=user.getEmail()%>
	</p>

	<p>
		User ID:
		<%=user.getUserId()%>
	</p>

</body>


</html>
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


	<p>
		Hello, (You can <a
			href="<%=userService.createLogoutURL("/authentication.jsp")%>">sign
			out</a>.)
	</p>

	<br>
	<br>
	<p>
		<a href="../admin/adminLogin.jsp">admin panel</a>
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

	<button id="docView" onclick="clickedButt(this.id)">Create Doc</button>
	<button id="presView" onclick="clickedButt(this.id)">Create
		Presentation</button>
	<button id="sheetView" onclick="clickedButt(this.id)">Create
		Sheet</button>

</body>

<script>
	function clickedButt(inID) {
		var url = "https://docs.google.com/a/wso2.com/presentation/d/1P3f1tPrfHeCkx0FR_oK38WtRGte9VmsWnG4SWGewD5A/edit?usp=drive_web";
		window.location = "/user/driveAppView.jsp?url=" + url;
	}
</script>

</html>
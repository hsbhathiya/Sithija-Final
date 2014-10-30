<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<% UserService userService = UserServiceFactory.getUserService(); %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>


<p>Hello! 
    <a href="<%= userService.createLoginURL("/user/index.jsp") %>">Sign in</a>
    to include your name with greetings you post.</p>

<p id="Message"></p>

</body>
</html>
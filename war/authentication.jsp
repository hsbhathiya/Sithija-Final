<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%

    String userName = request.getParameter("userName");
    if (userName == null) {
        userName = "default";// should redirect to login error
    }
    pageContext.setAttribute("userName", userName);
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
        //pageContext.setAttribute("user", user);
        //request.setAttribute("user", user);
        session.setAttribute("user", user);
        response.sendRedirect("/auth");
    }

    
%>


<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>


<p>Hello,  

<% if (user != null) 
	{
        //pageContext.setAttribute("user", user); %>
	(You can
    <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<% } else { %>

<p>Hello! 
    <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
    to include your name with greetings you post.</p>
<% } %>

<p id="Message"></p>

<form action="/authentication.jsp" method="get">
    <div><input type="text" name="userName"/></div>
    <div><input type="submit" value="Login"/></div>
</form>	

</body>
</html>
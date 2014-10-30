
<%
	if ((boolean) request.getSession().getAttribute("isAdmin").equals(false)) {
%>
<%
	response.sendRedirect("adminLogin.jsp");
%>

<%
	} else {
%>
<h1>Admin Home Page</h1>
<button onclick="adminLogout()">Switch to User view</button>
<br>
<h2>Adding new employees</h2>
<p>Functionality to be provided here</p>
<h2>Viewing all drive docs</h2>
<p>Functionality to be provided here</p>


<%
	}
%>

<script>
	function adminLogout(){	
		<% request.getSession().setAttribute("isAdmin", false); %>

		<% response.sendRedirect("/user/index.jsp"); %>
	}
</script>
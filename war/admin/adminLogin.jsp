<h1>Are you the Admin?</h1>
<p>Proove it</p>

<form>
<input type="text" id="adminPass">
<button onclick="checkAdminLog()">LogIn</button>

</form>



<script>
	function checkAdminLog() {

		//alert(document.getElementById("adminPass").value)
		if (document.getElementById("adminPass").value == "pass123") {
			<% request.getSession().setAttribute("isAdmin", true); %>
			//alert("blah");
			<% response.sendRedirect("/admin/index.jsp"); %>
		}
	}
</script>
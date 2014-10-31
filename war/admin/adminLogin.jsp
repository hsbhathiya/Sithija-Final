
<html>
<head>

<script>
	function checkAdminLog() {
		
		if (document.getElementById("adminPass").value == "pass123") {
			//alert('test');
			window.location = "/admin/index.jsp";
		}
	}
</script>
</head>
<body>
	<h1>Are you the Admin?</h1>
	<p>Proove it</p>

	<input type="text" id="adminPass" value="">
	<button onClick="checkAdminLog()">LogIn</button>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Registration</title>
</head>

<body>
	<form method="post" action="/start">
		<center>
			<table border="1" width="30%" cellpadding="5">
				<thead>
					<tr>
						<th colspan="2">Enter Information Here</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Company Name</td>
						<td>
							<input type="text" name="companyName" value="" />
						</td>
					</tr>
					<tr>
						<td>Email</td>
						<td>
							<input type="email" name="email" value="" />
						</td>
					</tr>
					<tr>
						<td>Admin</td>
						<td>
							<input type="text" name="admin" value="" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="Submit" />
						</td>
						<td>
							<input type="reset" value="Reset" />
						</td>
					</tr>
					<tr>
						<td colspan="2">Already registered!! <a href="/admin/adminlogin.jsp">Login Here</a>
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
</body>

</html>
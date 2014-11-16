<%@page import="org.sithija.google.drive.datastore.operations.CompanyApi"%>
<%@page import="org.sithija.google.drive.datastore.operations.ProfileApi"%>
<%@ page import="org.sithija.google.drive.datastore.domain.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%session.setAttribute("company", new Company("WSO1"));
session.setAttribute("profile", new Profile("codeheart1991@gmail.com","Fishy","MyCompany"));%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Document</title>
    </head>
    <body>
        <form method="post" action="/create">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Document Name</td>
                        <td><input type="text" name="docName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Document Type</td>
                        <td><input type="text" name="mimeType" value="application/vnd.google-apps.document" /></td>
                    </tr>
                    <tr>
                        <td>Admin</td>
                        <td><input type="text" name="admin" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>
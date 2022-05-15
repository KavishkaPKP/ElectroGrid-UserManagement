<%@page import="model.UserService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>
<meta charset="ISO-8859-1">
<title>Add User Details</title>
</head>
<body>



<%
//Insert User Data----------------------------------
if (request.getParameter("address") != null)
{
		UserService userObj = new UserService();
String stsMsg = userObj.insertUser(request.getParameter("address"),
request.getParameter("contactno"),
request.getParameter("email"),
request.getParameter("name"));
session.setAttribute("statusMsg", stsMsg);
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management</title>
</head>

<body>

<h1>Add user</h1>


<form method="post" action="AddUser.jsp">

User Full Name: <input name="address" type="text"><br><br>
User Address: <input name="contactno" type="text"><br><br>
Email: <input name="email" type="text"><br><br>
Contact Number: <input name="name" type="text"><br><br>




<input name="btnSubmit" type="submit" value="Submit"><br><br>
</form>

<%
out.print(session.getAttribute("statusMsg"));
%>

<br>





</body>
</html>
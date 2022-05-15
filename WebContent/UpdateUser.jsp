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
<title>Insert title here</title>
</head>
<body>



<%

//Update user data----------------------------------
if (request.getParameter("id") != null)
{
	UserService userObj = new UserService();
String stsMsg = userObj.EditUserDetails(request.getParameter("id"),

request.getParameter("address"),
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
<title>Register User</title>
</head>

<body>

<h1> Update User Details</h1>

<form method="post" action="UpdateUser.jsp">
User ID:
<input name="id" type="text"
class="form-control form-control-sm">

User Address:
<input name="address" type="text"
class="form-control form-control-sm">

<br> contect:
<input name="contactno" type="text"
class="form-control form-control-sm">

<br> Email:
<input name="email" type="text"
class="form-control form-control-sm">

<br> Name:
<input name="name" type="text"
class="form-control form-control-sm">
<br>

<input name="btnsubmit" type="submit" value="update" class="btn btn-primary">
</form>



<%
out.print(session.getAttribute("statusMsg"));
%>
<br>
<%
	UserService userObj = new UserService();
	out.print(userObj.readUserDetails());
%>



</body>
</html>
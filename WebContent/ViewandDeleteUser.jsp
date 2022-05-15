<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="model.UserService" %>
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
<h1>User Details</h1>
<%



//Delete user----------------------------------
if (request.getParameter("id") != null)
{
	UserService userObj = new UserService();
String stsMsg = userObj.deleteUser(request.getParameter("id"));
session.setAttribute("statusMsg", stsMsg);
}



UserService userObj = new UserService();
out.print(userObj.readUserDetails());
%>
</body>
</html>
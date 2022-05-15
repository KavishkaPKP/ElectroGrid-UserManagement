// view and delete

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="model.ComplainService" %>
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
if (request.getParameter("complain_id") != null)
{
	ComplainService userObj = new ComplainService();
String stsMsg = userObj.deleteUser(request.getParameter("complain_id"));
session.setAttribute("statusMsg", stsMsg);
}



ComplainService userObj = new ComplainService();
out.print(userObj.readUserDetails());
%>
</body>
</html>
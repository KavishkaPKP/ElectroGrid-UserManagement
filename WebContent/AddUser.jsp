<%@page import="model.ComplainService" %>
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
if (request.getParameter("name") != null)
{
	ComplainService userObj = new ComplainService();
String stsMsg = userObj.insertUser(request.getParameter("name"),


request.getParameter("address"),
request.getParameter("email"),
request.getParameter("contact_no"),
request.getParameter("account_no"),
request.getParameter("complain"));
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

<h1>Add Your Complain</h1>


<form method="post" action="AddComplain.jsp">

User Full Name: <input name="name" type="text"><br><br>
User Address: <input name="address" type="text"><br><br>
Email: <input name="email" type="text"><br><br>
Contact Number: <input name="contact_no" type="text"><br><br>
Account No: <input name="account_no" type="text"><br><br>
Complain: <input name="complain" type="text"><br><br>



<input name="btnSubmit" type="submit" value="Submit"><br><br>
</form>

<%
out.print(session.getAttribute("statusMsg"));
%>

<br>





</body>
</html>
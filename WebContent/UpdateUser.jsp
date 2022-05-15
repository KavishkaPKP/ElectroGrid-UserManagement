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



<%

//Update user data----------------------------------
if (request.getParameter("complain_id") != null)
{
	ComplainService userObj = new ComplainService();
String stsMsg = userObj.EditUserDetails(request.getParameter("complain_id"),

request.getParameter("name"),
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
<title>Register User</title>
</head>

<body>

<h1> Update User Details</h1>

<form method="post" action="UpdateComplain.jsp">
User ID:
<input name="complain_id" type="text"
class="form-control form-control-sm">
User Full Name:
<input name="name" type="text"
class="form-control form-control-sm">
<br> User Address:
<input name="address" type="text"
class="form-control form-control-sm">
<br> Email:
<input name="email" type="text"
class="form-control form-control-sm">
<br> Contact Number:
<input name="contact_no" type="text"
class="form-control form-control-sm">
<br> contact_no:
<input name="account_no" type="text"
class="form-control form-control-sm">
<br> account_no:
<input name="complain" type="text"
class="form-control form-control-sm">
<br>
<input name="btnsubmit" type="submit" value="update"
class="btn btn-primary">
</form>



<%
out.print(session.getAttribute("statusMsg"));
%>
<br>
<%
ComplainService userObj = new ComplainService();
out.print(userObj.readUserDetails());
%>



</body>
</html><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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



<%

//Update user data----------------------------------
if (request.getParameter("complain_id") != null)
{
	ComplainService userObj = new ComplainService();
String stsMsg = userObj.EditUserDetails(request.getParameter("complain_id"),

request.getParameter("name"),
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
<title>Register User</title>
</head>

<body>

<h1> Update User Details</h1>

<form method="post" action="UpdateComplain.jsp">
User ID:
<input name="complain_id" type="text"
class="form-control form-control-sm">
User Full Name:
<input name="name" type="text"
class="form-control form-control-sm">
<br> User Address:
<input name="address" type="text"
class="form-control form-control-sm">
<br> Email:
<input name="email" type="text"
class="form-control form-control-sm">
<br> Contact Number:
<input name="contact_no" type="text"
class="form-control form-control-sm">
<br> contact_no:
<input name="account_no" type="text"
class="form-control form-control-sm">
<br> account_no:
<input name="complain" type="text"
class="form-control form-control-sm">
<br>
<input name="btnsubmit" type="submit" value="update"
class="btn btn-primary">
</form>



<%
out.print(session.getAttribute("statusMsg"));
%>
<br>
<%
ComplainService userObj = new ComplainService();
out.print(userObj.readUserDetails());
%>



</body>
</html>
<%@page import="model.UserService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<meta charset="ISO-8859-1">
<title>Add User Details</title>

<nav class="navbar navbar-expand-md navbar-dark" style="background-color:#4D4D4D">
<ul class="navbar-nav">
<li><a href="#" class="nav-link">ElecroGrid Online Platform</a></li>
</ul>
</nav>
<br>
<br>
<br>
<br>

</head>
<body style="background-color: #E7E8E3;">
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

<div class="container">
<div class="row">

<div class="container col-md-5">
<div class="card">
<div class="card-body">

<h1><center>User Register Form</center></h1>
<br>


<form method="post" action="AddUser.jsp">

<input placeholder="Full Name" class="form-control form-control-sm" required name="name" type="text"><br>
<input placeholder="Address" name="Address" class="form-control form-control-sm" required type="text"><br>
<input  placeholder="Contact Number" name="contactno" class="form-control form-control-sm" required type="text"><br>
<input placeholder="Email" name="email" class="form-control form-control-sm" required type="text"><br><br>


<input name="btnSubmit" class="btn btn-info active" type="submit" value="Register"><br><br>
</form>


<%
out.print(session.getAttribute("statusMsg"));
%>







</body>
</div>
</div>
</div>
</div>
</div>
<br>

<br>
<br>
<!-- Site footer -->
<footer class="site-footer">
<div class="container">
<div class="row">
<div class="col-sm-12 col-md-6">
<h6>About</h6>
<p class="text-justify"> <i> Kavishka P.K.P </i> This project is based on a company named <b>ElectroGrid (EG)</b> who maintains the power grid of the country. They have a system to monitor the power consumption of the users, generate the monthly bills and automatically send to the users, and accept the online payments from the users..</p>
</div>
</html>
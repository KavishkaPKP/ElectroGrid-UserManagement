package model;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;



public class UserService {
//A common method to connect to the DB
private Connection connect()
{
Connection con = null;
try
{
Class.forName("com.mysql.jdbc.Driver");



//Provide the correct details: DBServer/DBName, username, password
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "pasi11@PN");
}
catch (Exception e)
{e.printStackTrace();}
return con;
}

public String insertusers_tbl(String id, String address, String contactno, String email, String name)
{
String output = "";
try
{
Connection con = connect();
if (con == null)
{return "Error while connecting to the database for inserting."; }

// create a prepared statement
String query = " insert into users_tbl(`id`,`address`,`contactno`,`email`,`name`)"
+ " values (?, ?, ?, ?, ?, ?, ?)";
PreparedStatement preparedStmt = con.prepareStatement(query);

// binding values
preparedStmt.setInt(1, 0);
preparedStmt.setString(2, address);
preparedStmt.setString(3, contactno);
preparedStmt.setString(4, email);
preparedStmt.setString(5, name);

// execute the statement

preparedStmt.execute();
con.close();
output = "User Added successfully";
}
catch (Exception e)
{
output = "Error while Adding User.";
System.err.println(e.getMessage());
}
return output;
}

public String readUserDetails()

{
String output = "";
try
{
Connection con = connect();
if (con == null)
{
return "Error while connecting to the database for reading.";
}

// Prepare the html table to be displayed
output = "<table border='1'><tr><th>address</th>"
+"<th>contactno</th><th>email</th>"
+ "<th>name</th>";

String query = "select * from users_tbl";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(query);

// iterate through the rows in the result set
while (rs.next())
{
	String id = rs.getString("id");
String name = rs.getString("name");
String address = rs.getString("address");
String  contactno= rs.getString("contactno");
String email = rs.getString("email");

;

// Add a row into the html table
output += "<tr><td>" + name + "</td>";
output += "<td>" + address + "</td>";
output += "<td>" + contactno + "</td>";
output += "<td>" + email + "</td>";


// buttons

output += "<td><form method='post' action='updateUser.jsp'>"

+ "<input name='btnUpdate' type='submit' value='Update User' class='btn btn-secondary'>"

+ "<input name='id' type='hidden' value='" + id + "'>" + "</form></td>"

+ "<td><form method='post' action='ViewandDeleteUser.jsp'>"

+ "<input name='btnRemove' type='submit' value='Delete User' class='btn btn-danger'>"

+"<input name='id' type='hidden' value='" + id + "'>"+ "</form></td></tr>";


}
con.close();

// Complete the html table
output += "</table>";
}
catch (Exception e)
{
output = "Error while reading the user details"
+ ".";
System.err.println(e.getMessage());
}
return output;
}

public String EditUserDetails(String id, String address, String contactno, String email, String name)
{
String output = "";
try
{
Connection con = connect();
if (con == null)
{
return "Error while connecting to the database for updating";
}

// create a prepared statement
String query = "UPDATE users_tbl SET String address, String contactno, String email, String name WHERE id=?";

PreparedStatement preparedStmt = con.prepareStatement(query);
// binding values
preparedStmt.setString(1, address);
preparedStmt.setString(2, name);
preparedStmt.setString(3, contactno);
preparedStmt.setString(4, email);
preparedStmt.setInt(7, Integer.parseInt(id));
// execute the statement
preparedStmt.execute();
con.close();
output = "Updated successfully";
}
catch (Exception e)
{
output = "Error while updating the user";
System.err.println(e.getMessage());
}
return output;
}

public String deleteusers_tbl(String id)
{
String output = "";
try
{
Connection con = connect();
if (con == null)
{
return "Error while connecting to the database for deleting.";
}



// create a prepared statement
String query = "delete from users_tbl where id=?";
PreparedStatement preparedStmt = con.prepareStatement(query);



// binding values
preparedStmt.setInt(1, Integer.parseInt(id));



// execute the statement
preparedStmt.execute();
con.close();
output = "User Remove successfully";
}
catch (Exception e)
{
output = e.toString();
//System.err.println(e.getMessage());
}
return output;
}
public String fetchUser(String id)

{
String output = "";
try
{
Connection con = connect();
if (con == null)
{
return "Error while connecting to the database for reading";
}
// Prepare the html table to be displayed

output = "<table border='1'><tr><th>address</th>"
+"<th>contactno</th><th>email</th>"
+ "<th>name</th>";

String query = "select * from users_tbl where id='"+id+"'";

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(query);
// iterate through the rows in the result set
while (rs.next())
{
	
	String id1 = Integer.toString(rs.getInt("id"));
	String name = rs.getString("name");
	String address = rs.getString("address");
	String contactno= rs.getString("contactno");
	String email = rs.getString("email");
	
	
// Add a row into the html table

output += "<tr><td>" + name + "</td>";
output += "<td>" + address + "</td>";
output += "<td>" + contactno + "</td>";
output += "<td>" + email + "</td>";

// buttons
output += "<input name='itemID' type='hidden' "
+ " value='" + id + "'>"
+ "</form></td></tr>";
}
con.close();
// Complete the html table
output += "</table>";

}
catch (Exception e)
{
// output = "Error while reading the Payment details";
output=e.toString();
System.err.println(e.getMessage());
}
return output;
}


}
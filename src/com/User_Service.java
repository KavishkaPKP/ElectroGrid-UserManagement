package com;
import model.UserService;


//For REST Service
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;


//For JSON
import com.google.gson.*;


//For XML
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;



@Path("/users_tbl")



public class User_Service {


UserService userObj = new UserService();
@POST
@Path("/")
@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
@Produces(MediaType.TEXT_PLAIN)
// insert payment details.

public String insertusers_tbl(@FormParam("name") String name,
@FormParam("address") String address,
@FormParam("contactno") String contactno,
@FormParam("email") String email
) {
String output = userObj.insertusers_tbl(address, contactno, email, name);
return output;
}



@GET
@Path("/")
@Produces(MediaType.TEXT_HTML)
public String readUserDetails() //view all payment details
{
return userObj.readUserDetails();
}

@PUT
@Path("/")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.TEXT_PLAIN)
public String UpdateUser(String userData) //update payment
{
//Convert the input string to a JSON object
JsonObject userObject = new JsonParser().parse(userData).getAsJsonObject();
//Read the values from the JSON object
String id = userObject.get("id").getAsString();
String name = userObject.get("name").getAsString();
String address = userObject.get("address").getAsString();
String contactno = userObject.get("contactno").getAsString();
String email = userObject.get("email").getAsString();


String output = userObj.EditUserDetails(id, address, contactno, email, name);
return output;
}

@DELETE
@Path("/")
@Consumes(MediaType.APPLICATION_XML)
@Produces(MediaType.TEXT_PLAIN)
public String deleteUser(String userData)//delete users
{
//Convert the input string to an XML document
Document doc = Jsoup.parse(userData, "", Parser.xmlParser());



//Read the value from the element <userId>
String userID = doc.select("id").text();
String output = userObj.deleteusers_tbl(userID);
return output;
}
@GET
@Path("/getUserbyID/{userId}")//view a specific payment
@Produces(MediaType.TEXT_HTML)
public String UserProfileDetails(@PathParam("id") String userId) {



return userObj.fetchUser(userId);
}

}
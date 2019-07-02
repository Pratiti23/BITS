<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
    <%@page import ="java.io.IOException" %>
 <%@page import ="javax.servlet.ServletException" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %> 
<%@page  import="javax.servlet.http.HttpServletResponse" %>
<%@page import=" java.sql.*"  %>
<%@page import= "dao.Dao" %>
<%@page import= "model.Model" %>
<%@page import ="oracle.jdbc.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
 <link rel="stylesheet" href="css/style1.css">
       <link rel="stylesheet" href="css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User</title>
<script type="text/javascript">

function button1()
{
	var parentDiv = document.getElementById("button");
	parentDiv.setAttribute("style","visibility: hidden"); 
	
	}

 function CheckEqual()
 {
var un=document.getElementsByName("un")[0].value.trim();
var email=document.getElementsByName("email")[0].value.trim();
var n = np.localeCompare(cp);

if(un=="")
{
alert("Enter valid username");
document.getElementsByName("np")[0].value="";
}

else if(email=="")
{
alert("Enter valid Email ID");
document.getElementsByName("op")[0].value="";
}
else
{

}


 }
      </script>
</head>
<body>
<div class="topnav">
 <span>
 <div>
 <img src="css/evosys3.JPG"  hspace="0" alt="Logo" height="42" width="130" align="top">Hello<%if(session.getAttribute("name")!=null && session.getAttribute("type").equals("admin"))
{
String name=(String)session.getAttribute("name");%>
${name}
</div>
</span>
 <a href="logout.jsp">Log out</a>
 <a href="changePassword.jsp">Change Password</a>
<%if(session.getAttribute("type").equals("admin"))
{%>
 <a href="index1.jsp">Edit</a>
<a href="admin.jsp">Create New Project</a>
<%} %>
 <a href="Report_Table.jsp">Search Report</a>
<a href="master.jsp">Create Report</a>
	
</div>

<form name="adduser"  action="AddUserServlet" method="post" onsubmit="button1()" >
<center>
<br>
<span id="h1">Add User</span>
</center>
<br>
<center>
<table>
<tr>
    <td>Select Role</td>
    <td><select required name="type">
<option value="">Select Role</option>
  <option value="admin">Admin</option>
  <option value="Technical Consultant">Technical Consultant</option>
  <option value="eu">End User</option>
</select>
</td>
  </tr> 
  <tr>
    <td>Email</td>
    <td><input type="email" name="email"  id="input" required /></td>
  </tr>
  <tr>
    <td>Username</td>
    <td><input type="text" name="un"  id="input" required /></td>
  </tr>
  
  </table>
  <input type=submit value="SUBMIT" onclick="CheckEqual()"  name ="" id="button"/>
  </center>
  </form>


<%}

else{ %>
<script>
 alert("Login to access this page");
	window.location.href="index.jsp";
   </script>
<%} %>

</div>
<br>
<br>
<br><br><br><br><br>
<br>
<br>
<br><br><br><br><br>
<br>
</body>
</html>
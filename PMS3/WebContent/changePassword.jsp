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
<title>Change Password</title>
<script type="text/javascript">
<%
String pwd="pwd";
if((String)session.getAttribute("email")!=null)
{
String email=(String)session.getAttribute("email");
String sql="select user_password from XXEVO_PM_USER_TBL where user_id='"+email+"'";
Model m =new Model();

ResultSet rs = Dao.validate(sql,m);

while(rs.next())
{
	 pwd=rs.getString(1);
}
}
%>
function button1()
{
	var parentDiv = document.getElementById("button");
	parentDiv.setAttribute("style","visibility: hidden"); 
	
	}
 function CheckEqual()
 {
var np=document.getElementsByName("np")[0].value.trim();
var cp=document.getElementsByName("cp")[0].value.trim();
var op=document.getElementsByName("op")[0].value.trim();
var n = np.localeCompare(cp);

if(np=="")
{
alert("Enter valid new password");
document.getElementsByName("np")[0].value="";
}

else if(op=="")
{
alert("Enter valid old password");
document.getElementsByName("op")[0].value="";
}
else
{

}
if(n!==0)
	{
	alert("New Password and Confirm Password don't match");
	document.getElementsByName("cp")[0].value="";
	document.getElementsByName("np")[0].value="";
	}

	if("<%=pwd%>"!==op)
		{
		console.log('Old password');
		alert("Old Password is incorrect");
		document.getElementsByName("op")[0].value="";
		}
	
	

 }
      </script>
</head>
<body>
<div class="topnav">
 <span>
 <div>
 <img src="css/evosys3.JPG"  hspace="0" alt="Logo" height="42" width="130" align="top">Hello<%if(session.getAttribute("name")!=null && (session.getAttribute("type").equals("Technical Consultant")||session.getAttribute("type").equals("admin")))
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

<form name="chgPwd"  action="ChangePasswordServlet" method="post" onsubmit="button1()" >
<center>
<br>
<span id="h1">Change Password</span>
</center>
<br>
<center>
<table> 
  <tr>
    <td>Old Password</td>
    <td><input type="password" name="op"  id="input" required /></td>
  </tr>
  <tr>
    <td>New Password</td>
    <td><input type="password" name="np"  id="input"  title="Password min 8 characters. At least one UPPERCASE and one lowercase letter"  pattern="(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" required /></td>
  </tr>
  <tr>
    <td>Confirm Password</td>
    <td><input type="password" name="cp"  id="input"  title="Password min 8 characters. At least one UPPERCASE and one lowercase letter" pattern="(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" required /></td>
  </tr>
  </table>
  <input type=submit value="SUBMIT" onclick="CheckEqual()" id="button" name="submit"/>
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
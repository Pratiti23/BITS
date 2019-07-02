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
<%@page import= "oracle.jdbc.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" content="width=device-width initial-scale=1.0">
<title>Project Creation</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script> 
      <link rel="stylesheet" href="css/style1.css">
       <link rel="stylesheet" href="css/header.css">
      <script src="js/index.js"></script>
     <script type="text/javascript">
     
     function button1()
     {
     	var parentDiv = document.getElementById("button");
     	parentDiv.setAttribute("style","visibility: hidden"); 
     	
     }
 function noSpace()
 {
var pn=document.getElementsByName("pn")[0].value.trim();
var cn=document.getElementsByName("cn")[0].value.trim();
var proj_m=document.getElementsByName("proj_m")[0].value.trim();
var prog_m=document.getElementsByName("prog_m")[0].value.trim();
if(cn=="")
{
	alert("Enter valid input for Client Name");
	}	
 
 else if(pn=="")
	 {
	 alert("Enter valid input for Project Name");
	 }

 else if(prog_m==""){
	 alert("Enter valid input for Program Manager");
      }
 else if(proj_m=="")
 {
 alert("Enter valid input for Project Manager");
 }
 else
 {

 }

 }
      </script>
</head>
<body>
<%response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see th
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		 ResultSet rs=null;
		%>
<div class="topnav">
<span>
<div>
<img src="css/evosys3.JPG" alt="Evosys Logo" height="42" width="130" align="top">Hello<%
String name=(String)session.getAttribute("name");
if(name!=null && session.getAttribute("type").equals("admin"))
{%>
${name}
</div>
</span>
<a href="logout.jsp">Log out</a>
<a href="changePassword.jsp">Change Password</a>
 <a href="index1.jsp">Edit</a>
<a href="admin.jsp">Create New Project</a>
<a href="Report_Table.jsp">Search Report</a>
<a href="master.jsp">Create Report</a>
</div>
<form name="admin" action="InsertServlet" method="post" onsubmit="button1()" >
<center>
<span id="h1">Project Creation</span>
</center>
<br>
<center>
<table> 
  <tr>
    <td>Client Name</td>
    <td><input type="text" name="cn" placeholder="Client Name" id="input" required /></td>
    <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td>Domain</td>
 <td><select name="domain">
<option value="">Select</option>
 <%
   rs=Dao.lov(2);
   while(rs.next())
   {%>
  
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
    
   <%}%>
</select></td>                
     
  </tr>
   <tr>
   <td>Project Name</td>
    <td><input type="text" name="pn" placeholder ="Project Name" id="input" required /></td>
   
   
    <td></td>
     <td></td>
     <td></td>
      <td></td>
      <td>Region</td>
   <td><select name="region" required>
    <option value="" >Select</option>
   <%
   rs=Dao.lov(1);
   while(rs.next())
   {%>
  
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
    
   <%}%>
    </select>
    </td>  
    
  </tr>
   <tr>
    <td>Project Manager</td>
    <td><input type="text" name="proj_m" placeholder="Project Manager" id="input"  required /></td>
    
    <td></td>
    <td></td>
     <td></td>
      <td></td>
      <td>Project Status</td>
    <td><select name="ps" required>
   <option value="">Select</option>
    <%
   rs=Dao.lov(3);
   while(rs.next())
   {%>
  
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
    
   <%}%>
  
</select>
    </td>
     
  </tr>
   <tr>
   <td>Program Manager</td>
    <td><input type="text" name="prog_m" placeholder="Program Manager" id="input"  required /></td>
    <td></td>
    <td></td>
     <td></td>
      <td></td>
   <td>Project Track</td>
    <td><select name="ptrack" required>
     <option value="">Select</option>
      <%
   rs=Dao.lov(4);
   while(rs.next())
   {%>
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
   <%}%>
</select>
    </td> 
  </tr>
   <tr>
   <td>Outbound Report<br>Scope</td>
    <td><input type="number" name="ors" placeholder="Outbound Report Scope" id="input"  min=1  /></td>
    
    <td></td>
     <td></td>
      <td></td>
     <td></td>
      <td>UAT Date</td>
    <td> <input type="date" name="uat" placeholder="UAT Date" id="input" /></td>
     
  </tr>
   <tr>
   <td>BIP Report Scope</td>
    <td><input type="number" name="brs" placeholder="BIP Report Scope"  id="input" min=1  /></td>
   <td></td>
     <td></td>
     <td></td>
      <td></td>
   <td>CRP Date</td>
    <td><input type="date" name="crp" placeholder="CRP Date" id="input"  /></td>
    
    <td></td>
     <td></td>
     <td></td>
      <td></td>
     
    
  </tr>
   <tr>
   <td>Support Period</td>
    <td><input type="number" name="sp" placeholder="Support Period"  id="input" min=1 required /></td>
    <td></td>
     <td></td>
     <td></td>
      <td></td>
    <td>Go Live Date</td>
    <td><input type="date" name="gld" placeholder="Go Live Date" id="input"/></td>  
  </tr>  
  <tr>
    <td>Project Comments</td>
    <td><input type="text" name="pc" placeholder="Project Comments"  id="input"  /></td>  
    
    <td></td>
     <td></td>
     <td></td>
      <td></td>
      <td></td>
    
    <td><input type=submit value="SUBMIT" onclick="noSpace()" id="button" name="submit"/></td>  
  </tr>  
</table>
</center>
</form>

 <%}else{%>
 <script>
 alert("Login to access this page");
	window.location.href="index.jsp";
   </script>
   <%} %>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<br>
<br>

</body>
</html>
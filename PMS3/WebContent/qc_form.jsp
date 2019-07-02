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
<%@page import= "oracle.jdbc.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>QC form</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/qc_form.css">
<!--===============================================================================================-->
 <script type="text/javascript">
function button1()
     {
     	var parentDiv = document.getElementById("button");
     	parentDiv.setAttribute("style","visibility: hidden"); 
     	
     }
     </script>

</head>
<body>
<div class="topnav">
 <span>
 <div>
 <img src="css/evosys3.JPG"  hspace="0" alt="Logo" height="42" width="130" align="top">Hello<%if(session.getAttribute("name")!=null && (session.getAttribute("type").equals("Technical Consultant")||session.getAttribute("type").equals("admin")))
{
String email=(String)session.getAttribute("name");%>
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
<br>
<center id="h1" style="font-size:25px;font-weight:bold;">QC Form</center>
<br>
<form action="InsertQCServlet" method=post onsubmit="button1()" >
<table>
<%

String task=request.getParameter("task");
if(task!=null)
{
	String sql2="select seq_no,(select list from XXEVO_QC_MASTER_TBL where XXEVO_QC_MASTER_TBL.qc_id=XXEVO_PM_QC_DTL_TBL.seq_no), result,comments from XXEVO_PM_QC_DTL_TBL where task_id="+task+"order by seq_no";
	Model m = new Model();
	ResultSet rs2 = Dao.validate(sql2,m);
%>
<tr>
<input type="hidden" value="<%=task%>" name="task" >
<td>Sr No.</td><td><center>Review Topics</center></td><td>Result</td><td>Description</td>
</tr>
<tr>
<td></td><td></td><td></td><td></td>
</tr>
<tr>
<td></td><td></td><td></td><td></td>
</tr>
<%
String sql="select qc_id,list from XXEVO_QC_MASTER_TBL order by qc_id";
ResultSet rs = Dao.validate(sql,m);
int i=0;
if(rs2.next())
{
	 rs2 = Dao.validate(sql2,m);
	 while(rs2.next())
	 {
	 %>
	 <tr>
	 <td><%=++i%></td>
	 <td><%=rs2.getString(2)%></td> 
	 <td><select name="<%=rs2.getString(1)+"a"%>"  required >
	 <%if(rs2.getString(3).equals("Y")){%>
	 
	 <option value="Y">Y</option>
	 <option value="N">N</option>
	 <option value="NA">NA</option>
	 <%} else if(rs2.getString(3).equals("N")){%>
	 <option value="N">N</option>
	 <option value="Y">Y</option>
	 <option value="NA">NA</option>
	 <%}else{ %>
	  <option value="NA">NA</option>
	 <option value="N">N</option>
	 <option value="Y">Y</option>
	 <%} %>
	 </select></td>
	 <td><input type="text" name="<%=rs2.getString(1)+"b"%>" value="<%=rs2.getString(4)%>" id="input"></td>
	 </tr>
	 <%}
	}else{%>
<%while(rs.next())
{
%>
<tr>
<td><%=++i%></td>
<td><%=rs.getString(2)%></td> 
<td><select name="<%=rs.getString(1)+"a"%>"  required ><option value="Y">Y</option><option value="N">N</option><option value="NA">NA</option></select></td>
<td><input type="text" name="<%=rs.getString(1)+"b"%>" id="input"></td>
</tr>
<%}}%>
</table>
<input type="hidden" value="<%=i%>" name="i" >
<center><input type=submit value="SUBMIT" id="button" name="submit"/></center>
</form>
<%}else
{%>	
<script>
 alert("Please select Task id");
window.location.href="Report_Table.jsp";
   </script>
<% }
}else{%>
<script>
 alert("Login to access this page");
	window.location.href="index.jsp";
   </script>
<%} %>
</body>
</html>
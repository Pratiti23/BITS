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

<script type="text/javascript">

function search()
{  
	var xhttp = new XMLHttpRequest();
	var pn= document.getElementsByName("pn")[0].value;
	var rn= document.getElementsByName("rn")[0].value;
	var tn= document.getElementsByName("tn")[0].value;
	console.log("pn");
	console.log(pn);
	console.log("rn");
	console.log(rn);
	console.log("tn");
	console.log(tn);
	if(pn==='')
		{
	pn='x';
		}
	if(rn==='')
	{
     rn='x';
	}
	if(tn==='')
	{
     tn='x';
	}
	var string_value=pn+","+rn+","+tn;
	//pn,rn,tn
	console.log(string_value);
	
	xhttp.onreadystatechange=function ()
	{
	if(xhttp.readyState===4 && xhttp.status===200)
		{
		document.getElementById("temp").innerHTML=xhttp.responseText;
		}
	};
	xhttp.open("POST","SearchEST?valajax="+string_value,true);
	xhttp.send();
	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report Table</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="css/style1.css">

</head>
<body>

<div class="topnav">
 
<a href="logout.jsp">Log out</a>
<a href="changePassword.jsp">Change Password</a>


</div>
<br>
<center><span style="color:white; font-weight: bold;">Project Name</span>&nbsp;<input type="text" name=pn placeholder="Text" id="input" required style="width:230px; height:40px;" />&nbsp;
<span style="color:white; font-weight: bold;">Task Number</span>&nbsp;<input type="text" name=tn   placeholder="Text" id="input" required style="width:230px; height:40px;" />&nbsp;
<span style="color:white; font-weight: bold;">Report Name</span>&nbsp;<input type="text" name=rn  placeholder="Text" id="input" required style="width:230px; height:40px;" />
<span style="padding:10px 10px"><input type=button value="SEARCH" onclick="search()"  id="button"/></span>
</center>
<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110" style="overflow:scroll;height:570px;">
					<table data-vertable="ver1">
					<form>
					<thead>
							<tr class="row100 head" >
								
								<th class="column100 column1" data-column="column1">Task Number</th>
								<th class="column100 column1" data-column="column1"><center style="width:400px;">Report Name</center></th>
								<th class="column100 column6" data-column="column6"><center style="width:400px;">Project Name</center></th>
								<th class="column100 column6" data-column="column6"><center style="width:200px;">Expected Completion Date</center></th>
								<th class="column100 column4" data-column="column4"> Region</th>
							    <th class="column100 column4" data-column="column4"><center style="width:250px;">Status</center></th>
								<th class="column100 column8" data-column="column8">Module</th>
								<th class="column100 column2" data-column="column2"><br>Report<br>Category</th>
								<th class="column100 column7" data-column="column7"><center style="width:400px;">Project From</center></th>
								<th class="column100 column7" data-column="column7"><br>Integration<br>Types</th>
								<th class="column100 column4" data-column="column4"><center style="width:350px;">Comments</center></th>
								<th class="column100 column5" data-column="column5">Functional Owner</th>
				                <th class="column100 column3" data-column="column3"><br>Technical<br>Owner</th>
			                	<th class="column100 column5" data-column="column5"><center style="width:600px;">Report Path</center></th>				
								<th class="column100 column3" data-column="column3"><br>Recommended For Std</th>
								<th class="column100 column3" data-column="column3"><br><center style="width:350px;">Std comments</center></th>
								<th class="column100 column3" data-column="column3"><br><center style="width:300px;">Development<br>Category</center></th>
								<th class="column100 column6" data-column="column6"><center style="width:300px;">Application</th></center>
								<th class="column100 column5" data-column="column5">Client Sign&nbsp;Off</th>
								<th class="column100 column5" data-column="column5"><center style="width:130px;">Requirement Document</center></th>
								<th class="column100 column5" data-column="column5"><center style="width:130px;">Sample Output</center></th>
								<th class="column100 column5" data-column="column5"><center style="width:130px;">QA Report</center></th>
								<th class="column100 column5" data-column="column5"><center style="width:130px;">Data Model</center></th>
								<th class="column100 column5" data-column="column5"><center style="width:130px;">New Development Report</center></th>
	
								
							</tr>
							</thead>
								<tbody id="temp">
								<%
								Connection con=Dao.connect();
								 CallableStatement stmt =con.prepareCall("BEGIN est_table(?); END; ");
								   stmt.registerOutParameter(1, OracleTypes.CURSOR);
								   stmt.execute();
								   ResultSet rs = ((OracleCallableStatement)stmt).getCursor(1);
								   
								while(rs.next())
   { %>
							
								<% if(rs.getString(1)!=null){%>
								<td class="column100 column1" data-column="column1" style="font-weight: normal;"><%=rs.getString(1)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"> </td>
								<%} %>
								<% if(rs.getString(3)!=null){%>
								<td class="column100 column3" data-column="column3" style="font-weight: normal;"><%=rs.getString(3)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"> </td>
								<%} %>
								<% if(rs.getString(2)!=null){%>
								<td class="column100 column2" data-column="column2" style="font-weight: normal;"><%=rs.getString(2)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(4)!=null){%>
								<td class="column100 column4" data-column="column4" style="font-weight: normal;"><%=rs.getString(4)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(5)!=null){%>
								<td class="column100 column5" data-column="column5" style="font-weight: normal;"><%=rs.getString(5)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(6)!=null){%>
								<td class="column100 column6" data-column="column6" style="font-weight: normal;"><%=rs.getString(6)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(7)!=null){%>
								<td class="column100 column7" data-column="column7" style="font-weight: normal;"><%=rs.getString(7)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(8)!=null){%>
								<td class="column100 column8" data-column="column8"style="font-weight: normal;"><%=rs.getString(8)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(9)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(9)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								
								<% if(rs.getString(10)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(10)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								
								<% if(rs.getString(11)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(11)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(12)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(12)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(13)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(13)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(14)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"> <%=rs.getString(14)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(15)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(15)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(16)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(16)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(17)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(17)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(18)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(18)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs.getString(19)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs.getString(19)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(!rs.getString(21).trim().equals("")){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><a href="GetAttachmentServlet?msg=<%=rs.getString(21)%>"> Download File </a></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(!rs.getString(22).trim().equals("")){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><a href="GetAttachmentServlet?msg=<%=rs.getString(22)%>"> Download File </a></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								
								<% if(!rs.getString(23).trim().equals("")){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><a href="GetAttachmentServlet?msg=<%=rs.getString(23)%>"> Download File </a></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(!rs.getString(24).trim().equals("")){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><a href="GetAttachmentServlet?msg=<%=rs.getString(24)%>"> Download File </a></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(!rs.getString(25).trim().equals("")){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><a href="GetAttachmentServlet?msg=<%=rs.getString(25)%>"> Download File </a></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								
								
								
								
								
						
							</tr>

<%} %>								
</tbody>
		</form>			
	</table>
</div>


</body>
</html>
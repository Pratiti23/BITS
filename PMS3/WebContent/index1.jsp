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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of already existing</title>
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
	<link rel="stylesheet" type="text/css" href="css/main1.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
<!--===============================================================================================-->

</head>
<body>
<%response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see th
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		%>
<div class="topnav">
 <span>Hello<%if(session.getAttribute("name")!=null && session.getAttribute("type").equals("admin"))
{
%>
${name}
</span>
 <a href="logout.jsp">Logout</a>
 <a href="changePassword.jsp">Change Password</a>
 <a href="index1.jsp">Edit</a>
<a href="admin.jsp">Create New Project</a>
<a href="Report_Table.jsp">Search Report</a>
<a href="master.jsp">Create Report</a>

</div>
	
<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table100 ver1 m-b-110" style="overflow:scroll;height:570px;" >
					<table data-vertable="ver1">
					<form action="tableServlet">
						<thead>
							<tr class="row100 head">
							<th class="column100 column1" data-column="column6"> </th>
								<th class="column100 column1" data-column="column1"><br><center style="width:150px">Client Name</center></th>
								<th class="column100 column2" data-column="column2"><br><center style="width:350px">Project Name</center></th>
								<th class="column100 column3" data-column="column3"><br><center style="width:150px">Project Manager</center></th>
								<th class="column100 column4" data-column="column4"><br><center style="width:150px">Program Manager</center></th>
								<th class="column100 column5" data-column="column5"><br>Project Track</th>
								
								<th class="column100 column6" data-column="column6"><br>Outbound Report Scope</th>
								<th class="column100 column7" data-column="column7"><center style="width:150px">UAT Date</center></th>
								<th class="column100 column8" data-column="column8"><br>Support Period</th>
								<th class="column100 column1" data-column="column1">Region</th>
								<th class="column100 column9" data-column="column9"><center style="width:250px">Project Status</center></th>
								<th class="column100 column4" data-column="column4"><br>BIP Report Scope</th>					
								<th class="column100 column5" data-column="column5"><center style="width:150px">CRP Date</center></th>
								<th class="column100 column5" data-column="column5"><center style="width:150px">Go Live Date</center></th>
								<th class="column100 column6" data-column="column6"><center style="width:200px">Domain</center></th>
								<th class="column100 column5" data-column="column5"><br><center style="width:150px">Project Comments</center></th>
				
							</tr>
							</thead>
								<tbody>
								<%
								Connection con=Dao.connect();
								 CallableStatement stmt =con.prepareCall("BEGIN DisplayProject(?); END; ");
								   stmt.registerOutParameter(1, OracleTypes.CURSOR);
								   stmt.execute();
								   ResultSet rs = ((OracleCallableStatement)stmt).getCursor(1);
								   
								while(rs.next())
   { %>
							<tr class="row100">
							    <td class="column100 column9" data-column="column9"><a href="projectupdate.jsp?msg=<%=rs.getString("project_id")%>">Edit</a></td>
							   <%if(rs.getString("client_name")!=null){ %>
								<td class="column100 column1" data-column="column1"><%=rs.getString("client_name")%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString("project_name")!=null){ %>
								<td class="column100 column2" data-column="column2"><%=rs.getString("project_name")%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString("project_manager")!=null){ %>
								<td class="column100 column3" data-column="column3"><%=rs.getString("project_manager")%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString("program_manager")!=null){ %>
								<td class="column100 column3" data-column="column3"><%=rs.getString("program_manager")%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString(13)!=null){ %>
								<td class="column100 column4" data-column="column4"><%=rs.getString(13)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
									
								<%if(rs.getString("outbound_report_scope")!=null){ %>
								<td class="column100 column6" data-column="column6"><%=rs.getString("outbound_report_scope")%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString(10)!=null){ %>
								<td class="column100 column7" data-column="column7"><%=rs.getString(10)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString("support_period")!=null){ %>
								<td class="column100 column8" data-column="column8"><%=rs.getString("support_period")%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString(15)!=null){ %>
								<td class="column100 column9" data-column="column9">&nbsp;&nbsp;&nbsp;<%=rs.getString(15)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString(14)!=null){ %>
								<td class="column100 column9" data-column="column9"><%=rs.getString(14)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString("bip_report_scope")!=null){ %>
								<td class="column100 column9" data-column="column9"><%=rs.getString("bip_report_scope")%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString(9)!=null){ %>
								<td class="column100 column9" data-column="column9"><%=rs.getString(9)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString(11)!=null){ %>
								<td class="column100 column9" data-column="column9"><%=rs.getString(11)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString(16)!=null){ %>
								<td class="column100 column9" data-column="column9"><%=rs.getString(16)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
								<%if(rs.getString("project_comments")!=null){ %>
								<td class="column100 column5" data-column="column5"><%=rs.getString("project_comments")%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%}%>
						
							</tr>
							<%} %>		
</tbody>
		</form>			
	</table>
</div>
	
<%}else {%>
	<script>
alert("Please login to access this page");
window.location.href="index.jsp";
</script><%}%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
<%
String tn=request.getParameter("taskno");
if(!tn.equals(null))
{%>
	var st="Your Task number is "+"<%=tn%>";
	console.log(st);
	alert(st);
	window.location.href="Report_Table.jsp";
	
	
<% }
else{%>
alert("Data was not inserted");
window.location.href="master.jsp";
<%}%>
	

	
	</script>
	
</body>
</html>
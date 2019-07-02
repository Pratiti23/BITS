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
String ms=request.getParameter("msg");
if(ms!=null)
{
	if(ms.equals("userinserted"))
		{%>
			alert("User Details inserted successfully");
			window.location.href="index1.jsp";	
		<% }
	if(ms.equals("projectInserted"))
	{%>
		alert("Data inserted successfully");
		window.location.href="index1.jsp";	
	<% }
	if(ms.equals("TaskUpdated"))
	{%>
		alert("Task updated successfully");
		window.location.href="Report_Table.jsp";
		
	<%}
	if(ms.equals("projectupdate"))
	{%>
		alert("Project updated successfully");
		window.location.href="index1.jsp";
		
	<% }
	if(ms.equals("pwdchanged"))
	{%>
		alert("Password updated successfully");
		window.location.href="index.jsp";
		
	<% }
	}%>
	</script>
</body>
</html>
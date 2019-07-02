<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error page</title>
</head>
<body>
<script type="text/javascript">
//scriptlet tag// in this we can write complete java code
<%
try
{
	String ms=request.getParameter("msg");
	if(ms.equals("pwdchanged"))
	{%>
		
		alert("Updating password failed");
		window.location.href="changePassword.jsp";
	<%}

	else if (ms.equals("year"))
	{%>
		alert("Age less than 18");
		window.location.href="index.jsp";
	<%}
	else if (ms.equals("dberror"))
	{%>
		alert("Database error.Please try again");
		window.location.href="index.jsp";
	<%}
	
	else if (ms.equals("sessionerror"))
	{%>
	alert("Session Expired. Please Login again");
	window.location.href="index.jsp";
   <%}
	else
	{%>
		alert("Invalid Email or Password ");
		window.location.href="index.jsp";
	<%}
	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</script>

</body>
</html>
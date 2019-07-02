<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<head>
  <meta charset="UTF-8">
  <title>Login form</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script> 
      <link rel="stylesheet" href="css/style.css">
      <link rel="stylesheet" href="css/header.css">
  
</head>
<body id="bg">
<!-- <div class="container">
<div class="topnav">
 <span>Hello</span>
<a href="logout.jsp">Log out</a>
 <a href="index1.jsp">Edit</a>
<a href="admin.jsp">Create new project</a>
</div>
</div>>-->
  <form action="LoginServlet">
  <h1>Login</h1><br/>
<span class="select"></span>
<select required name="type">
<option value="">Select Role</option>
  <option value="admin">Admin</option>
  <option value="Technical Consultant">Technical Consultant</option>
  <option value="eu">End User</option>
</select>
<br>
<br>

  <span class="input"></span>
  <input type="email" name="email"  placeholder="Email" required/>
  
  <span id="passwordMeter"></span>
  <input type="password" name="pass" placeholder="Password" title="Password min 8 characters. At least one UPPERCASE and one lowercase letter" pattern="(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" required />
<input type=submit value="SUBMIT"id="button">

 </form>
 
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/index.js"></script>
 </body>

</html>
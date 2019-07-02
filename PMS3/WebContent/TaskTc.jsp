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
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/style1.css">
      <link rel="stylesheet" href="css/header.css">
<%
Connection con=Dao.connect();
CallableStatement stmt =con.prepareCall("BEGIN getTableName(?); END; ");
  stmt.registerOutParameter(1, OracleTypes.CURSOR);
  stmt.execute();
  ResultSet rs = ((OracleCallableStatement)stmt).getCursor(1);
%>
        <script type="text/javascript">
        var j=16;
        function button1()
        {
        	var parentDiv = document.getElementById("button");
        	parentDiv.setAttribute("style","visibility: hidden"); 
        	
        	}
        
        function chg(id)
        {  
        	var value= document.getElementById(id).value;
        	var xhttp = new XMLHttpRequest();
        	
        	xhttp.onreadystatechange=function ()
        	{
        	if(xhttp.readyState===4 && xhttp.status===200)
        		{
        		document.getElementById("temp"+(parseInt(id)+1)).innerHTML=xhttp.responseText;
        		}
        	};
        	
        	xhttp.open("POST","PopulateTableColumn?valajax="+value+"&sid="+(parseInt(id)+1),true);
        	xhttp.send();
        	
        }
        function AddObjectDescription(id)
        {  
        	var value= document.getElementById(id).value;
        	var xhttp = new XMLHttpRequest();
        	
        	xhttp.onreadystatechange=function ()
        	{
        	if(xhttp.readyState===4 && xhttp.status===200)
        		{
        		document.getElementById("temp"+(parseInt(id)+1)).innerHTML=xhttp.responseText;
        		}
        	};
        	
        	xhttp.open("POST","AddDescription?valajax="+value+"&sid="+(parseInt(id)+1),true);
        	xhttp.send();
        	
        }
        
            function addSelectBox ()
            {
                var parentDiv = document.getElementById("main");
                var selectElement = document.createElement("select");
                var option;
                var temp1;
                var temp2;
                var parentDiv1 = document.createElement("span");
                var parentDiv2 = document.createElement("span");
                var parentDiv3 = document.createElement("span");
                var br=document.createElement("br");
                var br1=document.createElement("br");
              
                selectElement.setAttribute("id",j); 
                selectElement.setAttribute("name",j); 
                selectElement.setAttribute("onchange","chg(this.id)"); 
                j=j+3;
                temp1="temp"+(j-2);
                temp2="temp"+(j-1);
                option=document.createElement("option");
                option.text="Table Name";
                option.value="";
                selectElement.add(option);
               

                <% while(rs.next())
                {%>  
    
                  option=document.createElement("option");
                  option.text="<%=rs.getString(1)%>";
                  option.value="<%=rs.getString(1)%>";
                  selectElement.add(option);
                <%}%>


               parentDiv1.setAttribute("style","padding:0px 50px 0px 0px ");
               parentDiv2.setAttribute("id",temp1);
               parentDiv3.setAttribute("id",temp2);
               parentDiv2.setAttribute("style","padding:0px 50px 0px 0px ");
               parentDiv.appendChild(parentDiv1);
               parentDiv1.appendChild(selectElement);
               parentDiv.appendChild(parentDiv2);
               parentDiv.appendChild(parentDiv3);
               parentDiv.appendChild(br);
               parentDiv.appendChild(br1);              
            }
            function sub()
            {
            	 var parentDiv = document.getElementById("main");
            	 var hidden = document.createElement("input");
            	 hidden.setAttribute("type","hidden");
                 hidden.setAttribute("name","id");
                 hidden.setAttribute("value",j);
                 parentDiv.appendChild(hidden);
            }
            

</script>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); 
%>
<div class="topnav">
 <span>
 <div>
 <img src="css/evosys3.JPG"  hspace="0" alt="Logo" height="42" width="130" align="top">Hello<%if(session.getAttribute("name")!=null && (session.getAttribute("type").equals("Technical Consultant")||session.getAttribute("type").equals("admin")))
{
String email=(String)session.getAttribute("name");
if(request.getParameter("msg")==null)
{%>
<script>
	alert("Please select Task Number");
	</script>
	<%}else{
%>
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
<center>

<form method="post" action="InsertTableColumnServlet" onsubmit="button1()">
<span id="h1">Add Object Details</span><br><br>
<input type="text" name="tn" value="<%=request.getParameter("msg") %>" id="input" readonly/>
<br><br>
<select name="1" id="1" onchange=chg(this.id) required>
<option value="">Table Name</option>
<% 
stmt.execute();
rs = ((OracleCallableStatement)stmt).getCursor(1);

while(rs.next())
{
%>
<option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
<%} %>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp2" >
<select name="2"  id="2" onchange="AddObjectDescription(this.id)">
<option value="">Column Name</option>
</select>
</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp3">
<input type="text" name="3"  id="input"  readonly></input>
</span>
<br>
<br>
<select name="4" id="4" onchange=chg(this.id) required>
<option value="">Table Name</option>
<% 
stmt.execute();
rs = ((OracleCallableStatement)stmt).getCursor(1);
while(rs.next())
{
%>
<option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
<%} %>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp5">
<select name="5"  id="5" >
<option value="">Column Name</option>
</select>
</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp6">
<input type="text" name="6"  id="input"  readonly></input>
</span>
<br>
<br>
<select name="7" id="7" onchange=chg(this.id) required>
<option value="">Table Name</option>
<% 

stmt.execute();
rs = ((OracleCallableStatement)stmt).getCursor(1);
while(rs.next())
{
%>
<option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
<%} %>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp8">
<select name="8"  id="8" >
<option value="">Column Name</option>
</select>
</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp9">
<input type="text" name="9"  id="input"  readonly></input>
</span>
<br>
<br>
<select name="10" id="10"onchange=chg(this.id) required>
<option value="">Table Name</option>
<%
stmt.execute();
rs = ((OracleCallableStatement)stmt).getCursor(1);
while(rs.next())
{
%>
<option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
<%} %>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp11">
<select name="11"  id="11" >
<option value="">Column Name</option>
</select>
</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp12">
<input type="text" name="12"  id="input"  readonly></input>
</span>
<br>
<br>
<select name="13" id="13"onchange=chg(this.id) required>
<option value="">Table Name</option>
<%
stmt.execute();
rs = ((OracleCallableStatement)stmt).getCursor(1);
while(rs.next())
{
%>
<option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
<%} %>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp14">
<select name="14"  id="14" >
<option value="">Column Name</option>
</select>
</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="temp15">
<input type="text" name="15"  id="input"  readonly></input>
</span>
<br>
<br>
 <div id="main"></div>
        
         <button type="button" onclick="addSelectBox()"  value="Add Select Box" id="button">Add select box</button>

          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" name="submit" value="SUBMIT" id="button" onclick="sub()"/>
       
        </form>
        </center>
        </body>
        <%}}else{%>
	<script>
	alert("Login to access this page");
	window.location.href="index.jsp";
	</script>
<%}%>
</html>
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
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="css/evosys3.JPG" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
<title> Report Creation</title>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script> -->
      <link rel="stylesheet" href="css/style1.css">
      <link rel="stylesheet" href="css/header.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      
       <script type="text/javascript">
       
       
       function checkFileName(str)
       {
    	 
    	   var arr;
    	   var symbols=[ "#" ,"%" ,"&" ,"{" , "}", "<", ">","*","?","/","$","!","'","@","/"];
    	   var i=0;
    	  if(str!='')
    		  {
  
    		  for(i=0;i<17;i++)
    			  {
    		  if(str.includes(symbols[i]))
    			  {
    			  console.log("In alert"+arr);
    			  alert(str.substr(12) +" contains "+symbols[i]+ "\n File name shouldn't consist of: # ,% ,& ,{ , }, \, <, >, *, ?, /, $, !, ',:, \" ,@");
    			  }
    		  else
    			  {
    			  
    			  }
    			  }
  
    		  }
       }
function changetextbox(value)
{
    if ( value === "60") 
    {
        document.getElementById("val").disabled=false;
        document.getElementById("val").required=true;
    } 
    else
    {	
        document.getElementById("val").disabled=true;
        document.getElementById("val").required=false;
        document.getElementById("val").value="";
    }
   
}

function chg()
{
	var value= document.getElementById("dc").value;
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange=function ()
	{
	if(xhttp.readyState===4 && xhttp.status===200)
		{
		document.getElementById("temp").innerHTML=xhttp.responseText;
		}
	};
	xhttp.open("POST","PopulateddServlet?valajax="+value,true);
	xhttp.send();
}
function chg2()
{
	var value= document.getElementById("module").value;
	console.log("Printing value");
	console.log(value);
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange=function ()
	{
	if(xhttp.readyState===4 && xhttp.status===200)
		{
		document.getElementById("temp1").innerHTML=xhttp.responseText;
		}
	};
	xhttp.open("POST","PopulateddServlet2?valajax="+value,true);
	xhttp.send();
	
	
	
	
	var xhttp1 = new XMLHttpRequest();
	xhttp1.onreadystatechange=function ()
	{
	if(xhttp1.readyState===4 && xhttp1.status===200)
		{
		document.getElementById("temp2").innerHTML=xhttp1.responseText;
		
		}
	};
	xhttp1.open("POST","ReportCategoryServlet?valajax="+value,true);
	xhttp1.send();
}
function button1()
{
	var parentDiv = document.getElementById("button");
	parentDiv.setAttribute("style","visibility: hidden"); 
	}

function noSpace()
{
	console.log("Calling no Space function");
var rn=document.getElementsByName("rn")[0].value.trim();
var fo=document.getElementsByName("fo")[0].value.trim();
var rdf=checkFileName(document.getElementsByName("rdf")[0].value);
var sof=checkFileName(document.getElementsByName("sof")[0].value);
var qarf=checkFileName(document.getElementsByName("qarf")[0].value);
var dmf=checkFileName(document.getElementsByName("dmf")[0].value);
var ndrf=checkFileName(document.getElementsByName("ndrf")[0].value);

if(rn=="")
{
	alert("Enter valid input for Report Name");
	}	

else if(fo=="")
	 {
	 alert("Enter valid input for Functional Owner");
	}

}


</script>

</head>
<body>

<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); 
String sql="select project_id,project_name from XXEVO_PM_PROJECT_TBL where project_status_id!=213";
Model m =new Model();
ResultSet rs = Dao.validate(sql,m);
		%>
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
	
<form action="InsertReportServlet" enctype="multipart/form-data" method=post onsubmit="button1()" >
<center><span id="h1">Report Creation</span>
<br>
<table> 
  <tr>
  <td>Report Name</td>
    <td><input type="text" name="rn"  placeholder="Report Name" id="input" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>Project Name</td>
    <td><select name="pn" required>
<option value="">Select</option>
<%while(rs.next()){%>
    <option value="<%=rs.getString(1) %>"> <%=rs.getString(2) %></option>
  <% }%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   <td>Expected<br>Completion Date</td>
    <td><input type="date" name="ecd"  id="input" />
</td>
     
  </tr>
  
 <tr>
  <td>Region</td>
    <td><select name="region" required>
<option value="">Select </option>
 <%
   rs=Dao.lov(1);
   while(rs.next())
   {%>
  
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
    
   <%}%>
</select></td>
 <td>Client Sign Off</td>
    <td><select name="cso" required>
<option value="">Select</option>
 <%
   rs=Dao.lov(6);
   while(rs.next())
   {%>
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
   <%}%>
</select></td>
<td>Status</td>
<td>
 <select name="status" required>
  <option value="52" selected>In Process</option>
  
 </select>
    </td>  
   
  </tr>
   <tr>
   <td>Module</td>
    <td><select name="module" id="module" onchange="chg2()" required>
    <option value="">Select </option> 
     <%
   rs=Dao.lov(7);
   while(rs.next())
   {%>
  
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
    
   <%}%>
</select></td>
 <td>Application</td>
 <td>
 <div id="temp1">
 <select>
 <option>Select</option>
 </select>
</div>
 </td>

<td>Report Category</td>
    <td>
    <div id="temp2">
 <select>
 <option>Select</option>
 </select>
</div>
    </td>    
  </tr>
  
   <tr>
    <td>Development<br>Category</td>
    <td><select name="dc" id="dc" onchange="chg()" required>
    <option value="">Select</option>
     <%
   rs=Dao.lov(9);
   while(rs.next())
   {%>
  
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
    
   <%}%>

 
</select></td>
<td>Project From/<br>Integration Types</td>
<td>
<div id="temp">
<select>
 <option>Select</option>
 </select>
</div>
 
    </td> 
    <td>Comments</td>
    <td><input type="text" name="comments" placeholder="Comments"  onkeypress="return AvoidSpace(event)"  id="input" />
    </td>    
  </tr>
   <tr>
   
     <td>Technical Owner</td>
    <td> 
     <select name="to"  required>
     <option value="">Select</option> <% 
    sql="select user_id,username from xxevo_pm_user_tbl where user_role!='admin' order by username";
     rs = Dao.validate(sql,m);
     
     while(rs.next()){%>
    
     <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
     <%} %>
     </select>
     </td>
     <td>Functional Owner</td>
    <td> <input type="text" name="fo" placeholder="Functional Owner"  id="input" onkeypress="return AvoidSpace(event)" required /></td>
    <td>Report Path</td>
    <td><input type="text" name="rp" placeholder="Report Path" id="input" onkeypress="return AvoidSpace(event)"  /></td>
   
  </tr>
   <tr>
    <td id="td">Recommended <br>For Std
    <br><br>Requirement Document
     <br><br>Sample Output</td>
    
      <td id="td"><select name="rfs" id="rfs" onchange=changetextbox(this.value) required >
      <option value="">Select</option>
       <%
   rs=Dao.lov(6);
   while(rs.next())
   {%>
  
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
    
   <%}%>
       </select>
      <br><br><input type="file" name="rdf"/>   <br><br>
   <input type="file" name="sof"  />
       
      </td>
    
       <td id="td">Std Comments
       <br><br><br>QA Report 
         <br><br> Data Model File
          <br><br> Report File
       </td>
        <td id="td"><input type="text"  id="val" name="stdc" placeholder="Std Comments" onkeypress="return AvoidSpace(event)" disabled/>
       <br> <br><input type="file" name="qarf"/>
      <br> <br> <input type="file" name="dmf" />
     <br><br><input type="file" name="ndrf"/> 
     </td>    
      
    <td id="td" > Activity</td>
 <td id="td">
       
      <input type="checkbox" name="dt" value="rrso">Report Requirement Sign Off<br>
      <input type="checkbox" name="dt" value="cdsbc"> Configure Dependent  Setup &<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Business Cases<br>
      <input type="checkbox" name="dt" value="vrd"> Validate Required Document<br>
      <input type="checkbox" name="dt" value="ftc">Functional Testing  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Confirmation<br>
      <input type="checkbox" name="dt" value="uatso"> UAT Sign Off<br>
      <input type="checkbox" name="dt" value="cc"> Customer Confirmation<br>
      <input type="checkbox" name="dt" value="mtp"> Move to Prod<br>
        
       </td> 
 
      </tr>
  </table>
  </center>
  
  <center> <input type=submit value="SUBMIT"   onclick="noSpace()" name= "submit" id="button" class="button"/>
           <input type=submit value="Add Object details" name="submit" id="button" class="button"/>  
  </center>
</form>

<%}
else{%>
	<script>
	alert("Login to access this page");
	window.location.href="index.jsp";
	</script>
<%}%>
<br>
<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/index.js"></script> -->
</body>
</html>
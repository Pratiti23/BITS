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
<link rel="icon" type="image/png" href="css/evosys3.JPG" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
<title> Update Report</title>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script> -->
      <link rel="stylesheet" href="css/style1.css">
      <link rel="stylesheet" href="css/header.css">
     <script type="text/javascript">
      <%
      String ms=request.getParameter("msg");
      String sql1="select object_id from XXEVO_PM_OBJECT_TBL where task_id="+ms;
      
      %>
      function checkFileName(str)
      {
   	   console.log("Calling Function");
   	   var arr;
   	   var symbols=[ "#" ,"%" ,"&" ,"{" , "}", "<", ">","*","?","/","$","!","'","@","/"];
   	   var i=0;
   	  if(str!='')
   		  {
 
   		  for(i=0;i<17;i++)
   			  {
   			  console.log("In for loop");
   			  
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
      
       
       function noSpace()
       {
       var rn=document.getElementsByName("rn")[0].value.trim();
       var fo=document.getElementsByName("fo")[0].value.trim();
       var rp=document.getElementsByName("rp")[0].value.trim();
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
       else if(rp=="")
     	 {
     	 alert("Enter valid input for Report Path");
     	 }

       }

       

 
function changetextbox(value)
{
    if ( value === "60") 
    {
        document.getElementById("val").readOnly =false;
        document.getElementById("val").required=true;
    } 
    else
    {	
        document.getElementById("val").readOnly = true;
        document.getElementById("val").required=false;
        document.getElementById("val").value="";
    }
}
    
    function changetextbox1(value)
    {
    	console.log("Calling function");
    	console.log("value");
    	console.log(value);
    
        if ( value === "54") 
        {
            document.getElementById("rp").required=true;
            
        } 
        else
        {	
            document.getElementById("rp").required=false; 
        }
        
        if(value === "54")
        	{
        	console.log("in if");
        	
        	<%
        	Model m1 = new Model();
        	ResultSet rs3=Dao.validate(sql1,m1);
        	int i=0;
        	while(rs3.next())
        	{
        	i++;	
        	}
        	%>
        	var i=<%=i%>;
        	console.log("i");
        	console.log(i);
        	if(i==0)
        		{
        		alert("Please insert Object Details");
        		document.getElementById("status").value ="52";
        		}
        	}
        if(value === "213")
        	{
        	 document.getElementById("sof").required=true;
        	}
        else{
        	document.getElementById("sof").required=false;
        }
    }

function chg()
{
	var value= document.getElementById("dc").value;
	console.log("Printing value");
	console.log(value);
	
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
function button1()
{
	var parentDiv = document.getElementById("button");
	parentDiv.setAttribute("style","visibility: hidden"); 
	
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

</script>

</head>
<body>

<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); 
String sql="select project_id,project_name from XXEVO_PM_PROJECT_TBL";
Model m =new Model();
ResultSet rs = Dao.validate(sql,m);
		%>
<div class="topnav">
 <span>
 <div>
 <img src="css/evosys3.JPG"  hspace="0" alt="Logo" height="42" width="130" align="top">Hello<%if(session.getAttribute("name")!=null && (session.getAttribute("type").equals("Technical Consultant")||session.getAttribute("type").equals("admin")))
{
String name=(String)session.getAttribute("name");%>
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
	<%
	if(ms.equals(null))
	{%>
		alert("	No project selected");
	<%}
	else{
		Connection con=Dao.connect();
		 CallableStatement stmt =con.prepareCall("BEGIN DisplayOneTask(?,?); END; ");
		   stmt.setString(1,ms);
		   stmt.registerOutParameter(2, OracleTypes.CURSOR);
		   stmt.execute();
		   ResultSet rs2 = ((OracleCallableStatement)stmt).getCursor(2);
		   
		   while(rs2.next())
			{
			 %>
<form action="UpdateReportServlet" method=post enctype="multipart/form-data"  onsubmit="button1()">
<center><span id="h1">Update Report</span>
<br>
<table> 
  <tr>
  <td>Task Number</td>
    <td><input type="text" name="id"  placeholder="Task Number" id="input" value="<%=rs2.getString(1).trim()%>" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>Report Name</td>
    <td><input type="text" name="rn" placeholder="Report Name" value="<%=rs2.getString(4).trim()%>" id="input" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   <td>Project Name</td>
    <td><select name="pn" required>
  
 <option value="<%=rs2.getString(2) %>"> <%=rs2.getString(3) %></option>
  <%while(rs.next()){
   if(!(rs2.getString(2).equals(rs.getString(1)))){
    %>
    <option value="<%=rs.getString(1) %>"> <%=rs.getString(2) %></option>
  <% }}%>
    </select>
</td>  
  </tr>
 <tr>
  <td>Region</td>
    <td><select name="region" required>
 <option value="<%=rs2.getString(6) %>"> <%=rs2.getString(7) %></option>
  <%
   rs=Dao.lov(1);
   while(rs.next())
   {
  if(!(rs2.getString(6).equals(rs.getString("lookup_ref_id")))){ %>
    <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
    
   <%}}%>
</select></td>
 <td>Client Sign Off</td>
    <td><select name="cso">
 <option value="<%=rs2.getString(28) %>"> <%=rs2.getString(29)%></option>
 <%

   rs=Dao.lov(6);
 while(rs.next())
 {
if(!(rs2.getString(28).equals(rs.getString("lookup_ref_id")))){ %>
  <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
  
 <%}}%>
</select></td>
<td>Status</td>
<td>
 <select name="status" id="status" onchange=changetextbox1(this.value)>
 
 <option value="<%=rs2.getString(8) %>"> <%=rs2.getString(9) %></option>
  <%
   rs=Dao.lov(3);
   while(rs.next())
   {if(!(rs2.getString(8).equals(rs.getString("lookup_ref_id")))){ %>
   <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
   
   <%}}%>
  
 </select>
    </td>  
   
  </tr>
   <tr>
   <td>Module</td>
    <td><select name="module" id="module" onchange="chg2()">
    <option value="<%=rs2.getString(10) %>"> <%=rs2.getString(11) %></option>
   <%
   rs=Dao.lov(7);
   while(rs.next()) {
	   if(!(rs2.getString(10).equals(rs.getString("lookup_ref_id")))){ %>
   <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
   
   <%}
   }%>
  

 
</select></td>
 <td>Application</td>
 <td>
 <div id="temp1">
 <select name="app">
  <option value="<%=rs2.getString(26) %>"> <%=rs2.getString(27) %></option>
  
  <%
  sql="select lookup_ref_id,value from XXEVO_PM_LOOKUP_REF_TBL where lookup_id=(select LOOKUP_ID  from XXEVO_PM_LOOKUP_TBL where name='"+rs2.getString(11)+"') and value is not null order by value"; 
   rs = Dao.validate(sql,m);
   while(rs.next()){
   %>
   <option value="<%=rs.getString(1) %>"> <%=rs.getString(2) %></option>
   <%} %>
 </select>
</div>
 </td>

<td>Report Category</td>
    <td>
     
 <div id="temp2">
 <select name="rc">
 <option value="<%=rs2.getString(12) %>"> <%=rs2.getString(13) %></option>
 </select>
</div>
     
    </td>    
  </tr>
  
   <tr>
    <td>Development<br> Category</td>
    <td><select name="dc" id="dc" onchange="chg()">
     <option value="<%=rs2.getString(24) %>"> <%=rs2.getString(25) %></option>
   <%
   rs=Dao.lov(9);
   while(rs.next())
   {if(!(rs2.getString(24).equals(rs.getString("lookup_ref_id")))){ %>
   <option value="<%=rs.getString("lookup_ref_id")%>"> <%=rs.getString("value")%> </option>
   <%}
   }%>
  
     
   
</select></td>
<td>Project From/<br>Integration Types</td>
<td>

<div id="temp">

<%if(!(rs2.getString(14).trim()).equals("")){ %>
<select name="pf">
<option value="<%=rs2.getString(14) %>"> <%=rs2.getString(14) %></option>
</select>
<% }%>
<%if(!(rs2.getString(15).equals("0")))
		{ %>
		<%System.out.println("it"+rs2.getString(15)); %>
		<select name="it">
<option value="<%=rs2.getString(15) %>"> <%=rs2.getString(16) %></option>
</select>
<% }%>
 
</div>
 
    </td> 
    <td>Comments</td>
    <td><input type="text" name="comments" placeholder="Comments" value="<%=rs2.getString(17).trim() %>"   id="input" />
    </td>    
  </tr>
   <tr>
   
     <td>Technical Owner</td>
    <td> 
     <select name="to"> 
      <option value="<%=rs2.getString(19)%>"><%=rs2.getString(42)%></option>
     <% 
    sql="select user_id,username from xxevo_pm_user_tbl where user_role!='admin' order by username";
     rs = Dao.validate(sql,m);
     
     while(rs.next()){
     if(!(rs2.getString(19).equals(rs.getString(1)))){%>
    
     <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
     <%} }%>
     </select>
     </td>
     <td>Functional Owner</td>
    <td> <input type="text" name="fo" value="<%=rs2.getString(18).trim()%>" placeholder="Functional Owner"  id="input" required /></td>
    <td>Report Path</td>
    <td><input type="text" name="rp" placeholder="Report Path" value="<%=rs2.getString(20).trim() %>" id="rp"  /></td>
   
  </tr>
   <tr>
    <td>Recommended <br>For Std</td>
    
      <td><select name="rfs" id="rs1" onchange=changetextbox(this.value)>
      <option value="<%=rs2.getString(21)%>"> <%=rs2.getString(22)%> </option>
        <%
   rs=Dao.lov(6);
   while(rs.next())
   {
   if(!(rs2.getString(21).equals(rs.getString("lookup_ref_id")))){ %>
    <option value="<%=rs.getString(1) %>"> <%=rs.getString(2) %></option>
  <% }}%>
       </select>
      </td>
    
       <td>Std Comments </td>
        <td><input type="text"  id="val" value="<%=rs2.getString(23).trim()%>" name="stdc" readonly/></td>    
      <td>Expected <br>Completion Date</td>&nbsp; &nbsp; &nbsp; &nbsp;
<td><input type="date" name="ecd" placeholder="Expected Completion date"  id="input" value="<%=rs2.getString(5)%>" required /></td>  
  </tr>
  </table>
  </center>
  <center>
  <table>
   <tr>
    <td id="td">
    
      Requirement  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <%if(!rs2.getString(30).trim().equals("")){%>
    	<a href="GetAttachmentServlet?msg=<%=rs2.getString(30)%>">  <img src="css/download.jpg" alt="download logo" width="25" height="25" align="top"> </a>
      <input type="file" name="rdf"  id="rdf" /> <br>Document<br><br>
      <% } else{%>
      <input type="file" name="rdf"  id="rdf" required/> <br>Document<br><br>
      <%} %>
    Sample Output  &nbsp;&nbsp;&nbsp;&nbsp; 
     <%if(!rs2.getString(31).trim().equals("")){%>
  <a href="GetAttachmentServlet?msg=<%=rs2.getString(31)%>">  <img src="css/download.jpg" alt="download logo" width="25" height="25" align="top">  </a>
    <input type="file" name="sof" /> 
     <% } else{%>
      <input type="file" name="sof" id="sof" /> 
        <%} %>
   
    </td>
     <td id="td">
  
    QA Report &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%if(!rs2.getString(32).trim().equals("")){%>
   <a href="GetAttachmentServlet?msg=<%=rs2.getString(32)%>"> <img src="css/download.jpg" alt="download logo" width="25" height="25" align="top"></a>
     <input type="file" name="qarf" /><br><br>
       <% } else{%>
       <input type="file" name="qarf" /><br><br>
         <%} %>
   
    Data Model File &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <%if(!rs2.getString(33).trim().equals("")){%>
    <a href="GetAttachmentServlet?msg=<%=rs2.getString(33)%>"> <img src="css/download.jpg" alt="download logo" width="25" height="25" align="top"></a>
     <input type="file" name="dmf"  /><br><br>
       <% } else{%>
         <input type="file" name="dmf"  /><br><br>
           <%} %>
    Report File &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
     <%if(!rs2.getString(34).trim().equals("")){%>
    <a href="GetAttachmentServlet?msg=<%=rs2.getString(34)%>"> <img src="css/download.jpg" alt="download logo" width="25" height="25" align="top"> </a>
    <input type="file" name="ndrf" /><br><br>
       <% } else{%>
        <input type="file" name="ndrf" /><br><br>
          <%} %>
 <center>  
 <input type=submit value="SUBMIT" id="button" name="submit" onclick="noSpace()"/>
 
 <input type=submit value="Update Object Details" name="submit" id="button" onclick="noSpace()"/> 
 </center>
   
    </td>
     
    <td id="td"> Activity</td>
 <td id="td">
 <%if(rs2.getString(35)!=null){ %>
           <input type="checkbox" name="dt" value="rrso" checked> Report Requirement Sign Off<br>
           <%}else{ %>
           <input type="checkbox" name="dt" value="rrso"> Report Requirement Sign Off<br>
           <%}if(rs2.getString(36)!=null){ %>
      <input type="checkbox" name="dt" value="cdsbc" checked>  Configure Dependent  Setup &  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Business Cases<br>
        <%}else{ %>
        <input type="checkbox" name="dt" value="cdsbc">  Configure Dependent  Setup &  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Business Cases<br>
     <%}if(rs2.getString(37)!=null){ %>
      <input type="checkbox" name="dt" value="vrd" checked>  Validate Required Document<br>
      <%}else{ %>
      <input type="checkbox" name="dt" value="vrd" >  Validate Required Document<br>
       <%}if(rs2.getString(38)!=null){ %>
       <input type="checkbox" name="dt" value="ftc" checked>  Functional Testing Confirmation<br>
        <%}else{ %>
       <input type="checkbox" name="dt" value="ftc">  Functional Testing Confirmation<br>
       <%}if(rs2.getString(39)!=null){ %>
      <input type="checkbox" name="dt" value="uatso" checked>  UAT Sign Off<br>
        <%}else{ %>
       <input type="checkbox" name="dt" value="uatso">  UAT Sign Off<br>
         <%}if(rs2.getString(40)!=null){ %>
      <input type="checkbox" name="dt" value="cc" checked>  Customer Confirmation<br>
       <%}else{ %>
       <input type="checkbox" name="dt" value="cc">  Customer Confirmation<br>
          <%}if(rs2.getString(41)!=null){ %>
      <input type="checkbox" name="dt" value="mtp" checked>  Move to Prod<br>
         <%}else{ %>
        <input type="checkbox" name="dt" value="mtp">  Move to Prod<br>
        <%} %>
       </td> 
  </tr>
 
</table>
</center>
</form>
<%} 
	}
	
}else
{%>
	<script>
	alert("Login to acess this page");
	window.location.href="index.jsp";
	</script>
<%} %>
<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/index.js"></script> -->
   
</body>
</html>
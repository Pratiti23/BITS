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
<%String sql="select meaning ,value from XXEVO_PM_LOOKUP_REF_TBL where lookup_id="+21+"order by value";
Model m = new Model();
ResultSet rs=Dao.validate(sql,m);  
%>
 <script type="text/javascript">
 j=7;
 function search()
 {  
 	
 	var xhttp = new XMLHttpRequest();
	var string_value="";
	var i=0;
 	
 	xhttp.onreadystatechange=function ()
 	{
 	if(xhttp.readyState===4 && xhttp.status===200)
 		{
 		document.getElementById("temp").innerHTML=xhttp.responseText;
 		}
 	};
   for(i=1;i<j;i++)
	   {
	   string_value=string_value+document.getElementById(i+"").value.trim()+"-"+document.getElementsByName(++i+"")[0].value.trim()+",";
	   }
   
 	
 	xhttp.open("POST","searchServlet?valajax="+ string_value,true);
 	xhttp.send();
 	
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
 	
 	xhttp.open("POST","lovServlet?valajax="+value+"&sid="+(parseInt(id)+1),true);
 	xhttp.send();
 	
 }
function addSelectBox()
{
    var parentDiv = document.getElementById("main");
    var selectElement = document.createElement("select");
    var select2 = document.createElement("select");
    var newline = document.createElement("br"); 
    var span = document.createElement("span"); 
    var newline2 = document.createElement("br"); 
    var option;
    span.setAttribute("style","padding:0px 50px 0px 50px");
    
  	selectElement.setAttribute("id",j); 
    selectElement.setAttribute("name",j); 
    selectElement.setAttribute("required","required"); 
    selectElement.setAttribute("onchange","chg(this.id)"); 
    
    select2.setAttribute("name", j+1); 
    span.setAttribute("id","temp"+(j+1));
    j=j+2;
   
    option=document.createElement("option");
    option.text="Select";
    option.value="";
    selectElement.add(option);
    
    option=document.createElement("option");
    option.text="Select";
    option.value="";
    select2.add(option);
   

    <% while(rs.next())
    {%>  

      option=document.createElement("option");
      option.text="<%=rs.getString(1)%>";
      option.value="<%=rs.getString(2)%>";
      selectElement.add(option);
    <%}%>

    parentDiv.appendChild(newline);
    parentDiv.appendChild(newline2);
    parentDiv.appendChild(selectElement);
    parentDiv.appendChild(span);
    span.appendChild(select2);
    
         
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	<link rel="stylesheet" type="text/css" href="css/search.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/header.css">
<title>Search</title>
</head>

<body>
<%

if(session.getAttribute("type")!=null && (session.getAttribute("type").equals("End User")||session.getAttribute("type").equals("Technical Consultant")||session.getAttribute("type").equals("admin"))){%>
<div class="topnav">
<span>
<div>
<img src="css/evosys3.JPG" alt="Evosys Logo" height="42" width="130" align="top">
</div>
</span>
</div>
<br>
<center>
<span id="h1">Search</span>
<br>
<br>
<select name="1" id="1"  onchange=chg(this.id) required>
<option value="">Select</option>
<%
rs=Dao.validate(sql,m);
while(rs.next()){%>
<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%> </option>
<%}%>
</select>
<span id="temp2">
<select name="2">
<option value="">Select</option>
</select>
</span>
<select name="3" id="3"  onchange=chg(this.id) required>
<option value="">Select</option>

<%  rs=Dao.validate(sql,m);
while(rs.next())
{%>
<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%> </option>
<%}%>
</select>
<span id="temp4">
<select name="4" >
<option value="">Select</option>
</select>
</span>
<br>
<br>
<select name="5" id="5"  onchange=chg(this.id) required>
<option value="">Select</option>
<%
rs=Dao.validate(sql,m);
while(rs.next()){%>
<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%> </option>
<%}%>
</select>
<span id="temp6">
<select name="6">
<option value="">Select</option>
</select>
</span>
 <div id="main"></div>
    <button type="button" onclick="addSelectBox()" id="button">Add Filter</button>
    <button type="button" onclick="search()"  id="button">Search</button>
</center>
 <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110" style="overflow:scroll;height:570px;">
					<table data-vertable="ver1">
				
					<thead>
							<tr class="row100 head" >
								
                               <th class="column100 column1" data-column="column1">Task Number</th>
								<th class="column100 column1" data-column="column1"><center style="width:400px;">Report Name</center></th>
								<th class="column100 column6" data-column="column6"><center style="width:400px;">Project Name</center></th>
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
								<th class="column100 column3" data-column="column3"><br><center style="width:350px;">Std<br>comments</center></th>
								<th class="column100 column3" data-column="column3"><br><center style="width:300px;">Development<br>Category</center></th>
								<th class="column100 column6" data-column="column6">Application</th>
								<th class="column100 column6" data-column="column6"><center style="width:130px;">Requirement Document</center></th>
								<th class="column100 column6" data-column="column6"><center style="width:130px;">Sample Output</center></th>
						
								
								
							</tr>
							</thead>
							
								<tbody id="temp">
								<%
								Connection con=Dao.connect();
								 CallableStatement stmt =con.prepareCall("BEGIN SearchDisplay(?); END; ");
								   stmt.registerOutParameter(1,OracleTypes.CURSOR);
								   stmt.execute();
								   ResultSet rs2 = ((OracleCallableStatement)stmt).getCursor(1);
								   
								while(rs2.next()){
   { %>
							<tr class="row100">
								
								<% if(rs2.getString(1)!=null){%>
								<td class="column100 column1" data-column="column1" style="font-weight: normal;"><%=rs2.getString(1)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(2)!=null){%>
								<td class="column100 column3" data-column="column3" style="font-weight: normal;"><%=rs2.getString(2)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(3)!=null){%>
								<td class="column100 column2" data-column="column2" style="font-weight: normal;"><%=rs2.getString(3)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(4)!=null){%>
								<td class="column100 column4" data-column="column4" style="font-weight: normal;"><%=rs2.getString(4)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(5)!=null){%>
								<td class="column100 column5" data-column="column5" style="font-weight: normal;"><center><%=rs2.getString(5)%></center></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(6)!=null){%>
								<td class="column100 column6" data-column="column6"style="font-weight: normal;"><%=rs2.getString(6)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(7)!=null){%>
								<td class="column100 column7" data-column="column7" style="font-weight: normal;"><%=rs2.getString(7)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(8)!=null){%>
								<td class="column100 column8" data-column="column8" style="font-weight: normal;"><%=rs2.getString(8)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(9)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs2.getString(9)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								
								<% if(rs2.getString(10)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs2.getString(10)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								
								<% if(rs2.getString(11)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs2.getString(11)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(12)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs2.getString(12)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(13)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs2.getString(13)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(14)!=null){%>
								<td class="column100 column9" data-column="column9"style="font-weight: normal;"><%=rs2.getString(14)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(15)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;" ><%=rs2.getString(15)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(16)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs2.getString(16)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(rs2.getString(17)!=null){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><%=rs2.getString(17)%></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(!rs2.getString(18).trim().equals("")){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><a href="GetAttachmentServlet?msg=<%=rs2.getString(18)%>"> Download File </a></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
								<% if(!rs2.getString(19).trim().equals("")){%>
								<td class="column100 column9" data-column="column9" style="font-weight: normal;"><a href="GetAttachmentServlet?msg=<%=rs2.getString(19)%>"> Download File </a></td>
								<%} else{%>
								<td class="column100 column9" data-column="column9"> </td>
								<%} %>
							
								
								
						
							</tr>
							<% }%>
							

<%} }else
{%>
<script>
alert("Please login");
window.location.href="index.jsp";
</script>	
<% }%>							
</tbody>		
	</table>
</div>
</center>
</body>
</html>
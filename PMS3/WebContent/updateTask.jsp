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
int i1=0;
Connection con=Dao.connect();
CallableStatement stmt =con.prepareCall("BEGIN getTableName(?); END; ");
  stmt.registerOutParameter(1, OracleTypes.CURSOR);
  stmt.execute();
  ResultSet rs = ((OracleCallableStatement)stmt).getCursor(1);
  
  CallableStatement stmt1 =con.prepareCall("BEGIN DisplayTableColumn(?,?); END; ");
  String id=request.getParameter("msg");
  String ar[]=id.split("_");
  stmt1.setInt(1, Integer.parseInt(ar[2]));
  stmt1.registerOutParameter(2, OracleTypes.CURSOR);
  stmt1.execute();
  ResultSet rs2 = ((OracleCallableStatement)stmt1).getCursor(2);

  while(rs2.next())
  {
  	i1++;
  	}

%>
        <script type="text/javascript">
        function button1()
        {
        	var parentDiv = document.getElementById("button");
        	parentDiv.setAttribute("style","visibility: hidden"); 
        	
        	}
       <% if(i1==0)
        {%>
       	 var j=16;
        <%}
        else
        {%>
        var j=<%=i1*3+1%>;
        <%}%>
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
        	console.log("value");
        	console.log(value);
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

<form method="post" action="UpdateTableColumn"  onsubmit="button1()">
<span id="h1">Update Object Details</span><br><br>
<input type="text" name="tn" value="<%=request.getParameter("msg") %>" id="input" readonly/>
<br><br>

<%
int temp=1;
stmt1.execute();
rs2 = ((OracleCallableStatement)stmt1).getCursor(2);

while(rs2.next()){ 
	 if(!rs2.getString(1).equals("null"))
{
	System.out.println("Value "+rs2.getString(1));
%>

<select id=<%=temp%> name=<%=temp%> onchange=chg(this.id)>
<option value=<%=rs2.getString(1)%> > <%=rs2.getString(1)%></option>

<%
stmt.execute();
rs = ((OracleCallableStatement)stmt).getCursor(1);
while(rs.next()){%>
<%if(!rs.getString(1).equals(rs2.getString(1))){%>

<option value=<%=rs.getString(1)%> > <%=rs.getString(1)%></option>

<%}} %>
</select>
<%temp=temp+1;
String temp2="temp"+temp;
%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<span id="<%=temp2 %>">
<select id=<%=temp%> name=<%=temp%> id=<%=temp%> onchange="AddObjectDescription(this.id)">
<option value=<%=rs2.getString(2)%> > <%=rs2.getString(2)%></option>
<% 
while(rs.next()){%>
<%if(!rs.getString(2).equals(rs2.getString(2))){%>

<option value="<%=rs.getString(2)%>"> <%=rs.getString(2)%></option>

<%}} %>
</select>
<%temp=temp+1;
temp2="temp"+temp;
%>
</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="<%=temp2%>">
<input type="text" value="<%=rs2.getString(3) %>" name="<%=temp%>" id="input" readonly>
</span>
<br><br>
<%temp=temp+1;
} }%>
 <div id="main">
            
        </div>
        
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
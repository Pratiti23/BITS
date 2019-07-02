package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import oracle.jdbc.*;

/**
 * Servlet implementation class searchServlet
 */
public class searchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String value= request.getParameter("valajax");
		value = value.substring(0, value.length()-1);
		
		System.out.println(value);
		try(PrintWriter out= response.getWriter())
		{
		System.out.println("In try");
			
			Connection con=Dao.connect();
			CallableStatement stmt =con.prepareCall("BEGIN SearchTaskDynamic(?,?); END; ");
			stmt.setString(1,value);
			stmt.registerOutParameter(2,OracleTypes.CURSOR);
			stmt.execute();
			ResultSet rs2 = ((OracleCallableStatement)stmt).getCursor(2);
			
		   
			while(rs2.next()){
		     
			response.getWriter().write("<tr class=\"row100\">");
		
		    if(rs2.getString(1)!=null){
		    response.getWriter().write("<td class=\"column100 column1\" data-column=\"column1\" style=\"font-weight: normal;\">"+rs2.getString(1)+"</td>");
		   } else{
		   response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		   } 
		if(rs2.getString(2)!=null){
           response.getWriter().write("<td class=\"column100 column3\" data-column=\"column3\" style=\"font-weight: normal;\">"+rs2.getString(2)+"</td>");
			} else{
			 response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
			} 
			if(rs2.getString(3)!=null){
			 response.getWriter().write("<td class=\"column100 column2\" data-column=\"column2\" style=\"font-weight: normal;\">"+rs2.getString(3)+"</td>");
			 } else{
			 response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
			 } 
			 if(rs2.getString(4)!=null){
		     response.getWriter().write("<td class=\"column100 column4\" data-column=\"column4\" style=\"font-weight: normal;\">"+rs2.getString(4)+"</td>");
		     } else{
		     response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		    } 
		    if(rs2.getString(5)!=null){
		    response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\"><center>"+rs2.getString(5)+"</center></td>");
		    } else{
		    response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		    }
		   if(rs2.getString(6)!=null){
		    response.getWriter().write("<td class=\"column100 column6\" data-column=\"column6\" style=\"font-weight: normal;\">"+rs2.getString(6)+"</td>");
		   }else{
		    response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		  } 
		  if(rs2.getString(7)!=null){
		  response.getWriter().write("	<td class=\"column100 column7\" data-column=\"column7\" style=\"font-weight: normal;\">"+rs2.getString(7)+"</td>");
		  } else{
		   response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		   } 
		  if(rs2.getString(8)!=null){
		   response.getWriter().write("<td class=\"column100 column8\" data-column=\"column8\" style=\"font-weight: normal;\">"+rs2.getString(8)+"</td>");
		   } else{
		   response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		  } 
		   if(rs2.getString(9)!=null){
		   response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\">"+rs2.getString(9)+"</td>");
		   } else{
		   response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		 } 
		
				  if(rs2.getString(10)!=null){
			      response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\">"+rs2.getString(10)+"</td>");
				 } else{
				response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
			    }

			if(rs2.getString(11)!=null){
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\">"+rs2.getString(11)+"</td>");
		  } else{
		response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		 if(rs2.getString(12)!=null){
			 response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\">"+rs2.getString(12)+"</td>");
		
} else{
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
}
if(rs2.getString(13)!=null){
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\">"+rs2.getString(13)+"</td>");
} else{
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
}
 if(rs2.getString(14)!=null){
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\">"+rs2.getString(14)+"</td>");
} else{
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
} 
 if(rs2.getString(15)!=null){
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\" >"+rs2.getString(15)+"</td>");
} else{
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
} 
if(rs2.getString(16)!=null){
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\">"+rs2.getString(16)+"</td>");
} else{
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
} 
if(rs2.getString(17)!=null){
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\">"+rs2.getString(17)+"</td>");
} else{
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
} 
if(rs2.getString(18)!=null){
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"><a href=\"GetAttachmentServlet?msg="+rs2.getString(18)+"\"> Download File </a></td>");
} else{
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
}
 if(rs2.getString(19)!=null){
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"><a href=\"GetAttachmentServlet?msg="+rs2.getString(19)+"\"> Download File </a></td>");
 }else{
response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
}
	
			}	
		

response.getWriter().write(	"</tr>");
		  }catch(Exception e)
		{
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

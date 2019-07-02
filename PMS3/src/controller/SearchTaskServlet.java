package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import oracle.jdbc.*;

/**
 * Servlet implementation class SearchTaskServlet
 */
public class SearchTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str = request.getParameter("valajax");
		System.out.println(str);
		//pn,rn,tn
		String ar[]=str.split(",");
		System.out.println(ar[0]+","+ar[1]+","+ar[2]);
		
		try(PrintWriter out= response.getWriter())
		{
		
		Connection con=Dao.connect();
		 CallableStatement stmt =con.prepareCall("BEGIN SearchTask(?,?,?,?,?); END; ");
		 HttpSession session = request.getSession();
		 ar[0]=ar[0].replace('x',' ');
		 ar[1]=ar[1].replace('x',' ');
		 ar[2]=ar[2].replace('x',' ');
		 stmt.setString(1, ar[0].trim());
		 stmt.setString(2, ar[1].trim());
		 stmt.setString(3, ar[2].trim());
		 System.out.println("After trim "+ar[0].trim()+","+ar[1].trim()+","+ar[2].trim());
		 stmt.setInt(4, Integer.parseInt((String)session.getAttribute("email")));
		  
		   stmt.registerOutParameter(5, OracleTypes.CURSOR);
		   stmt.execute();
		   ResultSet rs = ((OracleCallableStatement)stmt).getCursor(5);
		   
		while(rs.next())
{ 
			response.getWriter().write("<tr class=\"row100\">");
	  response.getWriter().write("	<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"><a href=\"Report_update.jsp?msg="+rs.getString(20)+"\">Edit</a></td>");
	if(rs.getString(1)!=null){
		response.getWriter().write("<td class=\"column100 column1\" data-column=\"column1\" style=\"font-weight: normal;\">"+rs.getString(1)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"> </td>");
		} 
		 if(rs.getString(3)!=null){
			 response.getWriter().write("<td class=\"column100 column3\" data-column=\"column3\" style=\"font-weight: normal;\">"+rs.getString(3)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"> </td>");
		}
		 if(rs.getString(2)!=null){
			 response.getWriter().write("<td class=\"column100 column2\" data-column=\"column2\" style=\"font-weight: normal;\">"+rs.getString(2)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		if(rs.getString(4)!=null){
			response.getWriter().write("<td class=\"column100 column4\" data-column=\"column4\" style=\"font-weight: normal;\">"+rs.getString(4)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		if(rs.getString(5)!=null){
			response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(5)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		 if(rs.getString(6)!=null){
			 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(6)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		 if(rs.getString(7)!=null){
			 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(7)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		if(rs.getString(8)!=null){
			 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(8)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		 if(rs.getString(9)!=null){
		 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(9)+"</td>");
		} else{
		response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		
		if(rs.getString(10)!=null){
			response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(10)+"</td>");
		} else{
		response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		
		 if(rs.getString(11)!=null){
			 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(11)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		if(rs.getString(12)!=null){
			response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(12)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		 if(rs.getString(13)!=null){
			 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(13)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		 if(rs.getString(14)!=null){
			 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(14)+"</td>");
		} else{
		response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		 if(rs.getString(15)!=null){
			 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(15)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		 if(rs.getString(16)!=null){
			 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(16)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		if(rs.getString(17)!=null){
		 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(17)+"</td>");
		} else{
		response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		 if(rs.getString(18)!=null){
		 response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(18)+"</td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		 if(rs.getString(19)!=null){
		response.getWriter().write("<td class=\"column100 column5\" data-column=\"column5\" style=\"font-weight: normal;\">"+rs.getString(19)+"</td>");
		} else{
		response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		 if(!rs.getString(21).trim().equals("")){
			 response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"><a href=\"GetAttachmentServlet?msg="+rs.getString(21)+"\"> Download File </a></td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		 if(!rs.getString(22).trim().equals("")){
		 response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"><a href=\"GetAttachmentServlet?msg="+rs.getString(22)+"\"> Download File </a></td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		
		if(!rs.getString(23).trim().equals("")){
		response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"><a href=\"GetAttachmentServlet?msg="+rs.getString(23)+"\"> Download File </a></td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		}
		 if(!rs.getString(24).trim().equals("")){
			 response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"><a href=\"GetAttachmentServlet?msg="+rs.getString(24)+"\"> Download File </a></td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		if(!rs.getString(25).trim().equals("")){
			 response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\" style=\"font-weight: normal;\"><a href=\"GetAttachmentServlet?msg="+rs.getString(25)+"\"> Download File </a></td>");
		} else{
			response.getWriter().write("<td class=\"column100 column9\" data-column=\"column9\"> </td>");
		} 
		
		response.getWriter().write("</tr>");
}
}
		catch(Exception e)
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

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class PopulateddServlet2
 */
public class PopulateddServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopulateddServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
response.setContentType("text/html;charset=UTF-8");
ResultSet rs2=null;
		
		try(PrintWriter out= response.getWriter())
		{
			try{
			String valajax=request.getParameter("valajax");
			if(valajax.equals("64"))
			{
				rs2=Dao.lov(11);
				response.getWriter().write("<select name=\"app\" >");
				 while(rs2.next())
					{
					 response.getWriter().write("<option value=\""+rs2.getString(1)+"\">"+rs2.getString(2)+"</option>");
					}
					response.getWriter().write("</select>");
				
			}
			else if(valajax.equals("62"))
			{
				
				rs2=Dao.lov(13);
				response.getWriter().write("<select name=\"app\" required>");
				 while(rs2.next())
					{
					 response.getWriter().write("<option value=\""+rs2.getString(1)+"\">"+rs2.getString(2)+"</option>");
					}
					response.getWriter().write("</select>");
			}
			else if(valajax.equals("63"))
			{
				
				rs2=Dao.lov(14);
				response.getWriter().write("<select name=\"app\" required>");
				 while(rs2.next())
					{
					 response.getWriter().write("<option value=\""+rs2.getString(1)+"\">"+rs2.getString(2)+"</option>");
					}
					response.getWriter().write("</select>");
			}
			else if(valajax.equals("65"))
			{rs2=Dao.lov(20);
			response.getWriter().write("<select name=\"app\" required>");
			 while(rs2.next())
				{
				 response.getWriter().write("<option value=\""+rs2.getString(1)+"\">"+rs2.getString(2)+"</option>");
				}
				response.getWriter().write("</select>");
	response.getWriter().write("</select>");
			}
			else
			{
				response.getWriter().write("<select name=\"app\">");
				response.getWriter().write("<option value=\"\">Select</option>");
				response.getWriter().write("</select>");
			}
		
			}catch(Exception e)
		{
			
		}
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

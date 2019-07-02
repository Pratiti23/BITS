package controller;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

import java.io.*;
import java.sql.ResultSet;
import java.util.*;

/**
 * Servlet implementation class PopulateddServlet
 */
public class PopulateddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopulateddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out= response.getWriter())
		{
			String sql="select project_name from xxevo_pm_project_tbl";
			   Model m =new Model();
			
			
			String valajax=request.getParameter("valajax");
			
			
			if(valajax.equals("148"))
			{
				ResultSet rs= Dao.validate(sql,m);
				response.getWriter().write("<select name=\"pf\">");
			
				   while(rs.next())
				   {
					   response.getWriter().write("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
				   }
				response.getWriter().write("</select>");
				
			}
			else if(valajax.equals("147"))
			{
				response.getWriter().write("<select name=\"it\">");
				
				 ResultSet rs2=Dao.lov(16);
			 while(rs2.next())
				{
				 response.getWriter().write("<option value=\""+rs2.getString(1)+"\">"+rs2.getString(2)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else
			{
				response.getWriter().write("<select name=\"it\">");
				
			
				response.getWriter().write("</select>");
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

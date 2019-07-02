package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class PopulateTableColumn
 */
public class PopulateTableColumn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopulateTableColumn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out= response.getWriter())
		{
			String sid=request.getParameter("sid");
			String valajax=request.getParameter("valajax");
			String sql="select COLUMN_NAME from XXEVO_PM_OBJ_LOV_TBL where object_name='"+valajax+"'";
			   Model m =new Model();			
				ResultSet rs= Dao.validate(sql,m);
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\" onchange=\"AddObjectDescription(this.id)\" required> ");
				 response.getWriter().write("<option value=\"\">Column Name</option>");  
				
				   while(rs.next())
				   {
					   response.getWriter().write("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");  
				   }
				response.getWriter().write("</select>");
				
			
		}
			catch(Exception e)
			{
				
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

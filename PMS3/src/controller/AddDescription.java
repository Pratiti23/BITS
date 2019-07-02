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
 * Servlet implementation class AddDescription
 */
public class AddDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDescription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out= response.getWriter())
		{
			String sid=request.getParameter("sid");
			String valajax=request.getParameter("valajax");
			String sql="select OBJECT_DESCRIPTION from XXEVO_PM_OBJ_LOV_TBL where COLUMN_NAME='"+valajax+"'";
			   Model m =new Model();			
				ResultSet rs= Dao.validate(sql,m);
				
				
				   while(rs.next())
				   {
					   response.getWriter().write("<input type=\"text\"  value=\""+rs.getString(1)+"\"name=\""+sid+"\"  id=\"input\" readonly> ");
					  
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

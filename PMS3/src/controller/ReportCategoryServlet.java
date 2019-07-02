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
 * Servlet implementation class ReportCategoryServlet
 */
public class ReportCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
ResultSet rs2=null;
Model m =new Model();
String sql="";
		
		try(PrintWriter out= response.getWriter())
		{
			try{
			String valajax=request.getParameter("valajax");
			System.out.println("valajax"+valajax);
			if(valajax.equals("64"))
			{
				sql="select lookup_ref_id,meaning from XXEVO_PM_LOOKUP_REF_TBL where lookup_id="+11+"and meaning is not null order by meaning";
				rs2=Dao.validate(sql,m);
				response.getWriter().write("<select name=\"rc\" required >");
				 while(rs2.next())
					{
					 response.getWriter().write("<option value=\""+rs2.getString(1)+"\">"+rs2.getString(2)+"</option>");
					}
					response.getWriter().write("</select>");
				
			}
			else if(valajax.equals("62"))
			{
				sql="select lookup_ref_id,meaning from XXEVO_PM_LOOKUP_REF_TBL where lookup_id="+13+"and meaning is not null order by meaning";
				rs2=Dao.validate(sql,m);
				response.getWriter().write("<select name=\"rc\" required>");
				 while(rs2.next())
					{
					 response.getWriter().write("<option value=\""+rs2.getString(1)+"\">"+rs2.getString(2)+"</option>");
					}
					response.getWriter().write("</select>");
			}
			else if(valajax.equals("63"))
			{
				sql="select lookup_ref_id,meaning from XXEVO_PM_LOOKUP_REF_TBL where lookup_id="+14+"and meaning is not null order by meaning";
				rs2=Dao.validate(sql,m);
				response.getWriter().write("<select name=\"rc\" required>");
				 while(rs2.next())
					{
					 response.getWriter().write("<option value=\""+rs2.getString(1)+"\">"+rs2.getString(2)+"</option>");
					}
					response.getWriter().write("</select>");
			}
			
			else
			{
				response.getWriter().write("<select name=\"rc\">");
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

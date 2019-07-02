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
 * Servlet implementation class lovServlet
 */
public class lovServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lovServlet() {
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
			
			String column_name="select DISTINCT column_name from xxevo_pm_obj_lov_tbl order by column_name";
			String application="select DISTINCT value from xxevo_pm_lookup_ref_tbl where (lookup_id=11 or lookup_id=13 or lookup_id=14 or lookup_id=20) and value is not null order by value";
			String obj_description="select DISTINCT object_description from xxevo_pm_obj_lov_tbl order by object_description";
			String table_name="select DISTINCT object_name from xxevo_pm_obj_lov_tbl order by object_name";
			String report_category="select distinct meaning from xxevo_pm_lookup_ref_tbl where (lookup_id=11 or lookup_id=13 or lookup_id=14 or lookup_id=20) and meaning is not null order by meaning";
			String tech_owner="select DISTINCT username from XXEVO_PM_USER_TBL where user_role='Technical Consultant' order by username";
			String proj_name="select DISTINCT project_name from xxevo_pm_project_tbl order by project_name";
			Model m =new Model();
			String sid=request.getParameter("sid");
			String valajax=request.getParameter("valajax");
			ResultSet rs;
			if(valajax.equals("Task_number"))
			{
			  
			response.getWriter().write("<input type=\"text\" name=\""+sid+"\" id=\""+sid+"\"   placeholder=\"Text\" id=\"input\" required style=\"width:230px; height:40px;\" />");
				
			}
			
			else if(valajax.equals("report_name"))
			{
			  
			response.getWriter().write("<input type=\"text\" name=\""+sid+"\" id=\""+sid+"\"   placeholder=\"Text\" id=\"input\" required style=\"width:230px; height:40px;\" />");
				
			}
			
			else if(valajax.equals("region_id"))
			{
			  rs= Dao.lov(1);
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
			
				   while(rs.next())
				   {
					   response.getWriter().write("<option value=\""+rs.getString(2)+"\">"+rs.getString(2)+"</option>");
				   }
				response.getWriter().write("</select>");
				
			}
			else if(valajax.equals("Application"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
				  rs=Dao.validate(application,m);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else if(valajax.equals("COLUMN_NAME"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
				  rs=Dao.validate(column_name,m);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else if(valajax.equals("DEVELOPMENT_CATEGORY_ID"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
				  rs=Dao.lov(9);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(2)+"\">"+rs.getString(2)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else if(valajax.equals("OBJECT_DESCRIPTION"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
				  rs=Dao.validate(obj_description,m);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else if(valajax.equals("Object_name"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
				  rs=Dao.validate(table_name,m);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else if(valajax.equals("REPORT_CATEGORY_ID"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
			 rs=Dao.validate(report_category,m);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else if(valajax.equals("Technical_owner"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
			 rs=Dao.validate(tech_owner,m);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else if(valajax.equals("module_id"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
			 rs=Dao.lov(7);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(2)+"\">"+rs.getString(2)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else if(valajax.equals("project_id"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
			 rs=Dao.validate(proj_name,m);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else if(valajax.equals("status_id"))
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
			 rs=Dao.lov(3);
			 while(rs.next())
				{
				 response.getWriter().write("<option value=\""+rs.getString(2)+"\">"+rs.getString(2)+"</option>");
				}
				response.getWriter().write("</select>");
			}
			else
			{
				response.getWriter().write("<select name=\""+sid+"\" id=\""+sid+"\">");
				
			
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

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import dao.Dao;

 import oracle.jdbc.*;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email= request.getParameter("email");
		String pass= request.getParameter("pass");
		String type=request.getParameter("type");
		String page="";
		String name="";
		String user_id="";
					
		if(email.equals("")|| pass.equals(""))
		{
			page="error.jsp?msg=fail";
		}
		else
		{
			try
			{
				Connection con=Dao.connect();
				 CallableStatement stmt =con.prepareCall("begin login(?,?,?,?); end;");
				 stmt.setString (1, email);
				 stmt.setString (2, pass);
				 stmt.setString (3, type);
				   stmt.registerOutParameter(4, OracleTypes.CURSOR);
				   stmt.execute();
				   ResultSet rs = ((OracleCallableStatement)stmt).getCursor(4);
				
				
				   while(rs.next())
				   {
					  name=rs.getString(1);
					   user_id=rs.getString(2);
					  
				   }
				if(!(name==null || name.equals("")))
		  		{
					
					HttpSession session = request.getSession();
					session.setAttribute("email", user_id);
					session.setAttribute("name", name);
					session.setAttribute("type", type);
					session.setMaxInactiveInterval(600);
					if(type.equals("admin"))
					{
					page="admin.jsp?msg=success";
					}
					else
					{
						page="master.jsp?msg=success";
					}
				}
				else
				{
					 System.out.println("name1" +name);
					   System.out.println("user_id1" +user_id);
					page="error.jsp?msg=failed";
				}
				}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		response.sendRedirect(page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class AddUserServlet
 */
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String role = request.getParameter("type");
		String username = request.getParameter("un");
		HttpSession session = request.getSession();
		String c_user=(String)session.getAttribute("email");
		String page="";
	    try
			{
	    	if(email!=null)
	    	{
				Connection con=Dao.connect();
				 CallableStatement procinout = con.prepareCall("begin adduser(?,?,?,?); end;");
				 procinout.setString(1, role);
				 procinout.setString(2,email);
				 procinout.setString(3,username);
				 procinout.setString(4,c_user);
				 procinout.execute();
				
			     page="profile1.jsp?msg=userinserted";
	    	}
	    	else
	    	{
	    		page="error.jsp?msg=sessionerror";
	    	}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
		response.sendRedirect(page);
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

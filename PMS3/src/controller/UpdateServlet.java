package controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
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
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cn=Model.ConvertSpace(request.getParameter("cn"));
		String pn=Model.ConvertSpace(request.getParameter("pn"));
		String proj_m=Model.ConvertSpace(request.getParameter("proj_m"));
		String prog_m=Model.ConvertSpace(request.getParameter("prog_m"));
		int ors=Model.IntConverter(request.getParameter("ors"));
		int brs=Model.IntConverter(request.getParameter("brs"));
		int sp=Model.IntConverter(request.getParameter("sp"));
		String pc=Model.ConvertSpace(request.getParameter("pc"));
		int domain=Model.IntConverter(request.getParameter("domain"));
		int region= Model.IntConverter(request.getParameter("region"));
		int ps= Model.IntConverter(request.getParameter("ps"));
		int ptrack= Model.IntConverter(request.getParameter("ptrack"));
		String uat= Model.dateConverter(request.getParameter("uat"));
		String crp= Model.dateConverter(request.getParameter("crp"));
		String gld= Model.dateConverter(request.getParameter("gld"));
		String project_id=request.getParameter("id");
		HttpSession session = request.getSession();
		String email=(String)session.getAttribute("email");
		String page="";
		
		
	   
		 try
			{
			 if(email!=null){
				Connection con=Dao.connect();
				 CallableStatement procinout = con.prepareCall("begin updateProject(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;");
				 procinout.setString(1, project_id);
				 procinout.setString(2, pn);
				 procinout.setString(3, cn);
				 procinout.setInt(4, region);
				 procinout.setString(5, proj_m);
				 procinout.setString (6, prog_m);
				 procinout.setInt(7, ptrack);
				 procinout.setInt(8,ps);
				 procinout.setInt(9,domain);
				 procinout.setString(10,pc);
				 procinout.setInt(11,brs);
				 procinout.setString(12,crp);
				 procinout.setString(13,uat);
				 procinout.setString(14,gld);
				 procinout.setInt(15,sp);
				 procinout.setInt(16,ors);
				 procinout.setString(17,email);
				 procinout.execute();
				 procinout.close();
				 page="profile1.jsp?msg=projectupdate";
			 }
			 else{
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
		
		doGet(request, response);
	}

}

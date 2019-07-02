package controller;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.Dao;
import model.Model;
import java.text.SimpleDateFormat;  
import java.util.Date;  
/**
 * Servlet implementation class InsertServlet
 */
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
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
		String page="";
		HttpSession session = request.getSession();
		String email=(String)session.getAttribute("email");
		Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
	    String strDate= formatter.format(date);	
	   

	    try
			{
	    	if(email!=null){
				Connection con=Dao.connect();
				 CallableStatement procinout = con.prepareCall("begin insertProject(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;");
				 procinout.setString(1, pn);
				 procinout.setString(2, cn);
				 procinout.setInt(3, region);
				 procinout.setString(4, proj_m);
				 procinout.setString(5, prog_m);
				 procinout.setInt(6, ptrack);
				 procinout.setInt(7,ps);
				 procinout.setInt(8,domain);
				 procinout.setString(9,pc);
				 procinout.setInt(10,brs);
				 procinout.setString(11,crp);
				 procinout.setString(12,uat);
				 procinout.setString(13,gld);
				 procinout.setInt(14,sp);
				 procinout.setString(15,strDate);
				 System.out.println("email "+email);
				 procinout.setString(16,email);
				 procinout.setString(17,strDate);
				 procinout.setInt(18,ors);
				 procinout.execute();
				 procinout.close();
			     page="profile1.jsp?msg=projectInserted";
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

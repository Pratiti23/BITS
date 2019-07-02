package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import dao.Dao;
import model.Model;
@MultipartConfig(fileSizeThreshold=1024*1024*350)
/**
 * Servlet implementation class InsertReportServlet
 */
public class InsertReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String file_location="E:\\data\\";
		// ".\\..\\..\\WebContent\\WEB-INF\\lib\\data\\"
		MultipartRequest mreq = new MultipartRequest(request,file_location,1024*1024*250);
		String rn=Model.ConvertSpace(mreq.getParameter("rn"));
		String pf=Model.ConvertSpace(mreq.getParameter("pf"));
		int pn=Model.IntConverter(mreq.getParameter("pn"));
		String ecd=Model.dateConverter(mreq.getParameter("ecd"));
		int region= Model.IntConverter(mreq.getParameter("region"));
		int app= Model.IntConverter(mreq.getParameter("app"));
		int cso =Model.IntConverter(mreq.getParameter("cso"));
		int status =Model.IntConverter(mreq.getParameter("status"));
		int module=Model.IntConverter(mreq.getParameter("module"));
		int rc=Model.IntConverter(mreq.getParameter("rc"));
		int dc=Model.IntConverter(mreq.getParameter("dc"));
		String comments=Model.ConvertSpace(mreq.getParameter("comments"));
		int to= Model.IntConverter(mreq.getParameter("to"));
	    String fo= Model.ConvertSpace(mreq.getParameter("fo"));
		String rp= Model.ConvertSpace(mreq.getParameter("rp"));
		String stdc= Model.ConvertSpace(mreq.getParameter("stdc"));
		int rfs= Model.IntConverter(mreq.getParameter("rfs"));
		int it= Model.IntConverter(mreq.getParameter("it"));
		ArrayList<String> dt = new ArrayList<String>();
		if(mreq.getParameterValues("dt")!=null)
		{
		 dt = new ArrayList<String>(Arrays.asList(mreq.getParameterValues("dt")));
		}
		//file
		String rdf= Model.ConvertSpace(file_location+mreq.getOriginalFileName("rdf"));
		String sof= Model.ConvertSpace(file_location+mreq.getOriginalFileName("sof"));
		String qarf= Model.ConvertSpace(file_location+mreq.getOriginalFileName("qarf"));
		String dmf= Model.ConvertSpace(file_location+mreq.getOriginalFileName("dmf"));
		String ndrf=Model.ConvertSpace(file_location+mreq.getOriginalFileName("ndrf"));
		//activity
		String rrso="";
		String cdsbc="";
		String vrd="";
		String ftc="";
		String uatso="";
		String cc="";
		String mtp="";
		String page="";
		HttpSession session = request.getSession();
		String email=(String)session.getAttribute("email");
		
		Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
	    String strDate= formatter.format(date);	
	    if(dt.contains("rrso"))
	    {
	    	rrso=strDate;
	    }
	    if(dt.contains("cdsbc"))
	    {
	    	cdsbc=strDate;
	    }
	    if(dt.contains("vrd"))
	    {
	    	vrd=strDate;
	    }
	    if(dt.contains("ftc"))
	    {
	    	ftc=strDate;
	    }
	    if(dt.contains("uatso"))
	    {
	    	uatso=strDate;
	    }
	    if(dt.contains("cc"))
	    {
	    	cc=strDate;
	    }
	    if(dt.contains("mtp"))
	    {
	    	mtp=strDate;
	    }
	   
	    try
			{
	    	 if(email!=null){
				Connection con=Dao.connect();
				 CallableStatement procinout = con.prepareCall("begin insertDtl(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;");
				 procinout.setString(1,ecd);
				 procinout.setInt(2,region);
				 procinout.setInt(3,status);
				 procinout.setInt(4,module);
				 procinout.setInt(5,rc);
				 procinout.setString(6,pf);
				 procinout.setInt(7,it);
				 procinout.setString(8,comments);
				 procinout.setString (9,fo);
				 procinout.setInt(10,to);
				 procinout.setString(11,rp);
				 procinout.setInt(12,rfs);
				 procinout.setString(13,stdc);
				 procinout.setInt(14,dc);
				 procinout.setInt(15,app);
				 procinout.setInt(16,cso);
				 procinout.setString(17,rdf);
				 procinout.setString(18,sof);
				 procinout.setString(19,qarf);
				 procinout.setString(20,dmf);
				 procinout.setString(21,ndrf);
				 procinout.setString(22,email);
				
				 procinout.setInt(23,pn);//number
				 procinout.setString(24,rn);
				 procinout.setString(25,rrso);//varchar2
				 procinout.setString(26,cdsbc);
				 procinout.setString(27,vrd);
				 procinout.setString(28,ftc);
				 procinout.setString(29,uatso);
				 procinout.setString(30,cc);
				 procinout.setString(31,mtp);
				
				 procinout.registerOutParameter(32,Types.VARCHAR);
				 procinout.execute();
				 String name = procinout.getString(32);
				 //System.out.println("Task_number"+name);
				 System.out.println("Button "+mreq.getParameter("submit"));
				 procinout.close();
				 if(mreq.getParameter("submit").equals("SUBMIT"))
				 {
					 page="profile.jsp?taskno="+name; 
				 }
				 else
				 {
					 page="TaskTc.jsp?msg="+name;
				 }
				
			    
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

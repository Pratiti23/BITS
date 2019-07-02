package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import dao.Dao;
import model.Model;



/**
 * Servlet implementation class InsertTableColumnServlet
 */
public class InsertTableColumnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTableColumnServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Model m = new Model();
		 String page="Report_Table.jsp";
		
		String sql="";
		String taskid=request.getParameter("tn");
		String[] ar = taskid.split("_");
		System.out.println("task_id"+ar[2]);
		
		// TODO Auto-generated method stub
		int temp=Integer.parseInt(request.getParameter("id"));
		System.out.println("No. of fields "+temp);
		for(int i=1;i<temp;i++)
		{
			System.out.println("i before "+i);
			sql="insert into XXEVO_PM_OBJECT_TBL(object_id,task_id,object_name,column_name,object_description)values(OBJECT_SEQUENCE.NEXTVAL,"+ar[2]+",'"+request.getParameter(i+"")+"','"+request.getParameter((++i)+"")+"','"+request.getParameter((++i)+"")+"')";
			System.out.println("sql= "+sql);
			System.out.println("i after "+i);
			try {
				int j =Dao.register(sql,m);
				page="Report_Table.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			 	
			
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

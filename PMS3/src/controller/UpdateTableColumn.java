package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Model;

/**
 * Servlet implementation class UpdateTableColumn
 */
public class UpdateTableColumn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTableColumn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
 Model m = new Model();
 String page="";
		
String taskid=request.getParameter("tn");
String[] ar = taskid.split("_");
System.out.println(ar[2]);
// TODO Auto-generated method stub
int temp=Integer.parseInt(request.getParameter("id"));
System.out.println("temp "+temp);
		String sql="delete from XXEVO_PM_OBJECT_TBL where task_id="+ar[2];
		System.out.println("sql "+sql);
		try {
		int j =Dao.register(sql,m);
		System.out.println("j "+j);
		for(int i=1;i<temp;i++)
		{
			System.out.println("In loop");
			
			sql="insert into XXEVO_PM_OBJECT_TBL(object_id,task_id,object_name,column_name,object_description)values(OBJECT_SEQUENCE.NEXTVAL,"+ar[2]+",'"+request.getParameter(i+"")+"','"+request.getParameter((++i)+"")+"','"+request.getParameter((++i)+"")+"')";
			System.out.println("i="+i);
			int j1 =Dao.register(sql,m);		
			} 
		 page="Report_Table.jsp";
		
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
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

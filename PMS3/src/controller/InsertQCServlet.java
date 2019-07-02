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
 * Servlet implementation class InsertQCServlet
 */
public class InsertQCServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQCServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String sql_delete="delete from xxevo_pm_qc_dtl_tbl where task_id="+request.getParameter("task");
	int k =Model.IntConverter(request.getParameter("i"));
	Model m = new Model();
	System.out.println("k"+k);
	try {
		int i = Dao.register(sql_delete, m);
		for(int j=1;j<=k;j++)
		{
			if(!(j==2||j==21|| j==53||j==54||j==55||j==56||j==57||j==58||j==59||j==60||j==61||j==62||j==63||j==64||j==65||j==66||j==67||j==69))
		{
			Dao.register("insert into xxevo_pm_qc_dtl_tbl(qc_detail_id,task_id,seq_no,result,comments) values(QC_TABLE_SEQ.nextval,'"+request.getParameter("task")+"','"+j+"','"+request.getParameter(j+"a")+"','"+Model.ConvertSpace(request.getParameter(j+"b").trim())+"')", m);
		}
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
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

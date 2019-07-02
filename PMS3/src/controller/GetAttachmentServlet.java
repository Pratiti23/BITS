package controller;

import dao.Dao;
import model.Model;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class GetAttachmentServlet
 */
public class GetAttachmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAttachmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String str=request.getParameter("msg");
		System.out.println("File name "+str);
		 String filePath=request.getParameter("msg");
		 String temp[] =filePath.split("\\\\");
		 File downloadFile = new File(filePath);
	for(int i=0;i<temp.length;i++){
		System.out.println("temp "+temp[i]);
	}
			if(!downloadFile.exists()){
				throw new ServletException("File doesn't exists on server.");
			}
			System.out.println("File location on server::"+downloadFile.getAbsolutePath());
			ServletContext ctx = getServletContext();
			InputStream fis = new FileInputStream(downloadFile);
			String mimeType = ctx.getMimeType(downloadFile.getAbsolutePath());
			response.setContentType(mimeType != null? mimeType:"application/octet-stream");
			response.setContentLength((int) downloadFile.length());
			response.setHeader("Content-Disposition", "attachment; filename=\"" + temp[temp.length-1] + "\"");
			
			ServletOutputStream os = response.getOutputStream();
			byte[] bufferData = new byte[1024];
			int read=0;
			while((read = fis.read(bufferData))!= -1){
				os.write(bufferData, 0, read);
			}
			os.flush();
			os.close();
			fis.close();
			System.out.println("File downloaded at client successfully");
			}
			
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

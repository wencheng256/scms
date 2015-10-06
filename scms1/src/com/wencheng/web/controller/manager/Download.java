package com.wencheng.web.controller.manager;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.dao.ObjectDao;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.domain.Export;

public class Download extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Download() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		response.setContentType("application/zip");
		ObjectDao<Export> dao = new ObjectDaoImpl<Export>();
		Export ex = dao.find(Export.class, Integer.parseInt(id));
		response.setHeader("Content-Disposition", "attachment; filename="+ex.getName()+".zip");
		ServletOutputStream out = response.getOutputStream();
		if(id != null){
			try{
				FileInputStream in = new FileInputStream(ex.getPath());
				byte[] b = new byte[1024];
				int length = 0;
				while((length = in.read(b))>0){
					out.write(b,0,length);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		out.println("<html>");
		out.println("<script>");
		out.println("window.close()");
		out.println("</script>");
		out.println("</html>");
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doGet
		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

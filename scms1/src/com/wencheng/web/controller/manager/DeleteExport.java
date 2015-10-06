package com.wencheng.web.controller.manager;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.dao.ObjectDao;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.domain.Export;

public class DeleteExport extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteExport() {
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
		if(id == null){
			response.sendRedirect(request.getContextPath()+"/manager/export");
			return;
		}else{
			ObjectDao<Export> dao = new ObjectDaoImpl<Export>();
			Export find = dao.find(Export.class, Integer.parseInt(id));
			String path = find.getPath();
			if(path!=null){
				File f = new File(path);
				if(f.exists()){
					f.delete();
				}
			}
			dao.delete(Export.class, Integer.parseInt(id));
			response.sendRedirect(request.getContextPath()+"/manager/export");
		}
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

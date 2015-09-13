package com.wencheng.web.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.service.JournalService;
import com.wencheng.service.impl.JournalServiceImpl;

public class DeleteJournalAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteJournalAction() {
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
		JournalService js = new JournalServiceImpl();
		int status = js.delete(request);
		switch(status){
		case 0:
			response.sendRedirect(request.getContextPath()+"/student/journallist?errormessage="+URLEncoder.encode("已经移至回收站！","UTF-8"));
			return;
		case 1:
			response.sendRedirect(request.getContextPath()+"/student/journallist?errormessage="+URLEncoder.encode("删除成功!","UTF-8"));
			return;
		default:
			response.sendRedirect(request.getContextPath()+"/student/journallist?errormessage="+URLEncoder.encode("删除失败！","UTF-8"));
			return;
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

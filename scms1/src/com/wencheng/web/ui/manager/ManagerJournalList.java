package com.wencheng.web.ui.manager;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.domain.Journal;
import com.wencheng.service.JournalService;
import com.wencheng.service.JournalTypeService;
import com.wencheng.service.impl.JournalServiceImpl;
import com.wencheng.service.impl.JournalTypeServiceImpl;

public class ManagerJournalList extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ManagerJournalList() {
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
		request.setAttribute("id", id);
		JournalTypeService jt = new JournalTypeServiceImpl();
		JournalService js = new JournalServiceImpl();
		List<Journal> journals = js.listManager(request);
		request.setAttribute("journals", journals);
		String message = request.getParameter("errormessage");
		if(message != null){
			request.setAttribute("message", URLDecoder.decode(message,"UTF-8"));
		}
		request.setAttribute("type", jt.list());
		//dispatcher
		request.getRequestDispatcher("/WEB-INF/views/upper/manager/projectjournal.jsp").forward(request, response);
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

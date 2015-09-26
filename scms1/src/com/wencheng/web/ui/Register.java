package com.wencheng.web.ui;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.domain.ProjectLevel;
import com.wencheng.domain.School;
import com.wencheng.service.ProjectLevelService;
import com.wencheng.service.SchoolService;
import com.wencheng.service.impl.ProjectLevelServiceImpl;
import com.wencheng.service.impl.SchoolServiceImpl;

public class Register extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Register() {
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
		//dispatcher
		SchoolService ss = new SchoolServiceImpl();
		ProjectLevelService ps = new ProjectLevelServiceImpl();
		List<School> school = ss.list();
		List<ProjectLevel> level = ps.list();
		String message = request.getParameter("errormessage");
		if(message != null){
			request.setAttribute("message", URLDecoder.decode(message, "utf-8"));
		}
		request.setAttribute("version",new Date().toString());
		request.setAttribute("school", school);
		request.setAttribute("level", level);
		request.getRequestDispatcher("/WEB-INF/views/upper/register.jsp").forward(request, response);
		
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

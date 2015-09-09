package com.wencheng.web.ui;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.domain.School;
import com.wencheng.domain.Student;
import com.wencheng.service.SchoolService;
import com.wencheng.service.StudentService;
import com.wencheng.service.impl.SchoolServiceImpl;
import com.wencheng.service.impl.StudentServiceImpl;

public class ProjectTeam extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProjectTeam() {
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
		StudentService ss = new StudentServiceImpl();
		SchoolService ss1 = new SchoolServiceImpl();
		List<School> list = ss1.list();
		request.setAttribute("school", list);
		List<Student> students= ss.list(request);
		String error = request.getParameter("errormessage");
		if(error != null){
			error = URLDecoder.decode(error, "UTF-8");
			request.setAttribute("errormessage",error);
		}
		request.setAttribute("students", students);
		request.setAttribute("version",new Date());
		request.getRequestDispatcher("/WEB-INF/views/upper/student/team.jsp").forward(request, response);
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

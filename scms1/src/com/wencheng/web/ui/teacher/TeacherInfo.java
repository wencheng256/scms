package com.wencheng.web.ui.teacher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.domain.School;
import com.wencheng.domain.Teacher;
import com.wencheng.service.SchoolService;
import com.wencheng.service.TeacherService;
import com.wencheng.service.impl.SchoolServiceImpl;
import com.wencheng.service.impl.TeacherServiceImpl;

public class TeacherInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TeacherInfo() {
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

		SchoolService ss = new SchoolServiceImpl();
		List<School> schools = ss.list();
		request.setAttribute("school", schools);
		
		TeacherService ts = new TeacherServiceImpl();
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		Teacher t1 = ts.find(t.getId());
		request.setAttribute("teacher", t1);
		
		//dispatcher
		request.getRequestDispatcher("/WEB-INF/views/upper/teacher/info.jsp").forward(request, response);
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

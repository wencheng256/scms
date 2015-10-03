package com.wencheng.web.ui.teacher;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.domain.Message;
import com.wencheng.domain.Project;
import com.wencheng.service.MessageService;
import com.wencheng.service.impl.MessageServiceImpl;
import com.wencheng.service.impl.ProjectServiceImpl;

public class TeacherMessage extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TeacherMessage() {
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
			response.sendRedirect(request.getContextPath()+"/error");
			return;
		}
		request.setAttribute("id", id);
		MessageService ms = new MessageServiceImpl();
		ProjectServiceImpl ps = new ProjectServiceImpl();
		List<Message> messages = ms.listother(request);
		Project op = ps.findOther(request);
		request.setAttribute("messages", messages);
		request.setAttribute("version", new Date());
		request.setAttribute("other", op);
		
		
		//dispatcher
		request.getRequestDispatcher("/WEB-INF/views/upper/teacher/othermessage.jsp").forward(request, response);
	
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

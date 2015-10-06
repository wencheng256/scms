package com.wencheng.web.controller.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.dao.impl.NewsDaoImpl;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.domain.News;
import com.wencheng.utils.WebUtils;

public class ManagerEditor extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ManagerEditor() {
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
		NewsDaoImpl dao = new NewsDaoImpl();
		ObjectDaoImpl odao = new ObjectDaoImpl();
		String id = request.getParameter("id");
		if(id == null){
			request.getRequestDispatcher(request.getContextPath()+"/manager/newsaction").forward(request, response);
			return;
		}
		News bean = dao.find(News.class, Integer.parseInt(id));
		WebUtils.getBean(bean, request);
		odao.update(bean);
		response.sendRedirect(request.getContextPath()+"/manager/mynews");
		return;
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

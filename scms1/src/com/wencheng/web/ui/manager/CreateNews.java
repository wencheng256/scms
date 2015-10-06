package com.wencheng.web.ui.manager;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.dao.ObjectDao;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.domain.Manager;
import com.wencheng.domain.News;

public class CreateNews extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CreateNews() {
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
		ObjectDaoImpl dao1 = new ObjectDaoImpl();
		Manager m = (Manager) request.getSession().getAttribute("manager");
		Manager m1 = (Manager) dao1.find(Manager.class, m.getId());
		request.setAttribute("manager", m1);
		if(id != null){
			ObjectDao<News> dao = new ObjectDaoImpl<News>();
			News news = dao.find(News.class,Integer.parseInt(id));
			request.setAttribute("news", news);
		}
		request.setAttribute("version",new Date());
		//dispatcher
		request.getRequestDispatcher("/WEB-INF/views/upper/manager/createnews.jsp").forward(request, response);
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

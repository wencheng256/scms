package com.wencheng.web.ui.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.dao.impl.ManagerDaoImpl;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.domain.Manager;
import com.wencheng.domain.Project;
import com.wencheng.utils.PageUtils;

public class CheckManager extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CheckManager() {
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
		String page = request.getParameter("page");
		int start,rows = 20,pagecount;
		Manager m = (Manager) request.getSession().getAttribute("manager");
		m = (Manager) new ObjectDaoImpl().find(Manager.class, m.getId());
		PageUtils pageUtils = new PageUtils(rows);
		if(page == null){
			page = "1";
			start = 0;
		}else{
			start = pageUtils.getStart(Integer.parseInt(page));
		}
		new ManagerDaoImpl();
		pagecount = ps.getRows();
		int pagenum = pageUtils.getPageCount(pagecount);
		List<Project> list = null;
		list = ps.list( start,rows);
		request.setAttribute("projects", list);
		request.setAttribute("nowpage", Integer.parseInt(page));
		request.setAttribute("pages", pagenum);
		//dispatcher
		request.getRequestDispatcher("/WEB-INF/views/upper/manager/checkmanager.jsp").forward(request, response);
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

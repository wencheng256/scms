package com.wencheng.web.controller.manager;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.dao.impl.NewsDaoImpl;
import com.wencheng.domain.News;
import com.wencheng.utils.WebUtils;

public class NewsAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public NewsAction() {
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
		News bean = new News();
		WebUtils.getBean(bean, request);
		String id = request.getParameter("managerid");
		String id1 = request.getParameter("schoolid");
		if(id == null || WebUtils.isSubmit(request)){
			response.sendRedirect(request.getContextPath()+"/manager/createnews?errormessage="+URLEncoder.encode("创建失败","utf-8"));
			return;
		}
		if(dao.create(bean, Integer.parseInt(id),id1)){
			response.sendRedirect(request.getContextPath()+"/manager/mynews");
			return;
		}else{
			response.sendRedirect(request.getContextPath()+"/manager/createnews?errormessage="+URLEncoder.encode("创建失败","utf-8"));
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

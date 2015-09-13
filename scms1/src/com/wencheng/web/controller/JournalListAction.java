package com.wencheng.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wencheng.domain.Journal;
import com.wencheng.service.JournalService;
import com.wencheng.service.impl.JournalServiceImpl;

public class JournalListAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public JournalListAction() {
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
		response.setHeader("Content-Type", "application/json");
		
		SimpleDateFormat sf = new SimpleDateFormat("YY-MM-dd");
		
		JournalService js = new JournalServiceImpl();
		List<Journal> list = js.list(request);
		JSONArray ja = new JSONArray();
		Iterator<Journal> it = list.iterator();
		while(it.hasNext()){
			Journal jou = it.next();
			jou.setProject(null);
			JSONObject jo1 = new JSONObject();
			jo1.put("title", jou.getTitle());
			jo1.put("type", jou.getType().getName());
			jo1.put("id", jou.getId());
			jo1.put("status", jou.getStatus());
			jo1.put("time", sf.format(jou.getTime()));
			ja.add(jo1);
		}
		
		response.getWriter().print(ja.toString());
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

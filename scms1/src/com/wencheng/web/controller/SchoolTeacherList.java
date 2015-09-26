package com.wencheng.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wencheng.domain.Teacher;
import com.wencheng.service.TeacherService;
import com.wencheng.service.impl.TeacherServiceImpl;

public class SchoolTeacherList extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SchoolTeacherList() {
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

		TeacherService ts = new TeacherServiceImpl();
		List<Teacher> ls = ts.listSchool(request);
		JSONArray ja;
		JSONObject jo = new JSONObject();
		if(ls != null){
			jo.put("result", true);
			ja = JSONArray.fromObject(ls);
			jo.put("value", ja);
		}else{
			jo.put("result", false);
		}
		response.setHeader("Content-Type", "application/json");
		PrintWriter out = response.getWriter();
		out.print(jo);
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

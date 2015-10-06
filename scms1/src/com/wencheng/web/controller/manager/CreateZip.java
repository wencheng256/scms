package com.wencheng.web.controller.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.domain.Export;
import com.wencheng.utils.CreatePackage;
import com.wencheng.utils.HibernateUtil;

public class CreateZip extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CreateZip() {
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
	public void doGet(final HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String grade = request.getParameter("grade");
		if(grade == null){
			response.sendRedirect(request.getContextPath()+"/manager/export");
			return;
		}
		final String base = request.getServletContext().getRealPath("");
		Thread th1 = new Thread(new Runnable(){
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				String name = null;
				Export ex = new Export();
				boolean status = true;
				try{
					name = CreatePackage.createPackage(base, grade);
				}catch(Exception e){
					status = false;
					StringWriter writer = new StringWriter();
					PrintWriter w = new PrintWriter(writer);
					e.printStackTrace();
					e.printStackTrace(w);
					w.close();
					ex.setErrormessage(writer.toString());
					try {
						writer.close();
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}finally{
					HibernateUtil.closeSession();
				}
				ex.setIntroduce(request.getParameter("introduce"));
				ex.setName(""+new Random().nextInt(10000));
				ex.setPath(name);
				ex.setStatus(status);
				ObjectDaoImpl<Export> obj = new ObjectDaoImpl<Export>();
				obj.create(ex);
			}
			
		});
		th1.start();
		try {
			th1.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/manager/export");
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

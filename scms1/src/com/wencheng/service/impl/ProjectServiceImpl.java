package com.wencheng.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.wencheng.dao.ObjectDao;
import com.wencheng.dao.ProjectDao;
import com.wencheng.dao.PropertiesDao;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.dao.impl.ProjectDaoImpl;
import com.wencheng.dao.impl.PropertiesDaoImpl;
import com.wencheng.domain.Account;
import com.wencheng.domain.Project;
import com.wencheng.domain.Teacher;
import com.wencheng.service.ProjectService;
import com.wencheng.utils.WebUtils;

public class ProjectServiceImpl implements ProjectService{

	private ProjectDao dao = new ProjectDaoImpl();
	private PropertiesDao prop = new PropertiesDaoImpl();
	private ObjectDao<Account> daoAccount = new ObjectDaoImpl<Account>();
	
	@Override
	public boolean create(HttpServletRequest request) {
		// TODO Auto-generated method stub
		boolean success = false;
		if(WebUtils.isSubmit(request)){
			return false;
		}
		PropertiesDaoImpl prop = new PropertiesDaoImpl();
		Account account = new Account();
		Project project = new Project();
		WebUtils.getBean(project, request);
		project.setStartingTime(new Date());
		project.setGrade(Integer.parseInt(prop.get("grade")));
		success = dao.create(project);
		WebUtils.getBean(account,request);
		account.setPassword(WebUtils.MD5(account.getPassword()));
		account.setProject(project);
		success = daoAccount.create(account);
		return success;
	}

	@Override
	public boolean delete() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkName(HttpServletRequest request) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(request.getParameter("name") == null||request.getParameter("name") == ""){
			return false;
		}
		return dao.checkName(request.getParameter("name"));
	}

	@Override
	public boolean checkNum(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String number = request.getParameter("number");
		System.out.println(number);
		ProjectDao dao = new ProjectDaoImpl();
		if(number == null || number == ""){
			return false;
		}
		return dao.checkNumber(number);
	}

	@Override
	public Project find(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Integer id =  (Integer) request.getSession().getAttribute("login");
		if(id == null){
			return null;
		}
		return dao.find(Project.class, id);
	}

	@Override
	public List<Project> list(int start,int rows) {
		String grade = prop.get("grade");
		return dao.list(Integer.parseInt(grade),start,rows);
	}

	@Override
	public int getRows() {
		// TODO Auto-generated method stub
		String grade = prop.get("grade");
		long rows = dao.getRows(Integer.parseInt(grade));
		return (int)rows;
	}

	@Override
	public Project findProject(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer id = (Integer) session.getAttribute("login");
		return dao.findProject(id);
	}

	@Override
	public boolean addTeacher(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String teacher = request.getParameter("teacherid");
		if(teacher == null)
			return false;
		HttpSession session = request.getSession();
		Project pro = (Project) session.getAttribute("project");
		return dao.addTeacher(Integer.parseInt(teacher), pro.getId());
	}

	@Override
	public Project findOther(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(id == null || id.equals("null")){
			return null;
		}
		return dao.findProject(Integer.parseInt(id));
	}

	@Override
	public List<Project> listTeacher(HttpServletRequest request,int start, int rows) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Teacher t = (Teacher) session.getAttribute("teacher");
		String grade = prop.get("grade");
		return dao.listTeacher(Integer.parseInt(grade),start,rows,t.getId());
	}

	@Override
	public int getTeacherRows(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String grade = prop.get("grade");
		HttpSession session = request.getSession();
		Teacher t = (Teacher) session.getAttribute("teacher");
		long rows = dao.getTeacherRows(Integer.parseInt(grade), t.getId());
		return (int)rows;
	}

	@Override
	public List<String> getGrades() {
		// TODO Auto-generated method stub
		return dao.getGrades();
	}
	public List<Map<String,String>> getGradesMap() {
		// TODO Auto-generated method stub
		return dao.getGradesMap();
	}

	@Override
	public List<Project> listSchool(int school, int start, int rows) {
		// TODO Auto-generated method stub
		String grade = prop.get("grade");
		return dao.listSchool(school,Integer.parseInt(grade),start,rows);
	}
}

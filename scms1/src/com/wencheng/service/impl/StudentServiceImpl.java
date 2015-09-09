package com.wencheng.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.StudentDao;
import com.wencheng.dao.impl.StudentDaoImpl;
import com.wencheng.domain.Project;
import com.wencheng.domain.Student;
import com.wencheng.service.StudentService;
import com.wencheng.utils.WebUtils;

public class StudentServiceImpl implements StudentService {
	
	private StudentDao dao = new StudentDaoImpl();
	@Override
	public boolean create(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		Student stu = new Student();
		WebUtils.getBean(stu, request);
		String id = request.getParameter("pro");
		if(id == null){
			return false;
		}
		String sid = request.getParameter("schoolid");
		if(sid == null){
			return false;
		}
		return dao.create(stu,Integer.parseInt(id),Integer.parseInt(sid));
	}
	public List<Student> list(HttpServletRequest request){
		int id = ((Project) request.getSession().getAttribute("project")).getId();
		return dao.list(id);
	}
	@Override
	public boolean mkcaptain(HttpServletRequest request) {
		String id = request.getParameter("id");
		if(id == null){
			return false;
		}
		return dao.mkcaptain(Integer.parseInt(id), ((Project)request.getSession().getAttribute("project")).getId());
	}
	
	@Override
	public boolean delete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(id == null){
			return false;
		}
		return dao.delete(Student.class, Integer.parseInt(id));
	}
	
}

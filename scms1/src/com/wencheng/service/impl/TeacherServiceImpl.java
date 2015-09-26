package com.wencheng.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.ObjectDao;
import com.wencheng.dao.TeacherDao;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.dao.impl.TeacherDaoImpl;
import com.wencheng.domain.Project;
import com.wencheng.domain.School;
import com.wencheng.domain.Teacher;
import com.wencheng.service.TeacherService;
import com.wencheng.utils.WebUtils;

public class TeacherServiceImpl implements TeacherService {

	private TeacherDao dao = new TeacherDaoImpl();
	private ObjectDao<School> odao = new ObjectDaoImpl<School>();
	@Override
	public boolean create(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Teacher teacher = new Teacher();
		WebUtils.getBean(teacher, request);
		String schoolid = request.getParameter("schoolid");
		if(schoolid == null){
			return false;
		}
		School school = odao.find(School.class, Integer.parseInt(schoolid));
		teacher.setSchool(school);
		return dao.create(teacher);
	}
	@Override
	public boolean checkUsername(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		if(username == "null" || username == ""){
			return false;
		}else{
		}
		return false;
	}
	@Override
	public List<Teacher> listSchool(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String school = request.getParameter("school");
		if(school == null)
			return null;
		return dao.listSchool(Integer.parseInt(school));
	}
	@Override
	public Object[] listProject(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Project pro = (Project) request.getSession().getAttribute("project");
		return dao.listProject(pro.getId());
	}
}

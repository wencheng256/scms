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
		teacher.setPassword(WebUtils.MD5(teacher.getPassword()));
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
	public Teacher listProject(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Project pro = (Project) request.getSession().getAttribute("project");
		return dao.listProject(pro.getId());
	}
	@Override
	public boolean isLogin(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String name = request.getParameter("username");
		String password  = WebUtils.MD5(request.getParameter("password"));
		Teacher teacher = dao.verified(name, password);
		if(teacher != null){
			request.getSession().setAttribute("teacher", teacher);
			return true;
		}
		return false;
	}
	@Override
	public Teacher find(int id) {
		// TODO Auto-generated method stub
		return dao.find(id);
	}
	@Override
	public boolean update(HttpServletRequest request) {
		// TODO Auto-generated method stub
		if(WebUtils.isSubmit(request)){
			return false;
		}
		String id = request.getParameter("teacherid");
		if(id == null){
			return false;
		}
		String schoolid = request.getParameter("schoolid");
		if(schoolid == null){
			return false;
		}
		School school = odao.find(School.class, Integer.parseInt(schoolid));
		String newpass = request.getParameter("newpassword");
		Teacher bean = dao.find(Integer.parseInt(id));
		bean.setSchool(school);
		if(!newpass.equals("#unmodified")){
			bean.setPassword(WebUtils.MD5(newpass));
		}
		WebUtils.getBean(bean, request);
		return dao.update(bean);
	}
}

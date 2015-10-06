package com.wencheng.service.impl;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.ManagerDao;
import com.wencheng.dao.ObjectDao;
import com.wencheng.dao.impl.ManagerDaoImpl;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.domain.Manager;
import com.wencheng.domain.School;
import com.wencheng.service.ManagerService;
import com.wencheng.utils.WebUtils;

public class ManagerServiceImpl implements ManagerService{

	private ManagerDao dao = new ManagerDaoImpl();
	private ObjectDao<School> sdao = new ObjectDaoImpl<School>();
	@Override
	public boolean checkUserName(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String pa = request.getParameter("username");
		if(pa == null){
			return false;
		}
		return dao.findByName(pa);
	}
	@Override
	public boolean create(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Manager bean = new Manager();
		WebUtils.getBean(bean, request);
		String s = request.getParameter("schoolid");
		if(s != null){
			bean.setSchool(sdao.find(School.class, Integer.parseInt(s)));
		}
		if(bean.getPassword()!= null){
			bean.setPassword(WebUtils.MD5(bean.getPassword()));
		}else{
			return false;
		}
		if(dao.create(bean)){
			return true;
		}else{
			return false;
		}
		
	}
	@Override
	public boolean verify(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		if(name == null || pass == null){
			return false;
		}
		pass = WebUtils.MD5(pass);
		Manager manager = dao.verify(name, pass);
		if(manager != null){
			request.getSession().setAttribute("manager",manager);
			return true;
		}else{
			return false;
		}
	}

}

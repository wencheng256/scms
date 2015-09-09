package com.wencheng.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.ObjectDao;
import com.wencheng.dao.ProjectDao;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.dao.impl.ProjectDaoImpl;
import com.wencheng.domain.Account;
import com.wencheng.domain.Project;
import com.wencheng.service.ProjectService;
import com.wencheng.utils.WebUtils;

public class ProjectServiceImpl implements ProjectService{

	private ProjectDao dao = new ProjectDaoImpl();
	private ObjectDao<Account> daoAccount = new ObjectDaoImpl<Account>();
	
	@Override
	public boolean create(HttpServletRequest request) {
		// TODO Auto-generated method stub
		boolean success = false;
		if(WebUtils.isSubmit(request)){
			return false;
		}
		Account account = new Account();
		Project project = new Project();
		WebUtils.getBean(project, request);
		project.setStartingTime(new Date());
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
	
}

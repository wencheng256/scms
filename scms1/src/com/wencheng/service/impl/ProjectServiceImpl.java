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
		Account account = new Account();
		Project project = new Project();
		WebUtils.getBean(project, request);
		project.setStartingTime(new Date());
		success = dao.create(project);
		WebUtils.getBean(account,request);
		account.setProject(project);
		success = daoAccount.create(account);
		if(success){
			request.getSession().setAttribute("login",true);
		}else{
			request.getSession().setAttribute("login",null);
		}
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
	
}

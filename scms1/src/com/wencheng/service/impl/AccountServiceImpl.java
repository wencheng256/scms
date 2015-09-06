package com.wencheng.service.impl;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.AccountDao;
import com.wencheng.dao.impl.AccountDaoImpl;
import com.wencheng.domain.Account;
import com.wencheng.service.AccountService;
import com.wencheng.utils.WebUtils;

public class AccountServiceImpl implements AccountService {

	AccountDao dao = new AccountDaoImpl();
	@Override
	public boolean checkUsername(HttpServletRequest request) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(request.getParameter("username"));
		if(request.getParameter("username") == null ||request.getParameter("username") == ""){
			return false;
		}
		return dao.checkUsername(request.getParameter("username"));
	}
	@Override
	public boolean login(HttpServletRequest request) {
		// TODO Auto-generated method stub
		AccountDao dao = new AccountDaoImpl();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username == null || password == null){
			return false;
		}
		Account a = dao.login(username, WebUtils.MD5(password));
		if(a!=null){
			request.getSession().setAttribute("login", Integer.valueOf(a.getProject().getId()));
			return true;
		}else{
			request.getSession().setAttribute("login", null);
			return false;
		}
	}

	
}

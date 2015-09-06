package com.wencheng.service.impl;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.AccountDao;
import com.wencheng.dao.impl.AccountDaoImpl;
import com.wencheng.service.AccountService;

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

}

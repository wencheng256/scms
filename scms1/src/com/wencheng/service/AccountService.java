package com.wencheng.service;

import javax.servlet.http.HttpServletRequest;

public interface AccountService {

	public boolean checkUsername(HttpServletRequest request);
	public boolean login(HttpServletRequest request);
	
}

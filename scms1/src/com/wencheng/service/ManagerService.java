package com.wencheng.service;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.Manager;

public interface ManagerService {
	
	public boolean checkUserName(HttpServletRequest request);
	public boolean create(HttpServletRequest request);
	public boolean verify(HttpServletRequest request);
	

}

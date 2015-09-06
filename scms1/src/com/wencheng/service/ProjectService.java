package com.wencheng.service;

import javax.servlet.http.HttpServletRequest;

public interface ProjectService {
	
	public boolean create(HttpServletRequest request);
	public boolean delete();
	public boolean checkName(HttpServletRequest request);
	public boolean checkNum(HttpServletRequest request);
	
}

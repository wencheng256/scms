package com.wencheng.service;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.Project;

public interface ProjectService {
	
	public boolean create(HttpServletRequest request);
	public boolean delete();
	public boolean checkName(HttpServletRequest request);
	public boolean checkNum(HttpServletRequest request);
	public Project find(HttpServletRequest request);
	
}

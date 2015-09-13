package com.wencheng.service;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.ApplicationReport;

public interface ApplicationService {
	
	public boolean create(HttpServletRequest request);
	public ApplicationReport find(HttpServletRequest request);

}

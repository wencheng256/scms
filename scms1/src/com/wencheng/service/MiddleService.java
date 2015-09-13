package com.wencheng.service;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.MiddleReport;

public interface MiddleService {
	
	public boolean create(HttpServletRequest request);
	public MiddleReport find(HttpServletRequest request);

}

package com.wencheng.service;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.EndReport;

public interface EndService {
	
	public boolean create(HttpServletRequest request);
	public EndReport find(HttpServletRequest request);
	public EndReport findOther(HttpServletRequest request);

}

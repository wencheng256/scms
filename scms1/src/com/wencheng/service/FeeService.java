package com.wencheng.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.Fee;

public interface FeeService {
	
	public boolean create(HttpServletRequest request);
	public List<Fee> list(HttpServletRequest request);
	public boolean delete(HttpServletRequest request);

}

package com.wencheng.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.Journal;

public interface JournalService {
	
	public boolean create(HttpServletRequest request);
	public List<Journal> list(HttpServletRequest request);
	public List<Journal> listOther(HttpServletRequest request);
	public Journal find(HttpServletRequest request);
	public Journal findOther(HttpServletRequest request);
	public boolean update(HttpServletRequest request);
	public int delete(HttpServletRequest request);
	
}

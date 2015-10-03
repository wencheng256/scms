package com.wencheng.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.Message;

public interface MessageService {
	
	public List<Message> list(HttpServletRequest request);
	public List<Message> listother(HttpServletRequest request);
	public boolean create(HttpServletRequest request);
	public boolean delete(HttpServletRequest request);

}

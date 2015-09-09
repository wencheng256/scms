package com.wencheng.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.Student;

public interface StudentService {

	public boolean create(HttpServletRequest request);
	public List<Student> list(HttpServletRequest request);
	public boolean mkcaptain(HttpServletRequest request);
	public boolean delete(HttpServletRequest request);
	
}

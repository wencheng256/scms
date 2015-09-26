package com.wencheng.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.Teacher;

public interface TeacherService {
	
	public boolean create(HttpServletRequest request);
	public boolean checkUsername(HttpServletRequest request);
	public List<Teacher> listSchool(HttpServletRequest request);
	public Object[] listProject(HttpServletRequest request);
}

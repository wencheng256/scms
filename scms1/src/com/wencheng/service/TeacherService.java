package com.wencheng.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.Teacher;

public interface TeacherService {
	
	public boolean create(HttpServletRequest request);
	public boolean update(HttpServletRequest request);
	public boolean checkUsername(HttpServletRequest request);
	public Teacher find(int id);
	public List<Teacher> listSchool(HttpServletRequest request);
	public Teacher listProject(HttpServletRequest request);
	public boolean isLogin(HttpServletRequest request);
}

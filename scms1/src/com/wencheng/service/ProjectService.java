package com.wencheng.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.domain.Project;

public interface ProjectService {
	
	public boolean create(HttpServletRequest request);
	public boolean delete();
	public boolean checkName(HttpServletRequest request);
	public boolean checkNum(HttpServletRequest request);
	public Project find(HttpServletRequest request);
	public List<Project> list(int start,int rows);
	public List<Project> listTeacher(HttpServletRequest request,int start,int rows);
	public int getRows();
	public int getTeacherRows(HttpServletRequest request);
	public Project findProject(HttpServletRequest request);
	public boolean addTeacher(HttpServletRequest request);
	public Project findOther(HttpServletRequest request);
}

package com.wencheng.dao;

import java.util.List;

import com.wencheng.domain.Project;


public interface ProjectDao extends ObjectDao<Project> {
	
	public boolean checkName(String name);
	public boolean checkNumber(String number);
	public List<Project> list(int grade,int start,int rows);
	public List<Project> listTeacher(int grade,int start,int rows,int teacher);
	public long getRows(int grade);
	public long getTeacherRows(int grade,int teacher);
	public Project findProject(int id);
	public boolean addTeacher(int teacher,int project);
}

package com.wencheng.dao;

import java.util.List;
import java.util.Map;

import com.wencheng.domain.Project;


public interface ProjectDao extends ObjectDao<Project> {
	
	public boolean checkName(String name);
	public boolean checkNumber(String number);
	public List<Project> list(int grade,int start,int rows);
	public List<Project> listSchool(int school,int grade,int start,int rows);
	public List<Project> list(int grade);
	public List<Project> listTeacher(int grade,int start,int rows,int teacher);
	public long getRows(int grade);
	public long getTeacherRows(int grade,int teacher);
	public Project findProject(int id);
	public boolean addTeacher(int teacher,int project);
	public List<String> getGrades();
	public List<Map<String,String>> getGradesMap();
}

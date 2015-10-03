package com.wencheng.dao;

import java.util.List;

import com.wencheng.domain.School;
import com.wencheng.domain.Teacher;

public interface TeacherDao extends ObjectDao<Teacher>{
	
	public boolean checkUsername(String username);
	public List<Teacher> listSchool(int school);
	public Object[] listProject(int school);
	public Teacher verified(String username,String password);
	public Teacher find(int id);

}

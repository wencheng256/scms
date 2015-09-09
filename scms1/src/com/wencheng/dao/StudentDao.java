package com.wencheng.dao;

import java.util.List;

import com.wencheng.domain.Student;

public interface StudentDao extends ObjectDao<Student> {

	public boolean create(Student domain,int project,int school);
	public List<Student> list(int project) ;
	public boolean mkcaptain(int id,int project);
}

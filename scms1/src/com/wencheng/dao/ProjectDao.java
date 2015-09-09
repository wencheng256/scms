package com.wencheng.dao;

import com.wencheng.domain.Project;


public interface ProjectDao extends ObjectDao<Project> {
	
	public boolean checkName(String name);
	public boolean checkNumber(String number);
}

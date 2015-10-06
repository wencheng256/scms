package com.wencheng.dao;

import com.wencheng.domain.Manager;

public interface ManagerDao extends ObjectDao<Manager> {

	public boolean findByName(String username);
	public Manager verify(String username,String pass);
	
}

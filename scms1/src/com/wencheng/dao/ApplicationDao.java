package com.wencheng.dao;

import com.wencheng.domain.ApplicationReport;

public interface ApplicationDao {
	
	public boolean create(ApplicationReport domain,int project);
	public ApplicationReport find(int project);

}

package com.wencheng.dao;

import com.wencheng.domain.EndReport;

public interface EndDao extends ObjectDao<EndReport>{

	public boolean create(EndReport domain,int project);
	public EndReport find(int project);
	
}

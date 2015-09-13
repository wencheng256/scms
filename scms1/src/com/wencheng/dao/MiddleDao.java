package com.wencheng.dao;

import com.wencheng.domain.MiddleReport;

public interface MiddleDao extends ObjectDao<MiddleReport>{

	public int create(MiddleReport domain,int project);
	public MiddleReport find(int project);
}

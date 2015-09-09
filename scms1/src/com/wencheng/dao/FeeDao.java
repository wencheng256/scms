package com.wencheng.dao;

import java.util.List;

import com.wencheng.domain.Fee;

public interface FeeDao extends ObjectDao<Fee>{

	public boolean create(Fee domain,int project);
	public List<Fee> list(int project);
	
}

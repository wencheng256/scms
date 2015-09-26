package com.wencheng.dao;

import java.util.List;

import com.wencheng.domain.Journal;

public interface JournalDao extends ObjectDao<Journal> {

	public boolean create(Journal domain,int project,int edit,int type);
	public List<Journal> list(int project);
	public List<Journal> listOther(int project);
	public Journal find(int id,int proj);
	public Journal findOther(int id);
	public boolean update(Journal domain,int project,int edit,int type);
	public int delete(int id);
	
}

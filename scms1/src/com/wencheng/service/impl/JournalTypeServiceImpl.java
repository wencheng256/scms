package com.wencheng.service.impl;

import java.util.List;

import com.wencheng.dao.JournalTypeDao;
import com.wencheng.dao.impl.JournalTypeDaoImpl;
import com.wencheng.domain.Type;
import com.wencheng.service.JournalTypeService;

public class JournalTypeServiceImpl implements JournalTypeService {

	private JournalTypeDao dao = new JournalTypeDaoImpl();
	@Override
	public List<Type> list() {
		// TODO Auto-generated method stub
		return dao.list("Type");
	}

}

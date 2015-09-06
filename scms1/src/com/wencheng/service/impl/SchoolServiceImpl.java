package com.wencheng.service.impl;

import java.util.List;

import com.wencheng.dao.ObjectDao;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.domain.School;
import com.wencheng.service.SchoolService;

public class SchoolServiceImpl implements SchoolService {

	ObjectDao<School> dao = new ObjectDaoImpl<School>();
	@Override
	public List<School> list() {
		return dao.list("School");
	}

}

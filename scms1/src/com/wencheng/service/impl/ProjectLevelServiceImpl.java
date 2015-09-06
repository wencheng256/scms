package com.wencheng.service.impl;

import java.util.List;

import com.wencheng.dao.ObjectDao;
import com.wencheng.dao.impl.ObjectDaoImpl;
import com.wencheng.domain.ProjectLevel;
import com.wencheng.service.ProjectLevelService;

public class ProjectLevelServiceImpl implements ProjectLevelService{

	ObjectDao<ProjectLevel> dao = new ObjectDaoImpl<ProjectLevel>();
	@Override
	public List<ProjectLevel> list() {
		// TODO Auto-generated method stub
		return dao.list("ProjectLevel");
	}

}

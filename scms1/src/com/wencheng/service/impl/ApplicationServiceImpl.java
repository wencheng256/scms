package com.wencheng.service.impl;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.ApplicationDao;
import com.wencheng.dao.impl.ApplicationDaoImpl;
import com.wencheng.domain.ApplicationReport;
import com.wencheng.domain.Project;
import com.wencheng.service.ApplicationService;
import com.wencheng.utils.WebUtils;

public class ApplicationServiceImpl implements ApplicationService {
	
	private ApplicationDao dao = new ApplicationDaoImpl();
	
	@Override
	public boolean create(HttpServletRequest request) {
		if(WebUtils.isSubmit(request)){
			return false;
		}
		ApplicationReport app = new ApplicationReport();
		WebUtils.getBean(app, request);
		Project pro = (Project) request.getSession().getAttribute("project");
		return dao.create(app, pro.getId());
	}
	
}

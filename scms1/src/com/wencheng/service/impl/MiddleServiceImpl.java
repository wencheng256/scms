package com.wencheng.service.impl;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.MiddleDao;
import com.wencheng.dao.impl.MiddleDaoImpl;
import com.wencheng.domain.MiddleReport;
import com.wencheng.domain.Project;
import com.wencheng.service.MiddleService;
import com.wencheng.utils.WebUtils;

public class MiddleServiceImpl implements MiddleService{

	private MiddleDao dao = new MiddleDaoImpl();
	@Override
	public boolean create(HttpServletRequest request) {
		if(WebUtils.isSubmit(request)){
			return false;
		}
		Project pro = (Project) request.getSession().getAttribute("project");
		if(request.getParameter("id") == null){
			if(dao.find(pro.getId()) != null){
				return false;
			}
		}
		MiddleReport domain  = new MiddleReport();
		WebUtils.getBean(domain, request);
		return dao.create(domain, pro.getId())>0;
	}
	@Override
	public MiddleReport find(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Project pro = (Project) request.getSession().getAttribute("project");
		return dao.find(pro.getId());
	}
}

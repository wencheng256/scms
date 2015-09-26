package com.wencheng.service.impl;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.EndDao;
import com.wencheng.dao.impl.EndDaoImpl;
import com.wencheng.domain.EndReport;
import com.wencheng.domain.Project;
import com.wencheng.service.EndService;
import com.wencheng.utils.WebUtils;

public class EndServiceImpl implements EndService{

	private EndDao dao = new EndDaoImpl();
	
	@Override
	public boolean create(HttpServletRequest request) {
		
		Project pro = (Project) request.getSession().getAttribute("project");
		
		if(WebUtils.isSubmit(request)){
			return false;
		}
		if(request.getParameter("id") == null){
			if(dao.find(pro.getId()) != null){
				return false;
			}
		}
		EndReport domain = new EndReport();
		WebUtils.getBean(domain, request);
		return dao.create(domain,pro.getId());
	}
	@Override
	public EndReport find(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Project pro = (Project) request.getSession().getAttribute("project");
		return dao.find(pro.getId());
	}
	@Override
	public EndReport findOther(HttpServletRequest request) {
		String id = request.getParameter("id");
		if(id == null){
			return null;
		}
		return dao.find(Integer.parseInt(id));
	}
}

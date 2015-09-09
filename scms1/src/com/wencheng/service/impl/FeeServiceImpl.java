package com.wencheng.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.FeeDao;
import com.wencheng.dao.impl.FeeDaoImpl;
import com.wencheng.domain.Fee;
import com.wencheng.domain.Project;
import com.wencheng.service.FeeService;
import com.wencheng.utils.WebUtils;

public class FeeServiceImpl implements FeeService {

	private FeeDao dao = new FeeDaoImpl();
	
	@Override
	public boolean create(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Fee domain = new Fee();
		WebUtils.getBean(domain, request);
		String pro = request.getParameter("pro");
		if(pro == null){
			return false;
		}
		return dao.create(domain,Integer.parseInt(pro));
	}

	@Override
	public List<Fee> list(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Object pro = request.getSession().getAttribute("project");
		if(pro == null){
			return null;
		}
		return dao.list(((Project)pro).getId());
	}

	@Override
	public boolean delete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(id == null){
			return false;
		}else{
			return dao.delete(Fee.class, Integer.parseInt(id));
		}
	}

}

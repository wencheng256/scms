package com.wencheng.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.JournalDao;
import com.wencheng.dao.impl.JournalDaoImpl;
import com.wencheng.domain.Journal;
import com.wencheng.domain.Project;
import com.wencheng.service.JournalService;
import com.wencheng.utils.WebUtils;

public class JournalServiceImpl implements JournalService {

	JournalDao dao = new JournalDaoImpl();
	@Override
	public boolean create(HttpServletRequest request) {
		if(WebUtils.isSubmit(request)){
			return false;
		}
		Journal journal = new Journal();
		WebUtils.getBean(journal, request);
		Project pro = (Project) request.getSession().getAttribute("project");
		String edit = request.getParameter("editorid");
		String type = request.getParameter("typeid");
		if(edit == null || type == null){
			return false;
		}
		return dao.create(journal,pro.getId(),Integer.parseInt(edit),Integer.parseInt(type));
	}
	@Override
	public List<Journal> list(HttpServletRequest request){
		Project proj = (Project) request.getSession().getAttribute("project");
		return dao.list(proj.getId());
	}
	@Override
	public Journal find(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(id == null){
			return  null;
		}
		return dao.find(Integer.parseInt(id),((Project)request.getSession().getAttribute("project")).getId());
	}
	@Override
	public boolean update(HttpServletRequest request) {
		// TODO Auto-generated method stub
		if(WebUtils.isSubmit(request)){
			return false;
		}
		Project pro = (Project) request.getSession().getAttribute("project");
		String editorid = request.getParameter("editorid");
		String typeid = request.getParameter("typeid");
		if(editorid == null || typeid == null){
			return false;
		}
		Journal domain = new Journal();
		WebUtils.getBean(domain, request);
		return dao.update(domain,pro.getId(), Integer.parseInt(editorid), Integer.parseInt(typeid));
	}
	@Override
	public int delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		if(id == null){
			return -1;
		}
		return dao.delete(Integer.parseInt(id));
	}
	@Override
	public List<Journal> listOther(HttpServletRequest request) {
		String id = request.getParameter("id");
		if(id == null){
			return null;
		}
		return dao.listOther(Integer.parseInt(id));
	}
	@Override
	public Journal findOther(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(id == null)
			return null;
		return dao.findOther(Integer.parseInt(id));
	}
}

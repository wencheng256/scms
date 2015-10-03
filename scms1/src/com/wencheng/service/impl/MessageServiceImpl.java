package com.wencheng.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wencheng.dao.MessageDao;
import com.wencheng.dao.ProjectDao;
import com.wencheng.dao.impl.MessageDaoImpl;
import com.wencheng.dao.impl.ProjectDaoImpl;
import com.wencheng.domain.Message;
import com.wencheng.domain.Project;
import com.wencheng.service.MessageService;
import com.wencheng.utils.WebUtils;

public class MessageServiceImpl implements MessageService {

	MessageDao dao = new MessageDaoImpl();
	ProjectDao pdao = new ProjectDaoImpl();
	@Override
	public List<Message> list(HttpServletRequest request) {
		Project pro = (Project) request.getSession().getAttribute("project");
		return dao.listpro(pro.getId());
	}
	@Override
	public boolean create(HttpServletRequest request) {
		if(WebUtils.isSubmit(request)){
			return false;
		}
		Message bean = new Message();
		String from = request.getParameter("fromProjectid");
		String to = request.getParameter("toProjectid");
		if(from == null || to == null){
			return false;
		}
		WebUtils.getBean(bean, request);
		Project fromp = pdao.findProject(Integer.parseInt(from));
		Project top = pdao.findProject(Integer.parseInt(to));
		bean.setFromProject(fromp);
		bean.setToProject(top);
		return dao.create(bean);
	}
	@Override
	public boolean delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		if(id == null){
			return false;
		}
		return dao.delete(Message.class, Integer.parseInt(id));
	}
	@Override
	public List<Message> listother(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(id == null||id.equals("null")){
			return null;
		}
		return dao.listpro(Integer.parseInt(id));
	}

}

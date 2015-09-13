package com.wencheng.dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.wencheng.dao.ApplicationDao;
import com.wencheng.domain.ApplicationReport;
import com.wencheng.domain.Project;
import com.wencheng.utils.HibernateUtil;

public class ApplicationDaoImpl implements ApplicationDao {

	@Override
	public boolean create(ApplicationReport domain, int project) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			Project pro = session.load(Project.class, project);
			domain.setProject(pro);
			session.saveOrUpdate(domain);
			ts.commit();
		}finally{
			HibernateUtil.closeSession();
		}
		return true;
	}

}

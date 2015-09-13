package com.wencheng.dao.impl;

import org.hibernate.Query;
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
	@Override
	public ApplicationReport find(int project) {
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct app from ApplicationReport app where app.project.id = :id";
			Query query = session.createQuery(queryString).setInteger("id",project);
			return (ApplicationReport) query.uniqueResult();
		}finally{
			HibernateUtil.closeSession();
		}
	}
}

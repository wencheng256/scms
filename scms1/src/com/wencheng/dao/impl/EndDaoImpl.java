package com.wencheng.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.wencheng.dao.EndDao;
import com.wencheng.domain.EndReport;
import com.wencheng.domain.Project;
import com.wencheng.utils.HibernateUtil;

public class EndDaoImpl extends ObjectDaoImpl<EndReport> implements EndDao {

	@Override
	public boolean create(EndReport domain, int project) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			Project pro = session.load(Project.class, project);
			domain.setProject(pro);
			session.saveOrUpdate(domain);
			ts.commit();
			return true;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public EndReport find(int project) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct e from EndReport e where e.project.id = :id";
			Query query = session.createQuery(queryString).setInteger("id",project);
			return (EndReport) query.uniqueResult();
		}finally{
		}
	}

}

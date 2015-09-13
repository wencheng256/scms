package com.wencheng.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.wencheng.dao.MiddleDao;
import com.wencheng.domain.MiddleReport;
import com.wencheng.domain.Project;
import com.wencheng.utils.HibernateUtil;

public class MiddleDaoImpl extends ObjectDaoImpl<MiddleReport> implements
		MiddleDao {
	@Override
	public int create(MiddleReport domain, int project) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			Project pro = session.load(Project.class,project);
			domain.setProject(pro);
			session.saveOrUpdate(domain);
			ts.commit();
			return 1;
		}catch(HibernateException e){
			e.printStackTrace();
			return -1;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public MiddleReport find(int project) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct m from MiddleReport m where m.project.id = :id";
			Query query = session.createQuery(queryString).setInteger("id", project);
			return (MiddleReport) query.uniqueResult();
		}finally{
			HibernateUtil.closeSession();
		}
	}
}

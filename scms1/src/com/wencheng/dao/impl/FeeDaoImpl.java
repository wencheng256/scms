package com.wencheng.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.wencheng.dao.FeeDao;
import com.wencheng.domain.Fee;
import com.wencheng.domain.Project;
import com.wencheng.utils.HibernateUtil;

public class FeeDaoImpl extends ObjectDaoImpl<Fee> implements FeeDao {

	@Override
	public boolean create(Fee domain,int project) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			Project pro = session.load(Project.class, project);
			domain.setProject(pro);
			session.persist(domain);
			ts.commit();
			return true;
		}catch(HibernateException e){
			e.printStackTrace();
			return false;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public List<Fee> list(int project) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct f from Fee f where f.project.id = :id";
			Query query = session.createQuery(queryString).setInteger("id",project);
			return query.list();			
		}finally{
			HibernateUtil.closeSession();
		}
	}
	
}

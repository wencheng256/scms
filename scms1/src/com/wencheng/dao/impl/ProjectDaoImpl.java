package com.wencheng.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;

import com.wencheng.dao.ProjectDao;
import com.wencheng.domain.Project;
import com.wencheng.utils.HibernateUtil;

public class ProjectDaoImpl extends ObjectDaoImpl<Project> implements ProjectDao {

	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		Session se = HibernateUtil.getSession();
		try{
			String queryString = "select distinct p from Project p where p.name=:name";
			Query query = se.createQuery(queryString);
			query.setString("name", name);
			return query.uniqueResult() != null;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public boolean checkNumber(String number) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select count(p) from Project p where p.number = :number";
			Query query = session.createQuery(queryString);
			query.setString("number",number);
			return (Long)query.uniqueResult()>0;
		}finally{
			HibernateUtil.closeSession();
		}
	}

}

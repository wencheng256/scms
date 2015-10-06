package com.wencheng.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.wencheng.domain.Manager;
import com.wencheng.domain.News;
import com.wencheng.domain.School;
import com.wencheng.utils.HibernateUtil;

public class NewsDaoImpl extends ObjectDaoImpl<News>{
	
	public boolean create(News news,int managerid,String schoolid){
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		Manager m = session.load(Manager.class, managerid);
		if(schoolid != null && schoolid.length()>0){
			School s = session.load(School.class, Integer.parseInt(schoolid));
			news.setSchool(s);
		}
		news.setEdit(m);
		session.persist(news);
		ts.commit();
		return true;
	}
	
	public long getMyRows(int id){
		Session session = HibernateUtil.getSession();
		String queryString = "select count(distinct n) from News n where n.edit.id = :id";
		Query query = session.createQuery(queryString).setInteger("id", id);
		return (Long) query.uniqueResult();
	}
	
	public List<News> listMy(int id,int start,int rows){
		Session session = HibernateUtil.getSession();
		String queryString = "select distinct n from News n where n.edit.id = :id";
		Query query = session.createQuery(queryString).setInteger("id", id).setFirstResult(start).setMaxResults(rows);
		return  query.list();
	}
	public List<News> listType(int start,int rows){
		Session session = HibernateUtil.getSession();
		String queryString = "select distinct n from News n where n.type = 0";
		Query query = session.createQuery(queryString).setFirstResult(start).setMaxResults(rows);
		return  query.list();
	}
	public List<News> listSchool(int school,int start,int rows){
		Session session = HibernateUtil.getSession();
		String queryString = "select distinct n from News n where n.school.id = :school";
		Query query = session.createQuery(queryString).setInteger("school", school).setFirstResult(start).setMaxResults(rows);
		return  query.list();
	}
	

}

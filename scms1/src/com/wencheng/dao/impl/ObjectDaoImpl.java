package com.wencheng.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.wencheng.dao.ObjectDao;
import com.wencheng.utils.HibernateUtil;

public class ObjectDaoImpl<T> implements ObjectDao<T> {

	@Override
	public boolean create(T domain) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			session.save(domain);
			ts.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			return false;
		}finally{
			HibernateUtil.closeSession();
		}
		return true;
	}

	@Override
	public boolean update(T domain) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			session.merge(domain);
			ts.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			return false;
		}finally{
			HibernateUtil.closeSession();
		}
		return true;
	}

	@Override
	public boolean delete(Class<T> cla,int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			String queryString = "DELETE FROM "+cla.getName()+" o WHERE o.id = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id",id);
			if(query.executeUpdate()>0){
				ts.commit();
				return true;
			}else{
				ts.commit();
				return false;
			}
		}catch(HibernateException e){
			e.printStackTrace();
			return false;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public T find(Class<T> cla,int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "SELECT distinct p from "+cla.getName()+" p where id = :id";
			Query query = session.createQuery(queryString).setInteger("id", id);
			return (T) query.uniqueResult();
		}catch(HibernateException e){
			e.printStackTrace();
			return null;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public List<T> list(String name) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "SELECT distinct p from "+name+" p order by p.id";
			Query query = session.createQuery(queryString);
			return query.list();
		}catch(HibernateException e){
			e.printStackTrace();
			return null;
		}finally{
			HibernateUtil.closeSession();
		}
	}

}

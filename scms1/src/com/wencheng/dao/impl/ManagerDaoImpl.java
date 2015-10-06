package com.wencheng.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.wencheng.dao.ManagerDao;
import com.wencheng.domain.Manager;
import com.wencheng.utils.HibernateUtil;

public class ManagerDaoImpl extends ObjectDaoImpl<Manager> implements
		ManagerDao {

	@Override
	public boolean findByName(String username) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		String queryString = "select count (distinct m) from Manager m where m.username = :name";
		Query query = session.createQuery(queryString).setString("name",username);
		return ((Long)query.uniqueResult())>0;
	}

	@Override
	public Manager verify(String username, String pass) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		String queryString = "select distinct m from Manager m where m.username = :name and m.password = :password";
		Query query = session.createQuery(queryString).setString("name", username).setString("password", pass).setMaxResults(1);
		return (Manager) query.uniqueResult();
	}

}

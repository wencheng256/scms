package com.wencheng.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;

import com.wencheng.dao.AccountDao;
import com.wencheng.domain.Account;
import com.wencheng.utils.HibernateUtil;

public class AccountDaoImpl extends ObjectDaoImpl<Account> implements
		AccountDao {

	@Override
	public boolean checkUsername(String username) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select count(a) from Account a where a.username = :name";
			Query query = session.createQuery(queryString);
			query.setString("name", username);
			return (Long)query.uniqueResult() >0;
		}finally{
			HibernateUtil.closeSession();
		}
	}
	@Override
	public Account login(String username, String password) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct a from Account a fetch all properties where a.username = :name and a.password = :password";
			Query query = session.createQuery(queryString);
			query.setString("name",username).setString("password",password);
			return (Account) query.uniqueResult();			
		}finally{
			HibernateUtil.closeSession();
		}
	}
	
}

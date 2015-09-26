package com.wencheng.dao.impl;

import org.hibernate.Session;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

import com.wencheng.dao.PropertiesDao;
import com.wencheng.domain.Properties;
import com.wencheng.utils.HibernateUtil;

public class PropertiesDaoImpl implements PropertiesDao {

	@Override
	public String get(String key) {
		Session session = HibernateUtil.getSession();
		try{
			return (String) session.createCriteria(Properties.class).add(Restrictions.eq("propkey", key)).setProjection(Property.forName("value")).uniqueResult();
		}finally{
			HibernateUtil.closeSession();
		}
	}
}

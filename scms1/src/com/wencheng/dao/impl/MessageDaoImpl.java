package com.wencheng.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.wencheng.dao.MessageDao;
import com.wencheng.domain.Message;
import com.wencheng.utils.HibernateUtil;

public class MessageDaoImpl  extends ObjectDaoImpl<Message>  implements MessageDao{

	@Override
	public List<Message> listpro(int id) {
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct m from Message as m left join m.toProject left join m.fromProject where m.toProject.id = :id order by m.time desc";
			Query query = session.createQuery(queryString).setInteger("id", id).setMaxResults(20);
			return query.list();
		}finally{
			HibernateUtil.closeSession();
		}
	}

}

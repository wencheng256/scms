package com.wencheng.utils;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.wencheng.domain.Project;
import com.wencheng.domain.School;
import com.wencheng.domain.Teacher;


public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String HQLString = "select distinct p from Project p fetch all properties where p.id=:id";
			Query query = session.createQuery(HQLString);
			query.setInteger("id", 1);
			Project pro = (Project) query.uniqueResult();
			System.out.println(pro.getName());
		}finally{
			HibernateUtil.closeSession();
		}
	}
}
